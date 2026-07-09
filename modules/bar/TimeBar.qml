import QtQuick
import Quickshell

Row {
  spacing: 4

  Rectangle {
    color: "transparent"
    width: 20
    height: 20
    Text {
      id: clockText
      font.pixelSize: 20
      text: "00:00:00"

      Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {
          let currentTime = new Date();
          clockText.text = currentTime.toLocaleTimeString(Qt.locale("vi_VN"),"hh:mm:ss")
        }
      }

    }
  }

}
