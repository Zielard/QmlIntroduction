import QtQuick 2.0


Item {

    Rectangle
    {
        id: btn1
        property color baseColor: "red"

        anchors
        {
            bottom: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        color: {
            if(ma1.containsPress)
            {
                return Qt.darker(baseColor)
            }
            else if(ma1.containsMouse)
            {
                return Qt.light(baseColor)
            }
            else
            {
                return baseColor;
            }
        }

        width: 150
        height: 50

        MouseArea
        {
            id: ma1
            anchors.fill : parent
        }
    }
}
