// example4.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import "../js/externalScript.js" as ExternalScript

ColumnLayout {

    property int fiboNumber: 1
    function fibonacci(n){
            var lastNumber = 0;
            var arr = [0, 1];
            for (var i = 2; i < n + 1; i++)
                arr.push(arr[i - 2] + arr[i -1]);
                lastNumber = arr[i - 2] + arr[i -1];

            return lastNumber;
    }

    Layout.fillHeight: true
    Layout.fillWidth: true
    RowLayout {
        ButtonMyStyle {
            Layout.preferredWidth: 300
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            text: "fibonaciiRepeater"
            backgroundDefaultColor: "#0ACF97"
            onClicked: {
                fibonaciiRepeater.itemAt(0).text = fibonacci(fiboNumber++).toString();
                fibonaciiRepeater.itemAt(1).text = fibonacci(fiboNumber++).toString();
                fibonaciiRepeater.itemAt(2).text = fibonacci(fiboNumber++).toString();
            }
        }
    }

    RowLayout {
        Repeater {
            id: fibonaciiRepeater
            model: 3
            ButtonMyStyle {
                required property int modelData
                text: modelData
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                backgroundDefaultColor: "#0ACF97"
                Component.onCompleted: {
                     text: fibonacci(fiboNumber++)
                }
            }
        }
    }

    ColumnLayout {
        Rectangle {
        Layout.alignment: Qt.AlignHCenter
        color: Qt.styleHints.appearance === Qt.Light ? palette.mid : palette.midlight
        Layout.fillHeight: true
        Layout.fillWidth: true
           HorizontalHeaderView {
            id: horizontalHeader
            anchors.left: tableView.left
            anchors.top: parent.top
            syncView: tableView
            clip: true
        }

        VerticalHeaderView {
            id: verticalHeader
            anchors.top: tableView.top
            anchors.left: parent.left
            syncView: tableView
            clip: true
        }

        TableView {
                id: tableView
                anchors.left: verticalHeader.right
                anchors.top: horizontalHeader.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                rowSpacing: 1
                columnSpacing: 1

                ScrollBar.horizontal: ScrollBar {}
                ScrollBar.vertical: ScrollBar {}

                model: TableModel {
                    TableModelColumn { display: "key" }
                    TableModelColumn { display: "value" }
                    TableModelColumn { display: "total" }
                    rows: ExternalScript.myFunction()
                }

                delegate: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 50
                    border.width: 1
                    color: palette.base
                    TextField {
                        implicitWidth: 100
                        implicitHeight: 50
                        text: model.display
                        anchors.centerIn: parent
                    }
                }
            }
    }
    }

}
