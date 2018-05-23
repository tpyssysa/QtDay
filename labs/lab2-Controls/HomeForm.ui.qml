import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Page {
    id: page
    readonly property real mInFeet: 3.28
    readonly property real kgInLb: 2.2
    title: qsTr("Main Page")

    // anchors.fill: parent
    ColumnLayout {
        id: pageLayout
        anchors.fill: parent

        Switch {
            id: unitSwitch
            text: qsTr("Metric/Imperial")
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: heightLayout
            Layout.fillWidth: true
            height: childrenRect.height
            Label {
                id: heightLabel
                text: (unitSwitch.checked ? qsTr("Height (ft) ") : qsTr(
                                                "Height (m) "))
                      + (Math.round(heightSlider.value * 100) / 100)
            }

            Slider {
                id: heightSlider
                Layout.fillWidth: true
                from: unitSwitch.checked ? 0.4 * mInFeet : 0.4
                to: unitSwitch.checked ? 3 * mInFeet : 3
                value: unitSwitch.checked ? 1.7 * mInFeet : 1.7
            }
        }

        ColumnLayout {
            id: weightLayout
            Layout.fillWidth: true

            Label {
                id: weightLabel
                text: qsTr(
                          "Weight ") + (unitSwitch.checked ? qsTr(
                                                                 "(lb)") : qsTr(
                                                                 "(kg)"))
            }

            SpinBox {
                id: weightSpinbox
                Layout.fillWidth: true
                from: unitSwitch.checked ? 15 * kgInLb : 15
                value: unitSwitch.checked ? 50 * kgInLb : 50
                to: unitSwitch.checked ? 250 * kgInLb : 250
            }
        }

        Label {
            id: bmiLabel
            text: qsTr("BMI: ")
                  + (unitSwitch.checked ? Math.floor(
                                              (weightSpinbox.value / kgInLb)
                                              / ((heightSlider.value / mInFeet)
                                                 * (heightSlider.value / mInFeet))) : Math.floor(
                                              weightSpinbox.value
                                              / (heightSlider.value * heightSlider.value)))
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            font.pixelSize: 24
            fontSizeMode: Text.FixedSize
        }
    }
}
