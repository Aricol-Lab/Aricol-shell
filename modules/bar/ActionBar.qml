import QtQuick
import Quickshell

Row {
  id: action_row
  spacing: 4
  

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
