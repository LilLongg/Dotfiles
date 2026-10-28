import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "../../Common"

RowLayout {
  id: root
  visible: sink !== null
  readonly property var sink: Pipewire.defaultAudioSource
  readonly property var audio: sink?.audio
  readonly property var volumeLevels: ["low", "medium", "high"]
  readonly property string volumeLevel: volumeLevels[Math.trunc((volume - 0.01) * volumeLevels.length)]
  readonly property string volumeIcon: "audio-input-microphone-" + volumeLevel + "-symbolic"
  readonly property string unavailableIcon: "audio-input-microphone-muted-symbolic"
  readonly property string icon: audio?.muted ? unavailableIcon : volumeIcon
  readonly property real volume: audio?.volume ?? 0

  PercentageColoredSvg {
    imageSize: Config.fontSize
    imageSource: Quickshell.iconPath(root.icon)
    strokeSize: Config.borderSize
    color: Theme.purple
    percentage: root.volume
  }
}
