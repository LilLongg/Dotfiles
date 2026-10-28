pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  Process {
    running: true
    command: ["sh", "-c", "readlink ~/.current_wpp"]
    stdout: StdioCollector {
      onStreamFinished: {
        root.wallpaper = text.trim();
      }
    }
  }

  Process {
    running: true
    command: ["sh", "-c", "cat $XDG_CONFIG_HOME/quickshell/Common/colors.json"]
    stdout: StdioCollector {
      onStreamFinished: {
        if (text.trim() === "")
          return;
        const theme = JSON.parse(text);
        root.scheme = theme["scheme"];
        root.black = theme["black"];
        root.blue = theme["blue"];
        root.brown = theme["brown"];
        root.green = theme["green"];
        root.orange = theme["orange"];
        root.purple = theme["purple"];
        root.red = theme["red"];
        root.white = theme["white"];
        root.yellow = theme["yellow"];
        root.color0 = theme["color0"];
        root.color1 = theme["color1"];
        root.color2 = theme["color2"];
        root.color3 = theme["color3"];
        root.color4 = theme["color4"];
        root.color5 = theme["color5"];
        root.color6 = theme["color6"];
        root.color7 = theme["color7"];
        root.accent = theme["accent"];
        root.foreground = theme["foreground"];
        root.background = theme["background"];
        root.coloredText = theme["coloredText"];
        root.coloredBackground = theme["coloredBackground"];
        root.secondaryBackground = theme["secondaryBackground"];
        root.wppPreview = theme["wallpaper"];
      }
    }
  }

  property string scheme: "dark"
  property string black: "black"
  property string blue: "blue"
  property string brown: "brown"
  property string green: "green"
  property string orange: "orange"
  property string purple: "purple"
  property string red: "red"
  property string white: "white"
  property string yellow: "yellow"
  property string color0: "#000000"
  property string color1: "#ff0000"
  property string color2: "#008000"
  property string color3: "#ffff00"
  property string color4: "#0000ff"
  property string color5: "#800080"
  property string color6: "#00ffff"
  property string color7: "fffff"
  property string accent: "#add8e6"
  property string foreground: "#ffffff"
  property string background: "#000000"
  property string coloredText: "#ffffff"
  property string coloredBackground: "#87cefa"
  property string secondaryBackground: "#808080"
  property string wppPreview: ""
  property string wallpaper: ""

  function addOpacity(color: string, opacity: real): string {
    return "#" + Math.round(opacity * 255).toString(16) + color.slice(1);
  }
}
