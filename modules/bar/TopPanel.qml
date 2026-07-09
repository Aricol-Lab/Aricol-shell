import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: toppanelWindow

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 25
    margins {
      top: 0
      left: 350
      right: 350
    }
    
    color: "transparent"

    Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            width: parent.width
            height: parent.height + 15
            y: -15
            radius: 10
            color: "#FFFDD0"
            
            WorkSpaceBar {
              anchors.centerIn: parent
              anchors.verticalCenterOffset: 8
            }
            ActionBar {
              anchors.right: parent.right
              anchors.rightMargin: 3
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 3
            }
          }
        MultiEffect {
          source: parent
          anchors.fill: parent

          shadowEnabled: true
          shadowColor: "#25000000"
          shadowBlur: 0.6
          shadowHorizontalOffset: 1 
          shadowVerticalOffset: 5
        }

    }

              
}
