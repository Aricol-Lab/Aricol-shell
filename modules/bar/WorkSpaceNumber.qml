import QtQuick
import Quickshell
import "../../configs/"

Rectangle {
  color: "transparent"
  height: 17
  width: 17

  TopPanelConfig {
    id: topPanelConfig

  }

  Text {
    text: (niri && niri.workspaces) ? niri.workspaces.count : 0
    color: topPanelConfig.totalWorkSpaceColor 
    font.pixelSize: 18
    font.family: "Poppins"

  }


}
