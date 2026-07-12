import QtQuick
import Quickshell
import "../../../configs/"
Row {
  id: workspace_row

    spacing: 5

    function windowCountFunc(workspaceID) {
      if (!niri || !niri.windows) return 0;

      let count = 0;
      for (let i = 0; i < niri.windows.count; i++) {
        let win = niri.windows[i];
        if (win && win.workspaceId == workspaceID) {
          count ++
        }
      }
      return count;

    }


    Repeater {
        model: niri ? niri.workspaces : []

        Rectangle {
            visible: index < 4
            width: model.isActive ? 35: 17
            height: 17
            radius: 10
            property int windowCount: niri && niri.windows ? windowCountFunc(model.id) + (niri.windows.count * 0) : 0
            Behavior on color { ColorAnimation { duration: 200 } }
            Behavior on width { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }

            color: model.isActive ? Config.workspaceDotActive : Config.workspaceDotInactive

            // Text {
            //     text: index
            //     anchors.centerIn: parent
            //     font.pixelSize: 14
            //     color: model.isActive ? "#D2C9B1" : "#1E1E2E"
            //
            //     Behavior on color { ColorAnimation { duration: 200; easing.type: Easing.InOutQuad } }
            // }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: niri.focusWorkspaceById(model.id)
            }
        }
    }
}
