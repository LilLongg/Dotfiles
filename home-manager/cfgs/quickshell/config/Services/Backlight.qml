pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  readonly property var brightnessLevels: ["low", "medium", "high"]
  property int brightness: 0
  property int maxBrightness: 0
  property real brightnessPercentage: brightness / maxBrightness || 0
  property string brightnessLevel: brightnessLevels[Math.trunc((brightnessPercentage - 0.01) * brightnessLevels.length)]
  property string icon: "display-brightness-" + brightnessLevel + "-symbolic"

  Process {
    id: getBrightness
    running: true
    command: ["brightnessctl", "get"]
    stdout: StdioCollector {
      onStreamFinished: {
        const brightness = parseInt(text);
        root.brightness = brightness;
      }
    }
  }

  Process {
    id: getMaxBrightness
    running: true
    command: ["brightnessctl", "max"]
    stdout: StdioCollector {
      onStreamFinished: {
        const maxBrightness = parseInt(text);
        root.maxBrightness = maxBrightness;
      }
    }
  }

  Process {
    running: true
    command: ["sh", "-c", "inotifywait -e modify -m -q /sys/class/backlight/*/actual_brightness"]
    stdout: SplitParser {
      onRead: getBrightness.running = true
    }
  }
}
