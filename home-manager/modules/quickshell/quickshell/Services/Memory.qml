pragma Singleton

import Quickshell
import Quickshell.Io
import "../Common"

Singleton {
  id: root
  readonly property real memUsedGB: memoryFetcher.memUsedGB
  readonly property real memTotalGB: memoryFetcher.memTotalGB
  readonly property real memUsedPercentage: memTotalGB === 0 ? 0 : memUsedGB / memTotalGB * 100
  readonly property real swapUsedGB: memoryFetcher.swapUsedGB
  readonly property real swapTotalGB: memoryFetcher.swapTotalGB
  readonly property real swapUsedPercentage: swapTotalGB === 0 ? 0 : swapUsedGB / swapTotalGB * 100
  readonly property var memStatus: memUsedPercentage < 80 ? Config.Status.Normal : Config.Status.Critical

  Process {
    id: memoryFetcher
    running: true
    command: ["free", "-m", "-s", Config.sampleIntervalS]
    stdout: SplitParser {
      splitMarker: ""
      onRead: data => {
        const [memData, swapData] = data.trim().split("\n").slice(1);
        const memDataParsed = memData.split(/(\s+)/).filter(e => e.trim().length > 0);
        const swapDataParsed = swapData.split(/(\s+)/).filter(e => e.trim().length > 0);
        const memTotalMB = parseInt(memDataParsed[1]);
        const memUsedMB = parseInt(memDataParsed[2]);
        const swapTotalMB = parseInt(swapDataParsed[1]);
        const swapUsedMB = parseInt(swapDataParsed[2]);

        memoryFetcher.memUsedGB = memUsedMB / 1024;
        memoryFetcher.memTotalGB = memTotalMB / 1024;
        memoryFetcher.swapUsedGB = swapUsedMB / 1024;
        memoryFetcher.swapTotalGB = swapTotalMB / 1024;
      }
    }

    property real memUsedGB: 0
    property real memTotalGB: 0
    property real swapUsedGB: 0
    property real swapTotalGB: 0
  }
}
