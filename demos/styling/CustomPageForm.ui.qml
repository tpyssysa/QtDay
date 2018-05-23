import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Theme 1.0

Item {
    property alias title: page.title
    readonly property real mInFeet: 3.28
    readonly property real kgInLb: 2.2

    Page {
        id: page
        //        backgroundVisible: false
        font: Theme.defaultFont
        anchors.fill: parent

        ColumnLayout {
            id: pageLayout
            anchors.fill: parent

            Switch {
                id: unitSwitch
                text: qsTr("Metric/Imperial")
                font: Theme.defaultFont
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
                    font: Theme.defaultFont
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
                    text: qsTr("Weight ") + (unitSwitch.checked ? qsTr("(lb)") : qsTr(
                                                                      "(kg)"))
                    font: Theme.defaultFont
                }

                SpinBox {
                    id: weightSpinbox
                    Layout.fillWidth: true
                    font: Theme.defaultFont
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
                                                     * (heightSlider.value
                                                        / mInFeet))) : Math.floor(
                                                  weightSpinbox.value
                                                  / (heightSlider.value * heightSlider.value)))
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                font.pixelSize: Theme.largeSize
                fontSizeMode: Text.FixedSize
            }
        }
    }
}
