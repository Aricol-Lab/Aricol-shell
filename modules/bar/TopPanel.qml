import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "../../configs/"


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
      left: 350
      right: 350
    }
    
    color: "transparent"

    Item {
        anchors.fill: parent

        Rectangle {
            width: parent.width
            height: parent.height + 15
            y: -15
            radius: 10
            color: topPanelConfig.topPanelColor
            
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
