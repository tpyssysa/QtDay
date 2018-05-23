import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Label {
            text: qsTr("Page 1")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            text: qsTr("Page 2")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    footer: ColumnLayout {
        PageIndicator {
            currentIndex: tabBar.currentIndex
            count: tabBar.count
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TabBar {
            id: tabBar
            currentIndex: swipeView.currentIndex
            Layout.fillWidth: true

            TabButton {
                text: qsTr("Page 1")
            }
            TabButton {
                text: qsTr("Page 2")
            }
        }
    }
}
