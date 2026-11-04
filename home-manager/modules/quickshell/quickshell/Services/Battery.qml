pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  readonly property bool isCharging: chargingStatusFetcher.isCharging
  readonly property bool isAvailable: batteryNameFetcher.isAvailable
  readonly property int bat: batteryFetcher.bat
  readonly property var icon: {
    if (isCharging)
      return Quickshell.iconPath("ac-adapter-symbolic");

    return Quickshell.iconPath(`battery-${String(Math.trunc(bat / 10) * 10).padStart(3, '0')}-symbolic`);
  }
  readonly property var status: {
    const batThresholds = [
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
    ];
    for (const batThreshold of batThresholds) {
      if (bat > batThreshold["threshold"]) {
        return batThreshold["status"];
      }
    }
  }

  Process {
    id: batteryFetcher
    running: false
    command: ["cat", `${batteryPath}/capacity`]
    stdout: StdioCollector {
      onStreamFinished: batteryFetcher.bat = parseInt(text)
    }

    property string batteryPath: ""
    property int bat: 0
  }

  Process {
    id: chargingStatusFetcher
    running: false
    command: ["cat", "/sys/class/power_supply/ACAD/online"]
    stdout: StdioCollector {
      onStreamFinished: chargingStatusFetcher.isCharging = parseInt(text)
    }

    property bool isCharging: false
  }

  Process {
    id: batteryNameFetcher
    running: true
    command: ["find", "/sys/class/power_supply", "-maxdepth", "1", "-name", "BAT*"]
    stdout: StdioCollector {
      onStreamFinished: {
        if (text === "")
          return;

        batteryNameFetcher.isAvailable = true;
        batteryFetcher.batteryPath = text.trim();
        batteryFetcher.running = true;
        chargingStatusFetcher.running = true;
        batterySampleTimer.running = true;
      }
    }

    property bool isAvailable: false
  }

  Timer {
    id: batterySampleTimer
    running: false
    repeat: true
    interval: Config.sampleIntervalMs
    onTriggered: {
      batteryFetcher.running = true;
      chargingStatusFetcher.running = true;
    }
  }
}
