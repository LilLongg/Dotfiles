import QtQuick
import QtQuick.Layouts
import Quickshell
import "../Common"
import "Widget"

// qmllint disable uncreatable-type
PanelWindow {
  id: root
  required property var modelData
  readonly property string monitor: modelData.name
  screen: modelData

  anchors {
    top: true
    left: true
    right: true
  }
  margins {
    top: Config.barMargin
    left: Config.barMargin
    right: Config.barMargin
  }

  color: "transparent"
  implicitHeight: Config.barHeight

  // Left modules
  RowLayout {
    spacing: Config.barMargin
    anchors.left: parent.left

    BarWrapper {
      Systray {
        bar: root
      }
    }
    BarWrapper {
      Workspaces {
        monitor: root.monitor
      }
    }
  }

  // Center modules
  BarWrapper {
    anchors.horizontalCenter: parent.horizontalCenter
    Clock {}
  }

  // Right modules
  RowLayout {
    spacing: Config.barMargin
    anchors.right: parent.right

    BarWrapper {
      Mpris {}
      AudioSink {}
      AudioSource {}
      Backlight {}
    }
  }
}
