pragma Singleton

import QtQuick 2.8

QtObject {
    // Window
    readonly property int windowWidth: 640
    readonly property int windowHeight: 480
    readonly property int windowMinWidth: 380
    readonly property int windowMinHeight: 400

    // Window header
    readonly property int headerHeight: 60

    // Page
    readonly property int bottomMargin: 50

    // Frame
    readonly property int borderWidth: 2
    readonly property color borderColor: "black"
    readonly property color backgroundColor: "lightgreen"

    // Drawer
    readonly property real drawerWidth: 0.55
    readonly property string backgroundImage: "qrc:/images/qt_logo.png"

    // Font
    property font defaultFont
    defaultFont.pixelSize: 24
    defaultFont.family: "arial"

    readonly property int smallSize: 8
    readonly property int mediumSize: 20
    readonly property int largeSize: 48
    readonly property int extraLargeSize: 108

    readonly property real smallScaleFactor: 0.06
    readonly property real largeScaleFactor: 0.07
}
