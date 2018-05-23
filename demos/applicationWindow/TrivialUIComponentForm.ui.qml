import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: item1

    Label {
        id: label
        text: qsTr("NOF menus ") + ApplicationWindow.menuBar.menus.length
        font.pointSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
