pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Widgets

WrapperRectangle {
  id: root
  required property int maxWidth
  required property string text
  required property string textColor
  property int duration: 10000
  property int stopDuration: 5000
  property int velocity: 60
  readonly property bool isStatic: staticText.width <= maxWidth
  color: "transparent"

  onTextChanged: {
    animation.restart();
    animatedText.x = 0;
  }

  Row {
    DisplayText {
      id: staticText
      text: root.text
      color: root.textColor
      visible: root.isStatic
    }

    WrapperRectangle {
      id: container
      implicitWidth: root.maxWidth
      color: "transparent"
      clip: true
      visible: !root.isStatic

      DisplayText {
        id: animatedText
        text: root.text
        color: root.textColor

        SequentialAnimation on x {
          id: animation
          loops: Animation.Infinite
          running: true

          NumberAnimation {
            to: 0
            duration: root.stopDuration
          }
          SmoothedAnimation {
            to: -animatedText.contentWidth + container.width
            duration: root.duration
            velocity: root.velocity
          }
          NumberAnimation {
            to: -animatedText.contentWidth + container.width
            duration: root.stopDuration
          }
          SmoothedAnimation {
            to: 0
            duration: root.duration
            velocity: root.velocity
          }
        }
      }
    }
  }
}
