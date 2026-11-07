pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  readonly property bool audioSinkAvailable: pwTracker.audioSink != null
  readonly property bool audioSourceAvailable: pwTracker.audioSource != null
  readonly property real audioSinkVolume: pwTracker.audioSink?.audio.volume ?? 0
  readonly property real audioSourceVolume: pwTracker.audioSource?.audio.volume ?? 0
  readonly property var audioSinkIcon: {
    if (pwTracker.audioSink?.audio.muted)
      return Quickshell.iconPath("audio-volume-muted-symbolic");

    const volumeLevels = ["low", "medium", "high"];
    const volumeLevelIdx = Math.trunc((audioSinkVolume - 0.01) * volumeLevels.length);
    return Quickshell.iconPath(`audio-volume-${volumeLevels[volumeLevelIdx]}-symbolic`);
  }
  readonly property var audioSourceIcon: {
    if (pwTracker.audioSource?.audio.muted)
      return Quickshell.iconPath("audio-input-microphone-muted-symbolic");

    const volumeLevels = ["low", "medium", "high"];
    const volumeLevelIdx = Math.trunc((audioSourceVolume - 0.01) * volumeLevels.length);
    return Quickshell.iconPath(`audio-input-microphone-${volumeLevels[volumeLevelIdx]}-symbolic`);
  }

  PwObjectTracker {
    id: pwTracker
    objects: [audioSink, audioSource, ...audioSinkChannels, ...audioSourceChannels]

    property var audioSink: Pipewire.defaultAudioSink
    property var audioSource: Pipewire.defaultAudioSource
    property var audioSinkChannels: audioSink?.audio.channels ?? []
    property var audioSourceChannels: audioSource?.audio.channels ?? []
  }
}
