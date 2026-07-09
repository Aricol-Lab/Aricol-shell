import QtQuick
import Quickshell
import "../../configs/"
Row {
  id: action_row
  spacing: 4

  TopPanelConfig {
    id: topPanelConfig
  }

  Rectangle {
    color: "transparent"
    width: 20
    height:20
    Text {
      text: ""
      font.pixelSize: 20
      color: "#ff6675"
    }
    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
    }
  }



}
