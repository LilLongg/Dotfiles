import Quickshell
import "../../Common"
import "../../Services"

PercentageColoredSvg {
  imageSource: Quickshell.iconPath(Backlight.icon)
  imageSize: Config.fontSize
  strokeSize: Config.borderSize
  percentage: Backlight.brightnessPercentage
  color: Theme.white
  addBrightness: true
}
