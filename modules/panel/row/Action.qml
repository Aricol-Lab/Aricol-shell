import QtQuick
import Quickshell
import Quickshell.Io
import "../../../configs/"
import "../buttons"
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
            WifiButton {}
            BluetoothButton {}
            PowerButton {}
        }

    }
}