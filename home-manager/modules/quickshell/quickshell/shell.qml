//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1

import Quickshell
import Quickshell.Services.Pipewire
import "Bar"

Scope {
  PwObjectTracker {
    readonly property var audioSink: Pipewire.defaultAudioSink
    readonly property var audioSource: Pipewire.defaultAudioSource
    objects: [audioSink, audioSource, ...(audioSink?.audio.channels ?? []), ...(audioSource?.audio.channels ?? [])]
  }

  Variants {
    model: Quickshell.screens
    Bar {}
  }
}
