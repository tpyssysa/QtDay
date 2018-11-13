pragma Singleton
import QtQuick 2.10
import "simulation.js" as JS

QtObject {
    id: values

    property int rpm
    property string displayRpm

    property Timer needleTimer: Timer{
        running: true
        repeat: true
        onTriggered: JS.dialTimer()
        interval: 100
    }

    property Timer readoutTimer: Timer{
        running: true
        repeat: true
        onTriggered: JS.readoutTimer()
        interval: 100
    }

}

