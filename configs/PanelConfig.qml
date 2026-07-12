pragma Singleton
import QtQuick

QtObject {
    id: config
    property bool minimalOnUnhover: false
    property int maxWorkspaceDot: 3
    property int panelHeight: 26

    property color backgroundColor: "#1e1e2e"

    property color clockTextColor: "#cdd6f4"

    property color workspaceDotActive: "#f5c2e7"
    property color workspaceDotInactive: "#585b70"

    property color actionRowBackground: "#181825"

    property color actionRowAudioIcon: "#f5e0dc"
    property color actionRowWifiButton: "#00f5d4"
    property color actionRowBluetoothButton: "#38b6ff"
    property color actionRowPowerButton: "#ff5a5f"
}