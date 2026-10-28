import QtQuick
import QtQuick.Effects
import Quickshell.Widgets

Item {
  id: root
  required property real imageSize
  required property var imageSource
  required property string color
  property bool addBrightness: false

  width: imageSize
  height: imageSize

  IconImage {
    id: icon
    anchors.centerIn: parent
    source: root.imageSource
    implicitSize: root.imageSize
    visible: false
  }

  MultiEffect {
    source: icon
    anchors.fill: icon

    blurEnabled: false
    shadowEnabled: false
    contrast: root.addBrightness
    brightness: root.addBrightness
    colorization: 1
    colorizationColor: root.color
  }
}
