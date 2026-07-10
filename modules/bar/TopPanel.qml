import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "../../configs/"

import "../../modules/rim"

PanelWindow {
    id: toppanelWindow
      
    TopPanelConfig {
      id: topPanelConfig
    }

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 26
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

          anchors {
            left: parent.left
            right: parent.right
            leftMargin: 600
            rightMargin: 600
          }

          id: panelBackground
            width: parent.width
            height: parent.height + 15
            y: -15
            antialiasing: true
            radius: 15


            color: topPanelConfig.topPanelColor


            TimeBar {
              anchors.left: parent.left
              anchors.leftMargin: 8
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 3
            }

            WorkSpaceNumber {
              anchors.right: workSpaceBar.left
              anchors.rightMargin: 4
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 4

            }
            
            WorkSpaceBar {
              id: workSpaceBar
              anchors.centerIn: parent
              anchors.verticalCenterOffset: 8
            }
            ActionBar {
              anchors.right: parent.right
              anchors.rightMargin: 8
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 2
            }
            MultiEffect {
              source: parent
              anchors.fill: parent

              shadowEnabled: true
              shadowColor: "#25000000"
              shadowBlur: 0.9
              shadowHorizontalOffset: 1 
              shadowVerticalOffset: 0
              autoPaddingEnabled: true
          }
        }

    }

              
}
