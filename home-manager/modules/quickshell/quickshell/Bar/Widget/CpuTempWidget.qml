import "../../Common"
import "../../Services"

PercentageCircle {
  id: root
  itemSize: Config.fontSize
  percentage: CpuMon.temp / 100
  color: {
    switch (CpuMon.tempStatus) {
    case Config.Status.Warning:
      return Theme.yellow;
    case Config.Status.Critical:
      return Theme.red;
    default:
      return Theme.green;
    }
  }

  DisplayText {
    anchors.centerIn: parent
    text: CpuMon.tempIcon
    color: root.color
  }
}
