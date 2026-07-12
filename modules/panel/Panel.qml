import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "../../configs"
import "../../modules/panel/row"

PanelWindow {
    id: topPanelWindow

    exclusionMode: ExclusionMode.None
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Config.panelHeight

    margins {
        top: 0
        left: 0
        bottom: 5
        right: 0
    }

    color: "transparent"

    Item {
        anchors.fill: parent

        Rectangle {
            id: panelBackGround

            property bool isHovered: false

            anchors {
                left: parent.left
                right: parent.right
                leftMargin: (isHovered || !Config.minimalOnUnhover) ? 600 : 830
                rightMargin: (isHovered || !Config.minimalOnUnhover) ? 600 : 830
            }

            width: parent.width
            height: parent.height + 15
            y: -15
            antialiasing: true
            radius: 15

            color: Config.backgroundColor

            Behavior on anchors.leftMargin { NumberAnimation { duration: 400; easing.type: Easing.InOutCubic } }
            Behavior on anchors.rightMargin { NumberAnimation { duration: 400; easing.type: Easing.InOutCubic } }

            Clock {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 3
            }

            WorkSpace {
                id: workSpaceBar
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 8
            }
            Action {
               anchors.right: parent.right
               anchors.rightMargin: 10
               anchors.verticalCenter: parent.verticalCenter
               anchors.verticalCenterOffset: 2

            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                propagateComposedEvents: true
                onClicked: (mouse) => mouse.accepted = false
                onPressed: (mouse) => mouse.accepted = false

                onEntered: {
                    panelBackGround.isHovered = true
                }

                onExited: {
                    panelBackGround.isHovered = false
                }
            }
        }
    }
}