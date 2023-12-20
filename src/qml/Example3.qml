// example3.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ColumnLayout {
    Layout.fillHeight: true
    Layout.fillWidth: true
    property int firstFibo: 0
    property int secondFibo: 1
    property int thidFibo: 1
    RowLayout {
        ButtonMyStyle {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            text: "fibonaciiRepeater"
            backgroundDefaultColor: "#0ACF97"
            onClicked: {
                firstFibo = secondFibo + thidFibo
                secondFibo = firstFibo + thidFibo
                thidFibo = firstFibo + secondFibo

                fibonaciiRepeater.itemAt(0).text = firstFibo
                fibonaciiRepeater.itemAt(1).text = secondFibo
                fibonaciiRepeater.itemAt(2).text = thidFibo
            }
        }
    }

    RowLayout {
        Repeater {
            id: fibonaciiRepeater
            model: [firstFibo, secondFibo, thidFibo] // 3
            ButtonMyStyle {
                required property int modelData
                text: modelData
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                backgroundDefaultColor: "#0ACF97"
            }
        }
    }

    RowLayout {
        Repeater {
            model: ["apples", "oranges", "pears"]
            Text {
                required property string modelData
                text: "Data: " + modelData
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

}
