pragma Singleton

import QtQuick
import Quickshell

Singleton {
  readonly property int sampleIntervalMs: 1000
  readonly property real sampleIntervalS: sampleIntervalMs / 1000

  enum Status {
    Normal,
    Warning,
    Critical
  }
}
