import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "../../Common"
import "../../Services"

RowLayout {
  id: wsRow
  required property string monitor
  spacing: Config.workspaceMargin

  Repeater {
    model: Workspaces.tagData[wsRow.monitor]?.filter(tag => tag["active"] || tag["focused"]) || [
      {
        "index": 1
      }
    ]
    BarWrapper {
      id: ws
      required property var modelData
      readonly property bool isUrgent: modelData["urgent"] ?? false
      readonly property bool isFocused: modelData["focused"] ?? false
      readonly property var index: modelData["index"]
      property real textOpacity: isUrgent || isFocused ? 1.0 : Config.inactiveOpacity
      property string baseColor: isUrgent ? Theme.color1 : "transparent"

      border.width: 0
      color: baseColor

      WrapperMouseArea {
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        hoverEnabled: true

        onEntered: {
          if (!ws.isUrgent)
            ws.color = Theme.coloredBackground;
          wsText.opacity = 1.0;
        }
        onExited: {
          ws.color = ws.baseColor;
          wsText.opacity = ws.textOpacity;
        }

        onClicked: mouse => {
          if (mouse.button == Qt.LeftButton) {
            Workspaces.gotoWorkspace(ws.index);
          } else {
            Workspaces.toggleWorkspace(ws.index);
          }
        }

        DisplayText {
          id: wsText
          text: Workspaces.tagIconMap[ws.index] ?? ws.index
          color: Theme.foreground
          opacity: ws.textOpacity
        }
      }
    }
  }
}
