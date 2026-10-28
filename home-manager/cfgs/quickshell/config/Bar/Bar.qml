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
      ClockWidget {}
    }
    BarWrapper {
      BatteryWidget {}
      CpuTempWidget {}
      CpuLoadWidget {}
      MemoryWidget {}
    }
    BarWrapper {
      WifiWidget {}
      BluetoothWidget {}
    }
  }

  // Center modules
  RowLayout {
    spacing: Config.barMargin
    anchors.horizontalCenter: parent.horizontalCenter

    BarWrapper {
      LauncherWidget {}
      WorkspaceWidget {
        monitor: root.monitor
      }
      ScreenlockWidget {}
    }
  }

  // Right modules
  RowLayout {
    spacing: Config.barMargin
    anchors.right: parent.right

    BarWrapper {
      MprisWidget {}
      AudioSinkWidget {}
      AudioSourceWidget {}
      BacklightWidget {}
    }
    BarWrapper {
      SystrayWidget {
        bar: root
      }
    }
  }
}
