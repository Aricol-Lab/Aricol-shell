import QtQuick
import Quickshell
import Quickshell.Io
import "../../configs/"

Row {
    id: actionRowMain
    spacing: 4

    TopPanelConfig {
        id: topPanelConfig
    }

    Rectangle {
        color: topPanelConfig.behindActionButton
        height: 20
        width: actionRow1.width + 16
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5
        radius: 15

        Row {
            id: actionRow1
            anchors.centerIn: parent
            spacing: 6
            property bool isMuted: false
            property double volumeLevel: 0.0
            property string volumeIcon: "󰕾"

            Text {
                text: actionRow1.volumeIcon
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font"
                color: actionRow1.isMuted ? "#7a8478" : topPanelConfig.windowTitleColor
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: actionRow1.isMuted ? "Muted" : Math.round(actionRow1.volumeLevel) + "%"
                font.pixelSize: 11
                font.family: "JetBrainsMono Nerd Font"
                color: actionRow1.isMuted ? "#7a8478" : topPanelConfig.windowTitleColor
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton

            onClicked: {
                globalProcess.command = ["pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle"];
                globalProcess.running = true;
            }

            onWheel: (wheel) => {
                if (wheel.angleDelta.y > 0) {
                    globalProcess.command = ["pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%"];
                } else {
                    globalProcess.command = ["pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%"];
                }
                globalProcess.running = true;
            }
        }
    }

    Rectangle {
        color: topPanelConfig.behindActionButton
        height: 20
        width: actionRow2.width + 16         
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5
        radius: 15

        Row {
            id: actionRow2
            anchors.centerIn: parent
            spacing: 10 

            Text {
                text: ""
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font" 
                color: topPanelConfig.wifiButtonColor
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: "󰂯"
                font.pixelSize: 12
                font.family: "JetBrainsMono Nerd Font"
                color: topPanelConfig.bluetoothButtonColor
                anchors.verticalCenter: parent.verticalCenter 
            }

            Text {
                text: ""
                font.pixelSize: 12
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

    Timer {
        id: volumeTimer
        interval: 50
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: updateVolume()
    }
      
    Process {
        id: wpctlProcess
        command: ["pactl", "get-sink-volume", "@DEFAULT_SINK@"] 
        stdout: StdioCollector {}
        
        onExited: (exitCode) => {
            if (exitCode === 0) {
                let output = wpctlProcess.stdout.text.trim();
                
                actionRow1.isMuted = output.includes("[MUTED]");
                let match = output.match(/front-left:[^/]+\/\s*(?<volume>\d+)%/);
                if (match) {
                    actionRow1.volumeLevel = parseFloat(match[1]);
                }
                
                if (actionRow1.isMuted || actionRow1.volumeLevel === 0) {
                    actionRow1.volumeIcon = "󰝟";
                } else if (actionRow1.volumeLevel < 0.3) {
                    actionRow1.volumeIcon = "󰕿";
                } else if (actionRow1.volumeLevel < 0.7) {
                    actionRow1.volumeIcon = "󰖀";
                } else {
                    actionRow1.volumeIcon = "󰕾";
                }
            }
        }
    }
    
    Process {
        id: globalProcess
        onExited: (exitCode) => {
            if (exitCode === 0) {
                updateVolume();
            }
        }
    }

    function updateVolume() {
        wpctlProcess.running = false;
        wpctlProcess.running = true;
    }
}
