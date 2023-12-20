// example6.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts

    ColumnLayout
    {
    id: columnLayoutChartComp
    Layout.fillHeight: true
    Layout.fillWidth: true
    Rectangle {
        id: backgroundRect
        Layout.fillHeight: true
        Layout.fillWidth: true
        radius: 20
        color: "lightgreen"
    }
    states: [
        State {
            PropertyChanges { target: backgroundRect; color: "white" }
            PropertyChanges { target: columnLayoutChartComp;
                Layout.fillHeight: false;
                Layout.fillWidth: false;
            }
            name: "undocked"
            when: (simpleChart.docked == false)
        },
        State {
            PropertyChanges { target: backgroundRect; color: "lightgreen" }
            PropertyChanges { target: columnLayoutChartComp;
                Layout.fillHeight: true;
                Layout.fillWidth: true;
            }
            name: "docked"
            when: (simpleChart.docked == true)
        }
    ]
        ChartView {
                id: simpleChart
                title: "Spline Chart"
                Layout.fillHeight: true
                Layout.fillWidth: true
                antialiasing: true
                anchors.fill: parent
                property bool docked: true

                SplineSeries {
                    name: "Spline"
                    XYPoint { x: 0; y: 0.0 }
                    XYPoint { x: 1.1; y: 3.2 }
                    XYPoint { x: 1.9; y: 2.4 }
                    XYPoint { x: 2.1; y: 2.1 }
                    XYPoint { x: 2.9; y: 2.6 }
                    XYPoint { x: 3.4; y: 2.3 }
                    XYPoint { x: 4.1; y: 3.1 }
                    }

                states: [
                    State {
                        name: "undocked"
                        when: (simpleChart.docked == false)
                        ParentChange { target: simpleChart; parent: additionalRect;
                        }
                    },
                    State {
                        name: "docked"
                        when: (simpleChart.docked == true)
                        ParentChange { target: simpleChart; parent: backgroundRect;
                        }
                    }
                ]
                Button {
                    id: dockBtn
                    text: "undock"
                    onClicked: {
                        console.log("onClicked");
                        if(simpleChart.docked == false)
                        {
                            wnd.visible = false;
                            simpleChart.docked = true;
                            console.log("docked");
                        }
                        else if(simpleChart.docked == true)
                        {
                            wnd.visible = true;
                            simpleChart.docked = false;
                            console.log("undocked");
                        }
                    }

                    states: [
                        State {
                            name: "undocked"
                            when: ( wnd.visible == false)
                            PropertyChanges { target: dockBtn; visible: true;
                            }
                        },
                        State {
                            name: "docked"
                            when: (wnd.visible == true)
                            PropertyChanges { target: dockBtn; visible: false;
                            }
                        }
                    ]
                }
            }
    //}
    Window {
        minimumHeight: 250;
        minimumWidth: 250;
        width: 350;
        height: 350;
        visible: false;
        id: wnd
        Rectangle {
            id: additionalRect
            anchors.fill: parent
        }
        onClosing: {
            simpleChart.docked = true;
            simpleChart.state = "docked";
        }
    }
}

