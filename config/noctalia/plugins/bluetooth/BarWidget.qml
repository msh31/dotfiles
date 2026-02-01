import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets
import qs.Services.UI

Item {
  id: root

  property var pluginApi: null
  property ShellScreen screen
  property string widgetId: ""

  readonly property var mainInstance: pluginApi?.mainInstance

  readonly property real contentWidth: {
    if (mainInstance?.compactMode ?? false) {
      return Style.capsuleHeight
    }
    return contentRow.implicitWidth + Style.marginM * 2
  }
  readonly property real contentHeight: Style.capsuleHeight

  implicitWidth: contentWidth
  implicitHeight: contentHeight

  Rectangle {
    id: visualCapsule
    x: Style.pixelAlignCenter(parent.width, width)
    y: Style.pixelAlignCenter(parent.height, height)
    width: root.contentWidth
    height: root.contentHeight
    color: mouseArea.containsMouse ? Color.mHover : Style.capsuleColor
    radius: Style.radiusL

    RowLayout {
      id: contentRow
      anchors.centerIn: parent
      spacing: Style.marginS

      NIcon {
        icon: mainInstance?.bluetoothPowered ? "bluetooth" : "bluetooth-off"
        pointSize: Style.fontSizeL
        color: {
          if (mainInstance?.bluetoothPowered) return Color.mPrimary
          return mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
        }
        opacity: (mainInstance?.isRefreshing ?? false) ? 0.5 : 1.0
      }

      NText {
        visible: !(mainInstance?.compactMode ?? false) && 
                 (mainInstance?.showDeviceCount ?? false) && 
                 (mainInstance?.bluetoothPowered ?? false)
        text: (mainInstance?.connectedDevices || 0).toString()
        pointSize: Style.fontSizeS
        color: mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
      }
    }
  }

  NPopupContextMenu {
    id: contextMenu
    model: [
      {
        "label": mainInstance?.bluetoothPowered 
          ? "Turn Off" 
          : "Turn On",
        "action": "toggle",
        "icon": mainInstance?.bluetoothPowered ? "bluetooth-off" : "bluetooth"
      },
      {
        "label": "Settings",
        "action": "settings",
        "icon": "settings"
      }
    ]

    onTriggered: action => {
      contextMenu.close()
      if (action === "toggle") {
        mainInstance?.toggleBluetooth()
      } else if (action === "settings") {
        BarService.openPluginSettings(screen, pluginApi.manifest)
      }
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onClicked: (mouse) => {
      if (mouse.button === Qt.LeftButton) {
        pluginApi?.openPanel(root.screen, root)
      } else if (mouse.button === Qt.RightButton) {
        PanelService.showContextMenu(contextMenu, root, screen)
      }
    }
  }
}
