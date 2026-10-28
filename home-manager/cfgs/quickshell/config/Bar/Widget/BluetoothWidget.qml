pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import "../../Common"

RowLayout {
  id: root
  spacing: Config.spacing
  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property var connections: adapter?.devices.values.filter(connection => connection.connected) ?? []
  readonly property bool isEnabled: adapter?.enabled ?? false
  readonly property bool isConnected: connections.length

  RowLayout {
    visible: !root.isConnected

    PercentageColoredSvg {
      imageSource: Quickshell.iconPath("bluetooth-disabled-symbolic")
      imageSize: Config.fontSize
      strokeSize: Config.borderSize
      percentage: 0
      color: Theme.blue
    }

    DisplayText {
      text: root.isEnabled ? "off" : "disabled"
      color: Theme.blue
    }
  }

  Repeater {
    visible: root.isConnected
    model: root.connections

    RowLayout {
      id: connection
      spacing: Config.barMargin
      required property var modelData

      PercentageColoredSvg {
        imageSource: Quickshell.iconPath(connection.modelData.icon, "bluetooth-active-symbolic")
        imageSize: Config.fontSize
        strokeSize: Config.borderSize
        percentage: !connection.modelData.batteryAvailable ? 0 : connection.modelData.battery
        color: Theme.blue
        addBrightness: Theme.scheme === "light"
      }

      DisplayText {
        text: connection.modelData.name
        color: Theme.blue
      }
    }
  }
}
