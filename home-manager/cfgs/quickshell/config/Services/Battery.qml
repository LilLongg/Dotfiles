pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  readonly property var iconMap: ["󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ", "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", "󰁹 "]
  readonly property var batThresholds: [
    {
      "threshold": 30,
      "status": ServicesConfig.Status.Normal
    },
    {
      "threshold": 20,
      "status": ServicesConfig.Status.Warning
    },
    {
      "threshold": 0,
      "status": ServicesConfig.Status.Critical
    },
  ]
  property int bat: 0
  property string icon: root.isCharging ? " " : iconMap[Math.trunc((bat - 1) * iconMap.length / 100)]
  property var status: ServicesConfig.Status.Normal
  property bool isCharging: false
  property bool isAvailable: true

  Process {
    id: getBat
    running: true
    command: ["sh", "-c", "cat /sys/class/power_supply/BAT*/capacity"]
    stdout: StdioCollector {
      onStreamFinished: {
        if (text == "") {
          root.isAvailable = false;
          return;
        }
        const bat = parseInt(text);
        root.bat = bat;
        root.isAvailable = true;

        for (const batThreshold of root.batThresholds) {
          if (bat > batThreshold["threshold"]) {
            root.status = batThreshold["status"];
            break;
          }
        }
      }
    }
  }

  Process {
    id: getChargingStatus
    running: true
    command: ["cat", "/sys/class/power_supply/ACAD/online"]
    stdout: StdioCollector {
      onStreamFinished: root.isCharging = parseInt(text)
    }
  }

  Timer {
    running: true
    repeat: true
    interval: ServicesConfig.sampleIntervalMs
    onTriggered: {
      getBat.running = true;
      getChargingStatus.running = true;
    }
  }
}
