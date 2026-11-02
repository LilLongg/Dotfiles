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
      Clock {}
    }
    BarWrapper {
      Weather {}
    }
    BarWrapper {
      Battery {}
      CpuTemp {}
      CpuLoad {}
      Memory {}
    }
    BarWrapper {
      Wifi {}
      Bluetooth {}
    }
  }

  // Center modules
  RowLayout {
    spacing: Config.barMargin
    anchors.horizontalCenter: parent.horizontalCenter

    BarWrapper {
      Launcher {}
      Workspaces {
        monitor: root.monitor
      }
      ScreenLocker {}
    }
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
    BarWrapper {
      Systray {
        bar: root
      }
    }
  }
}
