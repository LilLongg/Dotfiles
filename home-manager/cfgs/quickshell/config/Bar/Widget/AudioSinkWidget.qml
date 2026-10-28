import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "../../Common"

RowLayout {
  id: root
  visible: sink !== null
  readonly property var sink: Pipewire.defaultAudioSink
  readonly property var audio: sink?.audio
  readonly property var volumeLevels: ["low", "medium", "high"]
  readonly property string volumeLevel: volumeLevels[Math.trunc((volume - 0.01) * volumeLevels.length)]
  readonly property string volumeIcon: "audio-volume-" + volumeLevel + "-symbolic"
  readonly property string unavailableIcon: "audio-volume-muted-symbolic"
  readonly property string icon: audio?.muted ? unavailableIcon : volumeIcon
  readonly property real volume: audio?.volume ?? 0

  PercentageColoredSvg {
    imageSize: Config.fontSize
    imageSource: Quickshell.iconPath(root.icon)
    strokeSize: Config.borderSize
    color: Theme.blue
    percentage: root.volume
  }
}
