import QtQuick
import "../../Common"
import "../../Services"

DisplayText {
  text: CpuMon.loadIcon + CpuMon.load + "%"
  color: CpuMon.loadStatus === ServicesConfig.Status.Normal ? Theme.blue : Theme.red
}
