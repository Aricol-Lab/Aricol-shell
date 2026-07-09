import QtQuick
import Quickshell
import "../../configs/"

Row {
    id: action_row
    spacing: 12

    TopPanelConfig {
        id: topPanelConfig
    }

    Rectangle {
        color: topPanelConfig.behindActionButton
        height: 22
        
        width: innerRow.width + 16         
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5
        radius: 15

        Row {
            id: innerRow
            anchors.centerIn: parent
            spacing: 10 
            Text {
                text: ""
                font.pixelSize: 14
                font.family: "JetBrainsMono Nerd Font" 
                color: topPanelConfig.wifiButtonColor
                anchors.verticalCenter: parent.verticalCenter
              }
            Text {
              text: "󰂯"
              font.pixelSize: 14
              font.family: "JetBrainsMono Nerd Font"
              color: topPanelConfig.bluetoothButtonColor
              anchors.verticalCenter: parent.verticalCenter 
            }
            Text {
                text: ""
                font.pixelSize: 15
                font.family: "JetBrainsMono Nerd Font"
                color: topPanelConfig.powerButtonColor
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    
                    onClicked: {
                    }
                }
            }
        }
    } 
}
