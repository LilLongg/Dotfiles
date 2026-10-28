pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Widgets
import "../../Common"
import "../../Services"

RowLayout {
  id: root
  spacing: Config.barMargin
  readonly property string defaultPlayerName: DefaultMprisPlayer.playerName
  readonly property string dbusPrefix: "org.mpris.MediaPlayer2."
  readonly property var defaultPlayer: Mpris.players.values.filter(player => player.dbusName.startsWith(defaultPlayerName, dbusPrefix.length))[0]
  readonly property bool isPlaying: defaultPlayer?.isPlaying ?? false
  readonly property bool isStopped: (defaultPlayer?.playbackState ?? MprisPlaybackState.Paused) === MprisPlaybackState.Stopped
  readonly property bool positionCalculatable: DefaultMprisPlayer.length
  readonly property real positionPercentage: isStopped ? 0 : (positionCalculatable ? DefaultMprisPlayer.position / DefaultMprisPlayer.length : isPlaying)
  readonly property string fieldSeparator: " | "
  readonly property string album: defaultPlayer?.trackAlbum ?? ""
  readonly property string artist: defaultPlayer?.trackAlbumArtist || (defaultPlayer?.trackArtist ?? "")
  readonly property string displayText: isStopped ? "Media stopped" : (artist ? artist + fieldSeparator : "") + (defaultPlayer?.trackTitle || "Unknown Title") + (album ? fieldSeparator + album : "")
  readonly property int maxTextWidth: Config.fontSize * 30

  PercentageColoredSvg {
    imageSource: root.isStopped ? Quickshell.iconPath("stock_media-stop") : (!root.isPlaying ? Quickshell.iconPath("stock_media-pause") : (root.positionCalculatable ? Quickshell.iconPath("stock_media-play") : Quickshell.iconPath("stock_media-rec")))
    imageSize: Config.fontSize
    strokeSize: Config.borderSize
    percentage: root.positionPercentage
    color: Theme.accent
    addBrightness: Theme.scheme === "light"
  }

  SelfScrollingText {
    maxWidth: root.maxTextWidth
    text: root.displayText
    textColor: Theme.accent
  }

  ColoredSvg {
    imageSource: Quickshell.iconPath("media-playlist-repeat-song-symbolic-rtl")
    imageSize: Config.iconSize
    color: Theme.accent
    addBrightness: true
    visible: !root.isStopped && ((root.defaultPlayer?.loopState ?? MprisLoopState.None) === MprisLoopState.Track)
  }

  ColoredSvg {
    imageSource: Quickshell.iconPath("media-playlist-shuffle-symbolic-rtl")
    imageSize: Config.iconSize
    color: Theme.accent
    addBrightness: true
    visible: !root.isStopped && (root.defaultPlayer?.shuffle ?? false)
  }

  IconImage {
    implicitSize: Config.iconSize
    source: Quickshell.iconPath(root.defaultPlayerName, "media-player-48")
  }
}
