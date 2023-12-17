// example5.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts

RowLayout {
    property bool chart_1_on: true
    Connections {
        target: dataFromCpp
        function onWDataChanged() {
            if(chart_1_on)
            {
                if(lineSeries1.count > 100)
                    lineSeries1.remove(0);
                lineSeries1.append(dataFromCpp.data.x, dataFromCpp.data.y)
                axisX.min = lineSeries1.at(0).x
                axisX.max = lineSeries1.at(lineSeries1.count-1).x
                labelView1.text =   "<img src='../../src/img/cpu.png' width=\"64\" height=\"64\" > " + dataFromCpp.data.y
            }
        }
    }

   ColumnLayout
   {
       RowLayout {
           id:rowPulseLayout
           Label {
               id: labelView1
               text: "0"

               background: Rectangle{
                   radius: 20
                   color: "lightgreen"
                   width: chartView.width
                   height: parent.height
               }
           }

           Button {
               text: "Start record"
               onClicked: {
                   chart_1_on = true;
                   dataFromCpp.startStreamData();
                   //lineSeries1.clear()
               }
           }
           Button {
               text: "Stop record"
               onClicked:
               {
               chart_1_on = false
               dataFromCpp.stopStreamData();
               }
           }
           Button {
               text: "Clear"
               onClicked:
               {
                    lineSeries1.clear();
               }
           }

           ComboBox {
               model: ["No Animation", "Animation"]

               // When an item is selected, update.
               onActivated:{
                   if(currentText == "No Animation")
                   {
                    chartView.animationOptions = ChartView.NoAnimation;
                   }
                   else if(currentText == "Animation")
                   {
                    chartView.animationOptions = ChartView.SeriesAnimations;
                   }
               }
           }
       }

           ChartView {
           id: chartView
           Layout.fillWidth: true
           Layout.minimumWidth: 100
           Layout.preferredWidth: 300
           Layout.preferredHeight: 300
           //animationOptions: ChartView.SeriesAnimations

           ValueAxis {
               id: axisY1
               min: 10
               max: 15
               gridVisible: false
               labelFormat: "%.0f"
           }

           ValueAxis {
               id: axisX
               min: 0
               max: 50
               gridVisible: false
               labelFormat: "%.0f"
           }

           SplineSeries {
               id: lineSeries1
               name: "CPU voltage"
               axisX: axisX
               axisY: axisY1
           }
       }

   }
}
