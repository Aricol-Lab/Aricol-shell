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

    implicitHeight: 25
    margins {
      top: 0
      left: 0
      right: 0
    }
    
    color: "transparent"

    Item {
        anchors.fill: parent

        Rectangle {

          anchors {
            left: parent.left
            right: parent.right
            leftMargin: 500
            rightMargin: 500
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
              anchors.leftMargin: 10 
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 3
            }

            WorkSpaceBar {
              anchors.centerIn: parent
              anchors.verticalCenterOffset: 8
            }
            ActionBar {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              anchors.verticalCenterOffset: 3
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
