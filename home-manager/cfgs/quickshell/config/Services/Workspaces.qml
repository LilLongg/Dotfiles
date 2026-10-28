pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  property var tagData: ({})
  readonly property var tagIconMap: {
    1: "一",
    2: "二",
    3: "三",
    4: "四",
    5: "五",
    6: "六",
    7: "七",
    8: "八",
    9: "九"
  }

  Process {
    running: true
    command: ["mmsg", "watch", "all-tags"]
    stdout: SplitParser {
      onRead: rawData => {
        var output = {};
        const data = JSON.parse(rawData);
        for (const monitor of data["all_tags"]) {
          const name = monitor["monitor"];
          output[name] = [];

          for (const tag of monitor["tags"]) {
            var tagData = {
              "index": tag["index"],
              "active": false,
              "urgent": false,
              "focused": false
            };
            if (tag["client_count"] != 0)
              tagData["active"] = true;
            if (tag["is_urgent"])
              tagData["urgent"] = true;
            if (tag["is_active"])
              tagData["focused"] = true;

            output[name].push(tagData);
          }
        }

        root.tagData = output;
      }
    }
  }

  Process {
    id: wsSwitcher
    running: false
    property var wsIndex: 1

    command: ["mmsg", "dispatch", "view," + wsIndex]
  }
  Process {
    id: wsToggle
    running: false
    property var wsIndex: 1

    command: ["mmsg", "dispatch", "toggleview," + wsIndex]
  }

  function gotoWorkspace(wsIndex: var): void {
    wsSwitcher.wsIndex = wsIndex;
    wsSwitcher.running = true;
  }
  function toggleWorkspace(wsIndex: var) {
    wsToggle.wsIndex = wsIndex;
    wsToggle.running = true;
  }
}
