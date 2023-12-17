// example1.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


    RowLayout {
    Layout.alignment: Qt.AlignCenter
    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing: 6
        
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 20
            color: "lightblue"

            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 20
            color: "lightblue"

            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }

    }
