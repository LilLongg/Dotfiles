import QtQuick
import QtQuick.Shapes

Item {
  id: root
  required property real itemSize
  required property real strokeSize
  required property string color
  required property real percentage

  width: itemSize * 2
  height: itemSize * 2

  Shape {
    anchors.fill: parent
    layer.enabled: true
    layer.samples: 4

    ShapePath {
      strokeColor: Theme.addOpacity(root.color, Config.inactiveOpacity)
      strokeWidth: root.strokeSize
      fillColor: "transparent"
      capStyle: ShapePath.RoundCap

      PathAngleArc {
        centerX: root.itemSize
        centerY: root.itemSize
        radiusX: root.itemSize - root.strokeSize / 2
        radiusY: root.itemSize - root.strokeSize / 2
        startAngle: 0
        sweepAngle: 360
      }
    }

    ShapePath {
      strokeColor: root.color
      strokeWidth: root.strokeSize
      fillColor: "transparent"
      capStyle: ShapePath.RoundCap

      PathAngleArc {
        centerX: root.itemSize
        centerY: root.itemSize
        radiusX: root.itemSize - root.strokeSize / 2
        radiusY: root.itemSize - root.strokeSize / 2
        startAngle: -90
        sweepAngle: root.percentage * 360

        Behavior on sweepAngle {
          SmoothedAnimation {
            velocity: 360
            duration: Config.animationDurationMs
          }
        }
      }
    }
  }
}
