import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import "../../Common"

ColoredSvg {
  imageSource: Quickshell.iconPath("system-shutdown-symbolic")
  imageSize: Config.iconSize
  color: Theme.red
  addBrightness: true

  WrapperMouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onPressed: mouse => {
      if (mouse.button === Qt.LeftButton)
        lockLauncher.running = true;
      else
        lockSelector.running = true;
    }
  }

  Process {
    id: lockLauncher
    running: false
    command: ["hyprlock"]
  }

  Process {
    id: lockSelector
    running: false
    command: ["wleave"]
  }
}
