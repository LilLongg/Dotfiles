import QtQuick
import "../../Common"
import "../../Services"

DisplayText {
  text: CpuMon.tempIcon + CpuMon.temp + "°C"
  color: CpuMon.tempStatus === ServicesConfig.Status.Normal ? Theme.green : (CpuMon.tempStatus === ServicesConfig.Status.Critical ? Theme.red : Theme.yellow)
}
