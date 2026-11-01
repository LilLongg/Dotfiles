import Quickshell
import "../../Common"
import "../../Services"

PercentageColoredSvg {
  imageSource: Quickshell.iconPath("memory-symbolic")
  imageSize: Config.fontSize
  percentage: Memory.memUsedPercentage / 100
  color: Memory.memStatus === Config.Status.Normal ? Theme.orange : Theme.red
  addBrightness: true
}
