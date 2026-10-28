import QtQuick
import "../../Common"
import "../../Services"

DisplayText {
  text: Memory.memIcon + Math.round(Memory.memUsedPercentage) + "%"
  color: Memory.memStatus === ServicesConfig.Status.Normal ? Theme.orange : Theme.red
}
