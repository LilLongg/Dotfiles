pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  id: root
  property bool isFirstRun: true
  property bool isAvailable: false
  property int updateThreshold: 48
  property int lastUpdated: 0
  property var current_icon: Quickshell.iconPath("weather-none-available")
  property int current_temp: 0

  Process {
    id: weatherFetcher
    running: true
    command: ["sh", "-c", "$XDG_BIN_HOME/weather-fetcher"]
    stdout: StdioCollector {
      onStreamFinished: {
        root.isFirstRun = false;
        if (text.length === 0) {
          root.lastUpdated++;
          if (root.lastUpdated >= root.updateThreshold) {
            root.current_icon = Quickshell.iconPath("weather-none-available");
            root.isAvailable = false;
          }
          return;
        }

        const data = JSON.parse(text);
        root.current_temp = data["current_temp"];
        root.current_icon = data["current_icon"];
        root.isAvailable = true;
        root.lastUpdated = 0;
      }
    }
  }

  Timer {
    running: true
    repeat: true
    interval: Config.weatherSampleIntervalMs
    onTriggered: weatherFetcher.running = true
  }
}
