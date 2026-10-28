import QtQuick
import "../../Common"
import "../../Services"

DisplayText {
  text: Battery.icon + Battery.bat + "%"
  color: Battery.isCharging || Battery.status === ServicesConfig.Status.Normal ? Theme.green : (Battery.status === ServicesConfig.Status.Critical ? Theme.red : Theme.yellow)
  visible: Battery.isAvailable
}
