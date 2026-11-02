import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import "../../Common"

IconImage {
  source: Quickshell.iconPath("nix-snowflake")
  implicitSize: Config.fontSize * 2

  WrapperMouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onPressed: mouse => {
      if (mouse.button === Qt.LeftButton)
        appLauncher.running = true;
      else
        wppSelector.running = true;
    }
  }

  Process {
    id: appLauncher
    running: false
    command: ["rofi", "-show", "drun"]
  }

  Process {
    id: wppSelector
    running: false
    command: ["sh", "-c", "$XDG_BIN_HOME/select-wpp"]
  }
}
