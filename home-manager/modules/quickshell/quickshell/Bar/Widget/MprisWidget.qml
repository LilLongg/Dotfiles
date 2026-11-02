import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "../../Common"
import "../../Services"

RowLayout {
  spacing: Config.barMargin

  PercentageColoredSvg {
    imageSource: Mpris.statusIcon
    imageSize: Config.fontSize
    percentage: Mpris.percentage
    color: Theme.accent
    addBrightness: Theme.scheme === "light"
  }

  SelfScrollingText {
    maxWidth: Mpris.maxTextWidth
    text: Mpris.displayText
    textColor: Theme.accent
  }

  ColoredSvg {
    imageSource: Quickshell.iconPath("media-playlist-repeat-song-symbolic-rtl")
    imageSize: Config.iconSize
    color: Theme.accent
    addBrightness: true
    visible: Mpris.isLooping
  }

  ColoredSvg {
    imageSource: Quickshell.iconPath("media-playlist-shuffle-symbolic-rtl")
    imageSize: Config.iconSize
    color: Theme.accent
    addBrightness: true
    visible: Mpris.isShuffled
  }

  IconImage {
    implicitSize: Config.iconSize
    source: Mpris.playerIcon
  }
}
