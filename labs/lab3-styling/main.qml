import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Material 2.0
import Theme 1.0

ApplicationWindow {
    id: window
    visible: true
    width: Theme.windowWidth
    height: Theme.windowHeight
    title: qsTr("Styling")
    minimumWidth: Theme.windowMinWidth
    minimumHeight: Theme.windowMinHeight

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
        height: Theme.headerHeight
        font.pixelSize: Theme.extraLargeSize
        minimumPixelSize: Theme.smallSize
        fontSizeMode: Text.Fit
        text: stackView.currentItem.title
        background: Rectangle {
            anchors.fill: parent
            border { width: Theme.borderWidth; color: Theme.borderColor }
            color: Theme.backgroundColor
        }
    }

    footer:
        RowLayout {
        Button {
            Material.accent: Material.Red
            Material.theme: Material.Dark

            text: qsTr("Previous")
            Layout.fillWidth: true
            font: Theme.defaultFont
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
            font: Theme.defaultFont
        }
        Button {
            text: qsTr("Next")
            font: Theme.defaultFont
            Layout.fillWidth: true
            onClicked: {
                if (stackView.depth > 1) {
                    messageDialog.text = qsTr("No more pages to push");
                    messageDialog.open();
                }
                else
                    stackView.push("qrc:/ImageViewPage.qml", {"title": qsTr("Page ") + (stackView.depth + 1)});
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
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

    Page {
        id: mainPage
        title: qsTr("Main Page")

        MainPage {
            anchors.fill: parent
        }
    }

    Drawer {
        id: pageNavigator
        width: Theme.drawerWidth * window.width
        height: window.height
        background: Rectangle {
            Image {
                anchors.centerIn: parent
                source: Theme.backgroundImage
            }
        }

        ComboBox {
            id: comboBox
            anchors.top: parent.top
            width: parent.width
            font.pixelSize: Math.min(Math.floor(Theme.largeScaleFactor * width), Theme.defaultFont.pixelSize)
            delegate: ItemDelegate {
                width: pageNavigator.width
                Rectangle {
                    anchors.fill: parent
                    border { width: Theme.borderWidth; color: Theme.borderColor }
                    color: Theme.backgroundColor
                    Text {
                        text: modelData
                        anchors.centerIn: parent
                        font.pixelSize: Math.min(Math.floor(Theme.smallScaleFactor * pageNavigator.width), Theme.mediumSize)
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
