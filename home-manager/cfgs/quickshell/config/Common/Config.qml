pragma Singleton

import QtQuick
import Quickshell

Singleton {
  readonly property string font: "Maple Mono NF CN"
  readonly property var fontWeight: Font.DemiBold
  readonly property int fontSize: 12
  readonly property int iconSize: fontSize * 1.5
  readonly property int borderSize: 2
  readonly property int barMargin: 4
  readonly property int barHeight: fontSize * 3
  readonly property real spacing: fontSize / 1.25
  readonly property real wrapperMargin: fontSize / 2
  readonly property int workspaceMargin: 1
  readonly property int borderRadius: 10
  readonly property real opacity: 0.9
  readonly property real inactiveOpacity: 0.3
  readonly property int animationDurationMs: 300
}
