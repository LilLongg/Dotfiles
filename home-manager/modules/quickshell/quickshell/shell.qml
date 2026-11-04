//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1

import Quickshell
import "Bar"

Scope {
  Variants {
    model: Quickshell.screens
    Bar {}
  }
}
