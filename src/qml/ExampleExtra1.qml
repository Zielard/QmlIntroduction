import QtQuick
import QtQuick.Controls

Rectangle {
    id: page
    anchors.fill: parent
    color: "lightgray"
    property int value: 0

    Button {
        id: clickBtn
        text: "Click me!"
        y: 30
        x: 50
        font.pointSize: 24;
        font.bold: true

        background: Rectangle {
            id: rectBackground
            property color baseColor: "lightblue"
            color: if (mouseArea.containsPress) {
                       return Qt.darker(baseColor)
                     } else if  (mouseArea.containsMouse) {
                       return Qt.lighter(baseColor)
                     } else {
                       return baseColor
                     }
            radius: 30
        }

        MouseArea { id: mouseArea; anchors.fill: parent;

        onClicked: {
            value++;
            if(value == 5)
            {
             value = 0
             Qt.quit()
            }
        } }

        states: [
            State {
                name: "cliked1"
                when: (value == 1)
                PropertyChanges {
                    target: clickBtn;
                    x: 100
                    y: 160
                    rotation: 360
                }
                PropertyChanges {
                    target: rectBackground;
                    baseColor : "red"
                }
            },
            State {
                name: "cliked2"
                when: (value == 2)
                PropertyChanges {
                    target: clickBtn;
                    x: 200
                    y: 320;
                    rotation: 0;
                }
                PropertyChanges {
                    target: rectBackground;
                    baseColor : "yellow"
                }
            },
            State {
                name: "cliked3"
                when: (value == 3)
                PropertyChanges {
                    target: clickBtn;
                    x: 300
                    y: 320;
                    rotation: 360;
                }
                PropertyChanges {
                    target: rectBackground;
                    baseColor : "green"
                }
            },
            State {
                name: "cliked4"
                when: (value == 4)
                PropertyChanges {
                    target: clickBtn;
                    x: 300;
                    y: 160;
                    rotation: 0;
                }
                PropertyChanges {
                    target: rectBackground;
                    baseColor : "brown"
                }
            },
            State {
                name: "cliked5"
                when: (value == 5)
                PropertyChanges {
                    target: clickBtn;
                    x: 100
                    y: 160
                    rotation: 360
                }
                PropertyChanges {
                    target: rectBackground;
                    baseColor : "lightblue"
                }
            }
        ]
        transitions: [
            Transition {
                          from: ""; to: "cliked1";
                          ParallelAnimation {
                              NumberAnimation { properties: "x,y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                              ColorAnimation { duration: 500 }
                          }
                      }
                    ,Transition {
                          from: "cliked1"; to: "cliked2";
                          ParallelAnimation {
                              NumberAnimation { properties: "x,y,rotation"; duration: 500; easing.type: Easing.InElastic }
                              ColorAnimation { duration: 500 }
                          }
                      }
                    ,Transition {
                          from: "cliked2"; to: "cliked3";
                          ParallelAnimation {
                              NumberAnimation { properties: "x,y,rotation"; duration: 500; easing.type: Easing.InOutElastic }
                              ColorAnimation { duration: 500 }
                          }
                      }
                    ,Transition {
                          from: "cliked3"; to: "cliked4";
                          ParallelAnimation {
                              NumberAnimation { properties: "x,y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                              ColorAnimation { duration: 500 }
                          }
                      }
                    ,Transition {
                          from: "cliked4"; to: "cliked5";
                          ParallelAnimation {
                              NumberAnimation { properties: "x,y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                              ColorAnimation { duration: 500 }
                          }
                      }

        ]
    }
}
