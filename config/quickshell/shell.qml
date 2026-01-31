import Quickshell
import Quickshell.Io
import QtQuick

ShellRoot {
    Scope {
        id: root
        property string time: ""

        Variants {
            model: Quickshell.screens
            
            PanelWindow {
                required property var modelData
                screen: modelData
                
                anchors {
                    top: true
                    left: true
                    right: true
                }
                
                implicitHeight: 32
                color: "#1e1e2e"
                
                // Left side
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Workspaces"
                    color: "#cdd6f4"
                    font.pixelSize: 14
                }
                
                // Center
                Text {
                    anchors.centerIn: parent
                    text: root.time
                    color: "#cdd6f4"
                    font.pixelSize: 14
                }
                
                // Right side
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "System"
                    color: "#cdd6f4"
                    font.pixelSize: 14
                }
            }
        }
        
        Process {
            id: dateProc
            command: ["date", "+%H:%M  %b %d"]
            running: true
            stdout: SplitParser {
                onRead: data => root.time = data
            }
        }
        
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
        }
    }
}
