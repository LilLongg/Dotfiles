pragma Singleton

import QtQuick
import Quickshell

Singleton {
  readonly property string time: clock.date

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
