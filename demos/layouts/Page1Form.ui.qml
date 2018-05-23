import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    GridLayout {
        id: gridLayout
        columns: 3
        anchors.fill: parent

        Button {
            id: button
            text: qsTr("Button 1")
        }

        Button {
            id: button1
            text: qsTr("Button 2")
        }

        Button {
            id: button2
            text: qsTr("Button 3")
            Layout.fillHeight: true
        }

        Button {
            id: button3
            text: qsTr("Button 4")
            Layout.fillWidth: true
        }

        Button {
            id: button4
            text: qsTr("Button 5")
        }

        Button {
            id: button5
            text: qsTr("Button 6")
        }
    }


}
