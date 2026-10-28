pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  property real memUsedGB: 0
  property real memTotalGB: 0
  property real memUsedPercentage: 0
  property real memCritical: 80
  property real swapUsedGB: 0
  property real swapTotalGB: 0
  property real swapUsedPercentage: 0
  property string memIcon: " "
  property string swapIcon: " "
  property var memStatus: memUsedPercentage < memCritical ? ServicesConfig.Status.Normal : ServicesConfig.Status.Critical

  Process {
    running: true
    command: ["free", "-m", "-s", ServicesConfig.sampleIntervalS]
    stdout: SplitParser {
      splitMarker: ""
      onRead: data => {
        const rawData = data.trim();
        const [memData, swapData] = data.trim().split("\n").slice(1);
        const memDataParsed = memData.split(/(\s+)/).filter(e => e.trim().length > 0);
        const swapDataParsed = swapData.split(/(\s+)/).filter(e => e.trim().length > 0);
        const memTotalMB = parseInt(memDataParsed[1]);
        const memUsedMB = parseInt(memDataParsed[2]);
        const swapTotalMB = parseInt(swapDataParsed[1]);
        const swapUsedMB = parseInt(swapDataParsed[2]);

        root.memUsedPercentage = memUsedMB / memTotalMB * 100;
        root.swapUsedPercentage = swapUsedMB / swapTotalMB * 100;
        root.memUsedGB = memUsedMB / 1024;
        root.memTotalGB = memTotalMB / 1024;
        root.swapUsedGB = swapUsedMB / 1024;
        root.swapTotalGB = swapTotalMB / 1024;
      }
    }
  }
}
