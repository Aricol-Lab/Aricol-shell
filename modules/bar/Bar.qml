import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: panel

    color: "#20000000"
    BackgroundEffect.blurRegion: Region { item: root.contentItem }
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 25

    margins {
        top: 0
        bottom: 0  
        left: 0
        right: 0
    }

    Rectangle {
        id: bar
        color: "#20000000"
        anchors.fill: parent
        radius: 0

        Rectangle {
            id: workspace_bar

            anchors.centerIn: parent

            height: 23 
            width: workspace_row.width + 24 
            
            color: "#2a2a2a"
            radius: 15      

            Row {
                id: workspace_row

                anchors.centerIn: parent
                spacing: 8

                Repeater {
                    model: niri ? niri.workspaces : []

                    Rectangle {
                        visible: index < 5
                        width: 12
                        height: 12
                        radius: 6
                        color: model.isActive ? "#ffffff" : "#555555"

                        Behavior on color {
                          ColorAnimation {
                            duration: 200 
                            easing.type: Easing.InOutQuad
                          }
                        }


                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: niri.focusWorkspaceById(model.id)
                        }
                    }
                }
            } 
        } 
    } 
}
