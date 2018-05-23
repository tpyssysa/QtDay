import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Lab 2")

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

    footer:
        RowLayout {
        Button {
            text: qsTr("Previous")
            Layout.fillWidth: true
            onClicked: {
                if (stackView.depth > 1)
                    stackView.pop();
                else {
                    messageDialog.text = qsTr("No pages to pop");
                    messageDialog.open();
                }
            }
        }
        Label {
            text: stackView.depth
        }
        Button {
            text: qsTr("Next")
            Layout.fillWidth: true
            onClicked: {
                if (stackView.depth > 1) {
                    messageDialog.text = qsTr("No more pages to push");
                    messageDialog.open();
                }
                else
                    stackView.push("qrc:/Page2Form.ui.qml", {"title": qsTr("Page ") + (stackView.depth + 1)});
            }
        }
    }

    Drawer {
        id: pageNavigator
        width: 0.6 * window.width
        height: window.height

        ComboBox {
            id: comboBox
            anchors.top: parent.top
            width: parent.width
            font.pixelSize: 10
            delegate: ItemDelegate {
                width: pageNavigator.width
                Rectangle {
                    anchors.fill: parent
                    border { width: 2; color: "lightgreen" }
                    color: "lightgreen"
                    Text {
                        text: modelData
                        anchors.centerIn: parent
                        font.pixelSize: 10
                    }
                }
            }
            model: {
                var itemModel = [];
                for (var i = 1; i < stackView.depth; ++i)
                    itemModel.push("Page " + i);
                return itemModel;
            }
            displayText: (stackView.depth === 1) ? qsTr("No pages in the stack") : qsTr("Navigate back to a page")
            onActivated: {
                stackView.pop(stackView.get(index));
                pageNavigator.close();
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
