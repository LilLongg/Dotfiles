pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  readonly property bool isAvailable: weatherFetcher.isAvailable
  readonly property var current_icon: weatherFetcher.current_icon
  readonly property int current_temp: weatherFetcher.current_temp

  Process {
    id: weatherFetcher
    running: true
    command: ["sh", "-c", "$XDG_BIN_HOME/weather-fetcher"]
    stdout: StdioCollector {
      onStreamFinished: {
        if (text.length === 0) {
          weatherFetcher.lastUpdated++;
          if (weatherFetcher.lastUpdated >= weatherFetcher.notUpdatedThreshold) {
            weatherFetcher.current_icon = Quickshell.iconPath("weather-none-available");
            weatherFetcher.isAvailable = false;
          }
          return;
        }

        const data = JSON.parse(text);
        weatherFetcher.current_temp = data["current_temp"];
        weatherFetcher.current_icon = data["current_icon"];
        weatherFetcher.isAvailable = true;
        weatherFetcher.lastUpdated = 0;
      }
    }

    readonly property int notUpdatedThreshold: 48
    property int lastUpdated: 0
    property bool isAvailable: false
    property int current_temp: 0
    property var current_icon: Quickshell.iconPath("weather-none-available")
  }

  Timer {
    running: true
    repeat: true
    interval: Config.weatherSampleIntervalMs
    onTriggered: weatherFetcher.running = true
  }
}
