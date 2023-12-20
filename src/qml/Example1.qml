// example1.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


    RowLayout {
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
            font.pointSize: 24
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
            font.pointSize: 24
        }
    }

    //Anchors - grupowanie
//    Item{
//    id: group
//    Layout.fillHeight: true
//    Layout.fillWidth: true
//        Rectangle {
//            id: rect1
//            anchors.left: parent.left
//            anchors.right: rect2.left
//            anchors.verticalCenter: rect2.verticalCenter
//            anchors.bottom: rect2.bottom
//            anchors.rightMargin: 2
//            radius: 20
//            color: "lightblue"

//            Text {
//                anchors.centerIn: parent
//                text: parent.width + 'x' + parent.height
//            }
//        }

//        Rectangle {
//            id: rect2
//            anchors.left: parent.horizontalCenter
//            anchors.right: parent.right
//            anchors.verticalCenter : parent.verticalCenter
//            anchors.bottom : parent.bottom
//            anchors.leftMargin: 1
//            radius: 20
//            color: "lightblue"

//            Text {
//                anchors.centerIn: parent
//                text: parent.width + 'x' + parent.height
//            }
//        }
//    }

    }
