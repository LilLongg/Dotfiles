import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

WrapperRectangle {
  radius: Config.borderRadius
  leftMargin: Config.wrapperMargin
  rightMargin: Config.wrapperMargin
  color: Theme.background
  opacity: Config.opacity

  default property alias children: layout.data

  RowLayout {
    id: layout
    spacing: Config.spacing
  }
}
