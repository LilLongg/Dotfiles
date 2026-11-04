import "../../Common"
import "../../Services"

PercentageColoredSvg {
  visible: Pipewire.audioSinkAvailable
  imageSize: Config.fontSize
  imageSource: Pipewire.audioSinkIcon
  color: Theme.blue
  percentage: Pipewire.audioSinkVolume
}
