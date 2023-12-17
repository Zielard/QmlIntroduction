// example2.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

RowLayout {
    property int countClicks: 0
    Layout.fillHeight: true
    Layout.fillWidth: true
    Button {
        Layout.preferredWidth: 300
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        text: "increase"
        onClicked: {
            countClicks = countClicks + 1;
            countClicksBtn.text = countClicks;
        }
    }
    Button {
        id: countClicksBtn
        Layout.preferredWidth: 300
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        text: "0"
        onClicked: {
        countClicks = 0;
        countClicksBtn.text = countClicks;
        }
    }

}
