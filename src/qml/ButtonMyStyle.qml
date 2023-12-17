import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    id: root
    property color backgroundDefaultColor: "#4E5BF2"
    property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
    property color contentItemTextColor: "white"

    text: "Button"
//    contentItem: Image {
//        source: "qrc:/src/img/loop.png"
//        width: 20
//        height: 20
//    }
    contentItem: Text {
        text: root.text
        color: root.contentItemTextColor
        font.pixelSize: 15
        font.family: "Arial"
        font.weight: Font.Thin
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight                  // ustawia szerokość tekstu w stosunku do szerokość parent elementu
    }

    background: Rectangle {
        implicitWidth: 83
        implicitHeight: 37
        color: root.down ? root.backgroundPressedColor : root.backgroundDefaultColor
        radius: 3
        layer.enabled: true
    }
}
