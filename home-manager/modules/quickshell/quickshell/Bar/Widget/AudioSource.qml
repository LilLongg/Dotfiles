import "../../Common"
import "../../Services"

PercentageColoredSvg {
  visible: Pipewire.audioSourceAvailable
  imageSize: Config.fontSize
  imageSource: Pipewire.audioSourceIcon
  color: Theme.purple
  percentage: Pipewire.audioSourceVolume
}
