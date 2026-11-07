pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  property var tagData: wsFetcher.tagData

  Process {
    id: wsFetcher
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
            const index = tag["index"];
            let tagData = {
              "index": index,
              "display_text": wsFetcher.tagIconMap[index] ?? index,
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
        wsFetcher.tagData = output;
      }
    }

    property var tagData: ({})
    property var tagIconMap: {
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
  }

  Process {
    id: wsSwitcher
    running: false
    command: ["mmsg", "dispatch", "view," + wsIndex]

    property var wsIndex: 1
  }
  Process {
    id: wsToggler
    running: false
    command: ["mmsg", "dispatch", "toggleview," + wsIndex]

    property var wsIndex: 1
  }

  function gotoWorkspace(wsIndex: var): void {
    wsSwitcher.wsIndex = wsIndex;
    wsSwitcher.running = true;
  }
  function toggleWorkspace(wsIndex: var) {
    wsToggler.wsIndex = wsIndex;
    wsToggler.running = true;
  }
}
