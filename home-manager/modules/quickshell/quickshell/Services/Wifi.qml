pragma Singleton

import Quickshell
import Quickshell.Networking

Singleton {
  readonly property var wifiDevice: Networking.devices.values.filter(device => device.type == DeviceType.Wifi)[0]
  readonly property var connection: wifiDevice?.networks.values.filter(network => network.connected)[0]
  readonly property bool isEnabled: Networking.wifiEnabled
  readonly property bool isConnecting: wifiDevice?.state === ConnectionState.Connecting
  readonly property bool isConnected: connection != null
  readonly property real wifiStrength: !isConnected ? 0 : connection?.signalStrength ?? 0
  readonly property var icon: {
    if (isConnecting)
      return Quickshell.iconPath("network-wireless-acquiring-symbolic");
    if (!isConnected)
      return Quickshell.iconPath("netowrk-wireless-disabled-symbolic");

    const wifiStrengthLevels = ["weak", "ok", "good"];
    const wifiStrengthLevelIdx = Math.trunc((wifiStrength - 0.01) * wifiStrengthLevels.length);
    return Quickshell.iconPath(`network-wireless-signal-${wifiStrengthLevels[wifiStrengthLevelIdx]}-symbolic`);
  }
  readonly property string displayText: {
    if (!isEnabled)
      return "disabled";
    if (isConnecting)
      return "connecting...";
    if (!isConnected)
      return "off";

    return connection?.name ?? "Unknown wifi";
  }
}
