import "../../Common"
import "../../Services"

PercentageColoredSvg {
  visible: Battery.isAvailable
  imageSource: Battery.icon
  imageSize: Config.fontSize
  percentage: Battery.bat / 100
  color: {
    if (Battery.isCharging || Battery.status === Config.Status.Normal)
      return Theme.green;

    switch (Battery.status) {
    case Config.Status.Warning:
      return Theme.yellow;
    case Config.Status.Critical:
      return Theme.red;
    default:
      return Theme.green;
    }
  }
  addBrightness: Battery.isCharging
}
