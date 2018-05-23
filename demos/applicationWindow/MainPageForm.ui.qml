import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    width: 400
    height: 400
    property alias button: button
    property alias slider: slider
    property alias progressBar: progressBar

    ColumnLayout {
        id: columnLayout1
        anchors.bottomMargin: 50
        anchors.fill: parent

        Button {
            id: button
            text: qsTr("Start timer")
            font.pixelSize: 48
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100
            Layout.fillWidth: true

            Label {
                id: label
                text: qsTr("Timer duration: " + Math.floor(slider.value))
                font.pixelSize: 36
            }

            Slider {
                id: slider
                to: 10
                from: 0
                value: 0
                Layout.fillWidth: true
            }
        }

        ProgressBar {
            id: progressBar
            value: 0
            Layout.fillWidth: true
        }

        TrivialUIComponent {
            id: trivialUIComponent
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
