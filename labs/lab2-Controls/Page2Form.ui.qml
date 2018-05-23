import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    id: page

    RowLayout {
        id: rowLayout
        anchors.fill: parent

        GroupBox {
            id: groupBox
            width: 200
            height: 200
            font.pointSize: 20
            title: qsTr("Controls")

            ColumnLayout {
                id: columnLayout
                anchors.fill: parent

                Label {
                    id: label
                    text: qsTr("NOF images shown")
                    Layout.fillWidth: false
                    font.pointSize: 20
                }

                Dial {
                    id: dial
                    stepSize: 1
                    to: 100
                    from: 1
                    value: 1
                }
            }
        }

        PathView {
            id: pathView
            width: 250
            height: 130
            pathItemCount: dial.value
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: imageModel
path: Path {
                startX: pathView.width * 0.05
                startY: pathView.height * 0.05
                PathLine {
                    x: pathView.width / 2
                    y: pathView.height * 0.85
                }
                PathLine {
                    x: pathView.width * 0.95
                    y: pathView.height * 0.05
                }
            }

            delegate: Image {
                width: 100
                height: 100
                source: fileUrl
            }
        }
    }
}
