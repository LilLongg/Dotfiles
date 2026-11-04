import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../Common"
import "../../Services"

RowLayout {
  id: root
  spacing: Config.spacing

  RowLayout {
    visible: !Bluetooth.isConnected

    PercentageColoredSvg {
      imageSource: Quickshell.iconPath("bluetooth-disabled-symbolic")
      imageSize: Config.fontSize
      percentage: 0
      color: Theme.blue
    }

    DisplayText {
      text: Bluetooth.isEnabled ? "off" : "disabled"
      color: Theme.blue
    }
  }

  Repeater {
    visible: Bluetooth.isConnected
    model: Bluetooth.connections

    RowLayout {
      id: connection
      spacing: Config.barMargin
      required property var modelData

      PercentageColoredSvg {
        imageSource: Quickshell.iconPath(connection.modelData.icon, "bluetooth-active-symbolic")
        imageSize: Config.fontSize
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
