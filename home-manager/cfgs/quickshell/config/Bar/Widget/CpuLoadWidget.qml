import Quickshell
import "../../Common"
import "../../Services"

PercentageColoredSvg {
  imageSource: Quickshell.iconPath("cpu-symbolic")
  imageSize: Config.fontSize
  percentage: CpuMon.load / 100
  color: CpuMon.loadStatus === Config.Status.Normal ? Theme.blue : Theme.red
  addBrightness: true
}
