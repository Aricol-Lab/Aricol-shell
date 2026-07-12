import QtQuick
import Quickshell
import Quickshell.Io
import "../../../configs/"

Row {
    id: actionRow
    spacing: 4

    Rectangle {
        color: Config.actionRowBackground
        height: 20
        width: action.width + 16
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5
        radius: 15
        Row {
            id: action
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: ""
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font"
                color: Config.actionRowWifiButton
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: "󰂯"
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font"
                color: Config.actionRowBluetoothButton
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: ""
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font"
                color: Config.actionRowPowerButton
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