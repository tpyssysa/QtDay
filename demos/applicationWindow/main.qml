import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Application Window")
    minimumHeight: 300
    minimumWidth: 330

    menuBar: MenuBar {
        id: menuBar
        Menu {
            title: qsTr("&File")
            cascade: true
            Action { text: qsTr("&New...") }
            Action { text: qsTr("&Open...") }
            Action { text: qsTr("&Save") }
            Action { text: qsTr("Save &As...") }
            Menu {
                title: qsTr("Sub-menu")
                overlap: 20.0
                Action { text: qsTr("&Action 1") }
            }

            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu {
            id: editMenu
            title: qsTr("&Edit")
            Action { text: qsTr("Cu&t") }
            Action { text: qsTr("&Copy") }
            Action { text: qsTr("&Paste") }
            Action {
                text: qsTr("&Add menu item")
                onTriggered: editMenu.addAction(dummyAction.createObject());
            }
            Action {
                text: qsTr("&Remove menu item")
                onTriggered: {
                    if (editMenu.count > 5) {
                        editMenu.removeAction(editMenu.actionAt(5));
                    }
                }
            }
            Component {
                id: dummyAction
                Action {
                    text: qsTr("dummy");
                }
            }
        }
        Menu {
            title: qsTr("&Help")
            Action {
                text: qsTr("&About");
                onTriggered: popup.open();
            }
        }
    }

    header: Label {
        horizontalAlignment: Text.AlignHCenter
        height: 60
        font.pointSize: 108
        minimumPointSize: 8
        fontSizeMode: Text.Fit
        text: mainPage.title
        background: Rectangle {
            anchors.fill: parent
            border { width: 2; color: "black" }
            color: "lightgreen"
        }
    }

    footer:
        RowLayout {
        Button {
            text: qsTr("Previous")
            Layout.fillWidth: true
            onClicked: console.log("Previous page")
            font.pixelSize: 24
        }
        Label {
            text: "0"
            font.pixelSize: 24
        }
        Button {
            text: qsTr("Next")
            font.pixelSize: 24
            Layout.fillWidth: true
            onClicked: console.log("Next page")
        }
    }

    Page {
        id: mainPage
        title: qsTr("Header: Page title")
        anchors.fill: parent

        MainPage {
            anchors.fill: parent
        }
    }

    Popup {
        id: popup

        width: parent.width * 0.4
        height: parent.height * 0.4
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        Label {
            anchors { fill: parent; horizontalCenter: parent.horizontalCentr; verticalCenter: parent.verticalCenter }
            font { pointSize: 40 }
            minimumPointSize: 8
            fontSizeMode: Text.Fit
            text: qsTr("This is a Qt Quick \n Controls Application")
        }
    }

}
