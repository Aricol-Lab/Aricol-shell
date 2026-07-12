import QtQuick
import Quickshell
import "../../../configs"


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
