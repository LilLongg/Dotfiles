import "../../Common"
import "../../Services"

PercentageColoredSvg {
  imageSource: Backlight.icon
  imageSize: Config.fontSize
  percentage: Backlight.brightnessPercentage
  color: Theme.white
  addBrightness: true
}
