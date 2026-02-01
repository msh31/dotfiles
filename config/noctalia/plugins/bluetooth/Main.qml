import QtQuick
import Quickshell
import qs.Commons
import Quickshell.Io

Item {
  id: root

  property var pluginApi: null

  property int refreshInterval: pluginApi?.pluginSettings?.refreshInterval ?? 3000
  property bool compactMode: pluginApi?.pluginSettings?.compactMode ?? false
  property bool showDeviceCount: pluginApi?.pluginSettings?.showDeviceCount ?? true

  property bool bluetoothPowered: false
  property int connectedDevices: 0
  property var deviceList: []
  property bool isRefreshing: false

  Process {
    id: statusProcess
    stdout: StdioCollector {}
    
    onExited: function(exitCode, exitStatus) {
      root.isRefreshing = false
      var output = String(statusProcess.stdout.text || "").trim()
      
      if (exitCode === 0 && output) {
        // Parse bluetoothctl output
        root.bluetoothPowered = output.includes("Powered: yes")
        
        // Count connected devices (rough parsing)
        var lines = output.split('\n')
        var connected = 0
        var devices = []
        
        for (var i = 0; i < lines.length; i++) {
          if (lines[i].includes("Connected: yes")) {
            connected++
          }
          if (lines[i].includes("Device ")) {
            var deviceName = lines[i].split("Device ")[1]
            if (deviceName) {
              devices.push(deviceName.trim())
            }
          }
        }
        
        root.connectedDevices = connected
        root.deviceList = devices
      } else {
        root.bluetoothPowered = false
        root.connectedDevices = 0
        root.deviceList = []
      }
    }
  }

  Process {
    id: toggleProcess
    onExited: function(exitCode, exitStatus) {
      statusDelayTimer.start()
    }
  }

  Timer {
    id: statusDelayTimer
    interval: 500
    repeat: false
    onTriggered: {
      root.isRefreshing = false
      updateBluetoothStatus()
    }
  }

  function updateBluetoothStatus() {
    root.isRefreshing = true
    statusProcess.command = ["bluetoothctl", "show"]
    statusProcess.running = true
  }

  function toggleBluetooth() {
    root.isRefreshing = true
    if (root.bluetoothPowered) {
      toggleProcess.command = ["bluetoothctl", "power", "off"]
    } else {
      toggleProcess.command = ["bluetoothctl", "power", "on"]
    }
    toggleProcess.running = true
  }

  Timer {
    id: updateTimer
    interval: refreshInterval
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: updateBluetoothStatus()
  }
}
