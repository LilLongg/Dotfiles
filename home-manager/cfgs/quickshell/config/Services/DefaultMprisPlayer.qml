pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  readonly property string playerName: playerName.text()
  property real position: 0
  property real length: 0

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
    id: playerName
    path: Qt.resolvedUrl("/tmp/mpris-monitor/default-player.txt")
    watchChanges: true
    onFileChanged: reload()
  }
}
