pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  id: root
  readonly property var batThresholds: [
    {
      "threshold": 30,
      "status": Config.Status.Normal
    },
    {
      "threshold": 20,
      "status": Config.Status.Warning
    },
    {
      "threshold": 0,
      "status": Config.Status.Critical
    },
  ]
  property int bat: 100
  property var icon: {
    if (root.isCharging)
      return Quickshell.iconPath("battery_plugged");

    return Quickshell.iconPath(`battery-${String(Math.trunc(bat / 10) * 10).padStart(3, '0')}-symbolic`);
  }
  property var status: {
    for (const batThreshold of root.batThresholds) {
      if (bat > batThreshold["threshold"]) {
        return batThreshold["status"];
      }
    }
  }
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
    interval: Config.sampleIntervalMs
    onTriggered: {
      getBat.running = true;
      getChargingStatus.running = true;
    }
  }
}
