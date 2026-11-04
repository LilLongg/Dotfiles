pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property var connections: adapter?.devices.values.filter(connection => connection.connected) ?? []
  readonly property bool isEnabled: adapter?.enabled ?? false
  readonly property bool isConnected: connections.length !== 0
}
