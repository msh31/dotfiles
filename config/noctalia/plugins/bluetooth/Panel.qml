import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets
import qs.Services.UI

Item {
  id: root

  property var pluginApi: null
  readonly property var geometryPlaceholder: panelContainer
  readonly property bool allowAttach: true
  readonly property var mainInstance: pluginApi?.mainInstance

  property real contentPreferredWidth: 400 * Style.uiScaleRatio
  property real contentPreferredHeight: 300 * Style.uiScaleRatio

  anchors.fill: parent

  Rectangle {
    id: panelContainer
    anchors.fill: parent
    color: "transparent"

    ColumnLayout {
      anchors {
        fill: parent
        margins: Style.marginM
      }
      spacing: Style.marginL

      NBox {
        Layout.fillWidth: true
        Layout.fillHeight: true

        ColumnLayout {
          anchors.fill: parent
          anchors.margins: Style.marginM
          spacing: Style.marginM

          RowLayout {
            Layout.fillWidth: true
            spacing: Style.marginS

            NIcon {
              icon: "bluetooth"
              pointSize: Style.fontSizeL
              color: Color.mPrimary
            }

            NText {
              text: "Bluetooth"
              pointSize: Style.fontSizeL
              font.weight: Style.fontWeightBold
              color: Color.mOnSurface
              Layout.fillWidth: true
            }

            NText {
              text: mainInstance?.bluetoothPowered 
                ? (mainInstance?.connectedDevices || 0) + " connected"
                : "Off"
              pointSize: Style.fontSizeS
              color: Color.mOnSurfaceVariant
            }
          }

          NText {
            Layout.fillWidth: true
            text: "Devices"
            pointSize: Style.fontSizeM
            font.weight: Style.fontWeightMedium
            color: Color.mOnSurface
            visible: (mainInstance?.deviceList?.length ?? 0) > 0
          }

          Repeater {
            model: mainInstance?.deviceList || []
            
            delegate: Rectangle {
              Layout.fillWidth: true
              height: 40
              color: "transparent"
              radius: Style.radiusM

              NText {
                anchors.centerIn: parent
                text: modelData
                color: Color.mOnSurface
              }
            }
          }

          NText {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            text: "No devices"
            visible: !(mainInstance?.bluetoothPowered ?? false) || 
                     (mainInstance?.deviceList?.length ?? 0) === 0
            pointSize: Style.fontSizeM
            color: Color.mOnSurfaceVariant
            horizontalAlignment: Text.AlignHCenter
          }
        }
      }

      NButton {
        Layout.fillWidth: true
        text: mainInstance?.bluetoothPowered ? "Turn Off" : "Turn On"
        icon: mainInstance?.bluetoothPowered ? "bluetooth-off" : "bluetooth"
        backgroundColor: mainInstance?.bluetoothPowered ? Color.mError : Color.mPrimary
        textColor: mainInstance?.bluetoothPowered ? Color.mOnError : Color.mOnPrimary
        onClicked: mainInstance?.toggleBluetooth()
      }
    }
  }
}
