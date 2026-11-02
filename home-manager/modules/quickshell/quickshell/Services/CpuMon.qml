pragma Singleton

import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  id: root
  readonly property var tempThresholds: [
    {
      "threshold": 75,
      "status": Config.Status.Critical,
      "icon": ""
    },
    {
      "threshold": 60,
      "status": Config.Status.Warning,
      "icon": ""
    },
    {
      "threshold": 0,
      "status": Config.Status.Normal,
      "icon": ""
    },
  ]
  property int temp: 40
  property var tempIcon: {
    for (const tempThreshold of root.tempThresholds) {
      if (temp >= tempThreshold["threshold"]) {
        return tempThreshold["icon"];
      }
    }
  }
  property var tempStatus: {
    for (const tempThreshold of root.tempThresholds) {
      if (temp >= tempThreshold["threshold"]) {
        return tempThreshold["status"];
      }
    }
  }

  property int load: 0
  property int loadCritical: 80
  property var loadStatus: load >= loadCritical ? Config.Status.Critical : Config.Status.Normal

  Process {
    running: true
    command: ["sh", "-c", `$XDG_BIN_HOME/cpu-monitor ${Config.sampleIntervalS}`]
    stdout: SplitParser {
      onRead: data => {
        const parsedData = JSON.parse(data);
        const temp = parsedData["temp"];
        const load = parsedData["load"];
        root.temp = temp;
        root.load = load;
      }
    }
  }
}
