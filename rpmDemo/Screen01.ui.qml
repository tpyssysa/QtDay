import QtQuick 2.10
import rpmDemo 1.0

Rectangle {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Text {
        text: qsTr("Hello rpmDemo")
        anchors.centerIn: parent
        font: Constants.font
    }
}
