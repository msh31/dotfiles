import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
  id: root

  property var pluginApi: null
  property int editRefreshInterval: pluginApi?.pluginSettings?.refreshInterval ?? 3000
  property bool editCompactMode: pluginApi?.pluginSettings?.compactMode ?? false
  property bool editShowDeviceCount: pluginApi?.pluginSettings?.showDeviceCount ?? true

  spacing: Style.marginM

  NText {
    text: "Bluetooth Settings"
    font.pointSize: Style.fontSizeXL
    font.bold: true
  }

  NLabel {
    label: "Refresh Interval"
    description: "How often to check status (" + root.editRefreshInterval + " ms)"
  }

  NSlider {
    Layout.fillWidth: true
    from: 1000
    to: 10000
    stepSize: 1000
    value: root.editRefreshInterval
    onValueChanged: root.editRefreshInterval = value
  }

  NToggle {
    Layout.fillWidth: true
    label: "Compact Mode"
    description: "Show only icon"
    checked: root.editCompactMode
    onToggled: checked => root.editCompactMode = checked
  }

  NToggle {
    Layout.fillWidth: true
    label: "Show Device Count"
    description: "Display number of connected devices"
    checked: root.editShowDeviceCount
    enabled: !root.editCompactMode
    onToggled: checked => root.editShowDeviceCount = checked
  }

  function saveSettings() {
    if (!pluginApi) return
    
    pluginApi.pluginSettings.refreshInterval = root.editRefreshInterval
    pluginApi.pluginSettings.compactMode = root.editCompactMode
    pluginApi.pluginSettings.showDeviceCount = root.editShowDeviceCount
    
    pluginApi.saveSettings()
  }
}
