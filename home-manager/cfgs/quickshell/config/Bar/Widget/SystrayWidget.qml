pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "../../Common"

Repeater {
  id: root
  required property var bar
  model: SystemTray.items

  IconImage {
    id: item
    required property var modelData
    implicitSize: Config.iconSize
    source: modelData.icon

    WrapperMouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      acceptedButtons: Qt.LeftButton | Qt.RightButton
      property alias itemData: item.modelData

      onPressed: mouse => {
        if (itemData.onlyMenu) {
          _displayMenu();
          return;
        }

        if (mouse.button === Qt.LeftButton) {
          itemData.activate();
          return;
        }

        if (itemData.hasMenu) {
          _displayMenu();
          return;
        }

        itemData.secondaryActivate();
      }

      function _displayMenu() {
        const globalPos = item.mapToGlobal(0, 0);
        itemData.display(root.bar, globalPos.x, Config.barHeight);
      }
    }
  }
}
