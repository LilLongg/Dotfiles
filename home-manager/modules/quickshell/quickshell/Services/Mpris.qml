pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import "../Common"

Singleton {
  id: root
  readonly property string playerName: playerFetcher.text()
  readonly property string dbusPrefix: "org.mpris.MediaPlayer2."
  readonly property var player: Mpris.players.values.filter(player => player.dbusName.startsWith(playerName, dbusPrefix.length))[0]
  readonly property var playerIcon: Quickshell.iconPath(playerName, "media-player-48")
  readonly property bool isAvailable: player != null
  readonly property bool isPlaying: player?.isPlaying ?? false
  readonly property bool isStopped: isAvailable && player.playbackState === MprisPlaybackState.Stopped
  property real position: 0
  property real length: 0
  readonly property real percentage: {
    if (isStopped)
      return 0;
    if (length === 0)
      return +isPlaying;
    return position / length;
  }
  readonly property var statusIcon: {
    if (isStopped)
      return Quickshell.iconPath("stock_media-stop");
    if (!isPlaying)
      return Quickshell.iconPath("stock_media-pause");
    return length === 0 ? Quickshell.iconPath("stock_media-rec") : Quickshell.iconPath("stock_media-play");
  }
  readonly property bool isLooping: !isStopped && player.loopState === MprisLoopState.Track
  readonly property bool isShuffled: !isStopped && player.shuffle
  readonly property string fieldSeparator: " | "
  readonly property string album: player?.trackAlbum ?? ""
  readonly property string artist: player?.trackAlbumArtist || (player?.trackArtist ?? "")
  readonly property string displayText: {
    if (isStopped)
      return "Media stopped";
    return `${artist ? artist + fieldSeparator : ""}${player?.trackTitle || "Unknown Title"}${album ? fieldSeparator + album : ""}`;
  }
  readonly property int maxTextWidth: Config.fontSize * 30

  Process {
    running: true
    command: ["sh", "-c", "$XDG_DATA_HOME/scripts/playerctl-follow.py \"{{position}}|{{mpris:length}}\""]
    stdout: SplitParser {
      onRead: data => {
        const [positionData, lengthData] = data.split("|");
        root.position = (parseInt(positionData) || 0) / 1000000;
        root.length = (parseInt(lengthData) || 0) / 1000000;
      }
    }
  }

  FileView {
    id: playerFetcher
    path: Qt.resolvedUrl("/tmp/mpris-monitor/default-player.txt")
    watchChanges: true
    onFileChanged: reload()
  }
}
