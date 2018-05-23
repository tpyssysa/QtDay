import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("StackView")
    minimumHeight: 400
    minimumWidth: 380

    header: Label {
        horizontalAlignment: Text.AlignHCenter
        height: 60
        font.pixelSize: 108
        minimumPixelSize: 8
        fontSizeMode: Text.Fit
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
            }

            font.pixelSize: 24
        }
        Label {
            text: stackView.depth
            font.pixelSize: 24
        }
        Button {
            text: qsTr("Next")
            font.pixelSize: 24
            Layout.fillWidth: true
            onClicked: {
                stackView.push(mainPage.createObject(stackView, {"title": qsTr("Page ") + (stackView.depth + 1) } ));
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage.createObject();
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

    Component {
        id: mainPage

        Page {
            title: qsTr("Main Page")

            MainPage {
                anchors.fill: parent
            }
        }
    }
}
