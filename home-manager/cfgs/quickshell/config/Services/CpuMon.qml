pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  readonly property var tempThresholds: [
    {
      "threshold": 75,
      "status": ServicesConfig.Status.Critical,
      "icon": " "
    },
    {
      "threshold": 60,
      "status": ServicesConfig.Status.Warning,
      "icon": " "
    },
    {
      "threshold": 0,
      "status": ServicesConfig.Status.Normal,
      "icon": " "
    },
  ]
  property int temp: 40
  property string tempIcon: " "
  property var tempStatus: ServicesConfig.Status.Normal
  property int load: 0
  property int loadCritical: 80
  property var loadStatus: ServicesConfig.Status.Normal
  property string loadIcon: " "

  Process {
    running: true
    command: ["sh", "-c", "$XDG_DATA_HOME/scripts/cpu-monitor.py " + ServicesConfig.sampleIntervalS]
    stdout: SplitParser {
      onRead: data => {
        const parsedData = JSON.parse(data);
        const temp = parsedData["temp"];
        const load = parsedData["load"];
        root.temp = temp;
        root.load = load;

        if (load >= root.loadCritical)
          root.loadStatus = ServicesConfig.Status.Critical;
        else
          root.loadStatus = ServicesConfig.Status.Normal;

        for (const tempThreshold of root.tempThresholds) {
          if (temp >= tempThreshold["threshold"]) {
            root.tempIcon = tempThreshold["icon"];
            root.tempStatus = tempThreshold["status"];
            break;
          }
        }
      }
    }
  }
}
