pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  Process {
    id: wppFetcher
    running: true
    command: ["sh", "-c", "readlink ~/.current_wpp"]
    stdout: StdioCollector {
      onStreamFinished: {
        wppFetcher.wallpaper = text.trim();
      }
    }

    property string wallpaper: ""
  }

  Process {
    id: themeFetcher
    running: true
    command: ["sh", "-c", "cat $XDG_CONFIG_HOME/quickshell/Common/colors.json"]
    stdout: StdioCollector {
      onStreamFinished: {
        if (text.trim() === "")
          return;

        const theme = JSON.parse(text);
        themeFetcher.scheme = theme["scheme"];
        themeFetcher.black = theme["black"];
        themeFetcher.blue = theme["blue"];
        themeFetcher.brown = theme["brown"];
        themeFetcher.green = theme["green"];
        themeFetcher.orange = theme["orange"];
        themeFetcher.purple = theme["purple"];
        themeFetcher.red = theme["red"];
        themeFetcher.white = theme["white"];
        themeFetcher.yellow = theme["yellow"];
        themeFetcher.color0 = theme["color0"];
        themeFetcher.color1 = theme["color1"];
        themeFetcher.color2 = theme["color2"];
        themeFetcher.color3 = theme["color3"];
        themeFetcher.color4 = theme["color4"];
        themeFetcher.color5 = theme["color5"];
        themeFetcher.color6 = theme["color6"];
        themeFetcher.color7 = theme["color7"];
        themeFetcher.accent = theme["accent"];
        themeFetcher.foreground = theme["foreground"];
        themeFetcher.background = theme["background"];
        themeFetcher.coloredBackground = theme["coloredBackground"];
        themeFetcher.secondaryBackground = theme["secondaryBackground"];
        themeFetcher.wppPreview = theme["wppPreview"];
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
    property string color7: "#ffffff"
    property string accent: "#add8e6"
    property string foreground: "#ffffff"
    property string background: "#000000"
    property string coloredBackground: "#87cefa"
    property string secondaryBackground: "#808080"
    property string wppPreview: ""
  }

  readonly property string scheme: themeFetcher.scheme
  readonly property string black: themeFetcher.black
  readonly property string blue: themeFetcher.blue
  readonly property string brown: themeFetcher.brown
  readonly property string green: themeFetcher.green
  readonly property string orange: themeFetcher.orange
  readonly property string purple: themeFetcher.purple
  readonly property string red: themeFetcher.red
  readonly property string white: themeFetcher.white
  readonly property string yellow: themeFetcher.yellow
  readonly property string color0: themeFetcher.color0
  readonly property string color1: themeFetcher.color1
  readonly property string color2: themeFetcher.color2
  readonly property string color3: themeFetcher.color3
  readonly property string color4: themeFetcher.color4
  readonly property string color5: themeFetcher.color5
  readonly property string color6: themeFetcher.color6
  readonly property string color7: themeFetcher.color7
  readonly property string accent: themeFetcher.accent
  readonly property string foreground: themeFetcher.foreground
  readonly property string background: themeFetcher.background
  readonly property string coloredBackground: themeFetcher.coloredBackground
  readonly property string secondaryBackground: themeFetcher.secondaryBackground
  readonly property string wppPreview: themeFetcher.wppPreview
  readonly property string wallpaper: wppFetcher.wallpaper

  function addOpacity(color: string, opacity: real): string {
    return "#" + Math.round(opacity * 255).toString(16) + color.slice(1);
  }
}
