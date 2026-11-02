import QtQuick

PercentageCircle {
  id: root
  required property var imageSource
  property alias imageSize: root.itemSize
  property bool addBrightness: false

  ColoredSvg {
    anchors.fill: parent
    imageSource: root.imageSource
    imageSize: root.imageSize
    color: root.color
    addBrightness: root.addBrightness
  }
}
