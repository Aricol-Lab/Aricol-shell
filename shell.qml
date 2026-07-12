

import QtQuick
import Quickshell
import Niri
import "./modules/panel"
ShellRoot {
    id: root 
    Niri {
      id: niri 
      Component.onCompleted: connect()
      onConnected: console.info("Connected to niri")
        onErrorOccurred: function(error) {
            console.error("Niri error:", error)
        }
      } 

      LazyLoader{ active: true; component: Panel{}}
}
