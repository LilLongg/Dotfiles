import QtQuick.Layouts
import Quickshell
import Quickshell.Networking
import "../../Common"

RowLayout {
  id: root
  spacing: Config.barMargin
  readonly property var wifiDevice: Networking.devices.values.filter(device => device.type == DeviceType.Wifi)[0]
  readonly property var connection: wifiDevice?.networks.values.filter(network => network.connected)[0]
  readonly property bool isEnabled: Networking.wifiEnabled
  readonly property bool isConnecting: wifiDevice?.state === ConnectionState.Connecting
  readonly property bool isConnected: wifiDevice?.connected ?? false
  readonly property bool isActive: isEnabled && isConnected
  readonly property var wifiStrengthStatuses: ["weak", "ok", "good"]
  readonly property string wifiStrengthStatus: wifiStrengthStatuses[Math.trunc((wifiStrength - 0.01) * wifiStrengthStatuses.length)]
  readonly property string activeIcon: "network-wireless-signal-" + wifiStrengthStatus + "-symbolic"
  readonly property string inactiveIcon: "network-wireless-disabled-symbolic"
  readonly property string connectingIcon: "network-wireless-acquiring-symbolic"
  readonly property string icon: isConnecting ? connectingIcon : (!isActive ? inactiveIcon : activeIcon)
  readonly property string displayText: !isEnabled ? "disabled" : (isConnecting ? "connecting..." : (!isConnected ? "off" : connection?.name ?? "wifi"))
  readonly property real wifiStrength: !isActive ? 0 : connection?.signalStrength ?? 0

  PercentageColoredSvg {
    imageSource: Quickshell.iconPath(root.icon)
    imageSize: Config.fontSize
    strokeSize: Config.borderSize
    percentage: root.wifiStrength
    color: Theme.purple
  }

  DisplayText {
    text: root.displayText
    color: Theme.purple
  }
}
