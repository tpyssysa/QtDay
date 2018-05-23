import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Theme 1.0

Item {
    property alias button: button
    property alias slider: slider
    property alias progressBar: progressBar

    ColumnLayout {
        id: columnLayout1
        anchors.bottomMargin: Theme.bottomMargin
        anchors.fill: parent

        Button {
            id: button
            text: qsTr("Start timer")
            font.pixelSize: Theme.largeSize
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: columnLayout
            Layout.fillWidth: true

            Label {
                id: label
                text: qsTr("Timer duration: " + Math.floor(slider.value))
                font.pixelSize: Theme.largeSize
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
    }
}
