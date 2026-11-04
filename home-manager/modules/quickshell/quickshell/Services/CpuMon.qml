pragma Singleton

import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  property int temp: cpuStatsFetcher.temp
  property var tempIcon: {
    const tempThresholds = [
      {
        "threshold": 75,
        "icon": ""
      },
      {
        "threshold": 60,
        "icon": ""
      },
      {
        "threshold": 0,
        "icon": ""
      },
    ];
    for (const tempThreshold of tempThresholds) {
      if (temp >= tempThreshold["threshold"]) {
        return tempThreshold["icon"];
      }
    }
  }
  property var tempStatus: {
    const tempThresholds = [
      {
        "threshold": 75,
        "status": Config.Status.Critical
      },
      {
        "threshold": 60,
        "status": Config.Status.Warning
      },
      {
        "threshold": 0,
        "status": Config.Status.Normal
      },
    ];
    for (const tempThreshold of tempThresholds) {
      if (temp >= tempThreshold["threshold"]) {
        return tempThreshold["status"];
      }
    }
  }

  property int load: cpuStatsFetcher.load
  property var loadStatus: load < 80 ? Config.Status.Normal : Config.Status.Critical

  Process {
    id: cpuStatsFetcher
    running: true
    command: ["sh", "-c", `$XDG_BIN_HOME/cpu-monitor ${Config.sampleIntervalS}`]
    stdout: SplitParser {
      onRead: data => {
        const parsedData = JSON.parse(data);
        const temp = parsedData["temp"];
        const load = parsedData["load"];
        cpuStatsFetcher.temp = temp;
        cpuStatsFetcher.load = load;
      }
    }

    property int temp: 40
    property int load: 0
  }
}
