import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Lab 1")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&Edit")
            Action {
                text: qsTr("Add images")
                onTriggered: fileDialog.open();
            }
        }
    }

    header: Label {
        horizontalAlignment: Text.AlignHCenter
        height: font.pixelSize * 2
        font.pixelSize: 24
        text: stackView.currentItem.title
        background: Rectangle {
            anchors.fill: parent
            border { width: 2; color: "black" }
            color: "lightgreen"
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
        pushEnter: Transition {
            ParallelAnimation {
                NumberAnimation { property: "scale"; from: 0.0; to: 1.0 }
                NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
            }
        }
        pushExit: Transition {
            ParallelAnimation {
                NumberAnimation { property: "scale"; from: 1.0; to: 0.0 }
                NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
            }
        }
        popEnter: Transition {
            id: popEnter
            ParallelAnimation {
                PropertyAction { property: "opacity"; value: 1.0 }
                PropertyAction { property: "scale"; value: 1.0 }
                NumberAnimation { property: "x"; from: -popEnter.ViewTransition.item.width; to: 0.0 }
            }
        }
        popExit: Transition {
            id: popExit
            NumberAnimation { property: "x"; from: 0.0; to: popExit.ViewTransition.item.width }
        }
    }

    MessageDialog {
        id: messageDialog
    }

    FileDialog {
        id: fileDialog
        title: "Please choose image files"
        folder: shortcuts.home
        selectMultiple: true
        onAccepted: {
            for (var i = 0; i < fileUrls.length; ++i) {
                imageModel.append({"fileUrl": fileUrls[i]});
            }
            messageDialog.text = qsTr("Images added to the model");
            messageDialog.open();
        }
    }

    ListModel {
        id: imageModel
    }
}
