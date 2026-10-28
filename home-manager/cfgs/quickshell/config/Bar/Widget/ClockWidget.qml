import QtQuick
import "../../Common"
import "../../Services"

DisplayText {
  text: Qt.formatDateTime(Clock.time, " hh:mm   ddd, MMM dd")
  color: Theme.orange
}
