pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
  readonly property real brightnessPercentage: brightnessFetcher.brightness / maxBrightnessFetcher.maxBrightness || 0
  readonly property var icon: {
    const brightnessLevels = ["low", "medium", "high"];
    const brightnessLevelIdx = Math.trunc((brightnessPercentage - 0.01) * brightnessLevels.length);
    return Quickshell.iconPath(`display-brightness-${brightnessLevels[brightnessLevelIdx]}-symbolic`);
  }

  Process {
    id: brightnessFetcher
    running: true
    command: ["brightnessctl", "get"]
    stdout: StdioCollector {
      onStreamFinished: {
        brightnessFetcher.brightness = parseInt(text);
        backlightListener.running = true;
      }
    }

    property int brightness: 0
  }

  Process {
    id: maxBrightnessFetcher
    running: true
    command: ["brightnessctl", "max"]
    stdout: StdioCollector {
      onStreamFinished: maxBrightnessFetcher.maxBrightness = parseInt(text)
    }

    property int maxBrightness: 0
  }

  Process {
    id: backlightListener
    running: false
    command: ["sh", "-c", "inotifywait -e modify -m -q /sys/class/backlight/*/actual_brightness"]
    stdout: SplitParser {
      onRead: brightnessFetcher.running = true
    }
  }
}
