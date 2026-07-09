import QtQuick
import Quickshell
import "../../configs/"


Row {

  TopPanelConfig {
    id: topPanelConfig
  }

  spacing: 4

  Rectangle {
    color: "transparent"
    width: 20
    height: 20
    Text {
      id: clockText
      color: topPanelConfig.clockTextColor
      font.pixelSize: 20
      font.family: "Poppins"
      text: "00:00"

      Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {
          let currentTime = new Date();
          clockText.text = currentTime.toLocaleTimeString(Qt.locale("vi_VN"),"hh:mm")
        }
      }

    }
  }

}
