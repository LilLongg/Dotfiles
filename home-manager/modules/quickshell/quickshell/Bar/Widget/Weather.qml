import QtQuick.Layouts
import Quickshell.Widgets
import "../../Common"
import "../../Services"

RowLayout {
  spacing: Config.barMargin

  IconImage {
    source: Weather.current_icon
    implicitSize: 2 * Config.fontSize
  }

  DisplayText {
    text: {
      if (!Weather.isAvailable)
        return "Unavailable";
      return `${Weather.current_temp >= 0 ? "+" : ""}${Weather.current_temp}°C`;
    }
    color: Theme.foreground
  }
}
