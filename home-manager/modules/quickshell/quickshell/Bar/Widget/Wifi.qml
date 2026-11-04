import QtQuick.Layouts
import "../../Common"
import "../../Services"

RowLayout {
  id: root
  spacing: Config.barMargin

  PercentageColoredSvg {
    imageSource: Wifi.icon
    imageSize: Config.fontSize
    percentage: Wifi.wifiStrength
    color: Theme.purple
  }

  DisplayText {
    text: Wifi.displayText
    color: Theme.purple
  }
}
