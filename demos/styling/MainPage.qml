import QtQuick 2.4

MainPageForm {
    button.onClicked: {
        if (timer.running) {
            timer.stop();
            periodicTimer.stop();
            button.text = qsTr("Start timer");
        }
        else {
                progressBar.value = 0;
            timer.start();
            periodicTimer.start();
            button.text = qsTr("Stop timer");
        }
    }

    Timer {
        property real step: 1 / (slider.value * 1000 / interval)
        id: periodicTimer
        running: false
        interval: 20
        repeat: true
        onTriggered: { 100
            progressBar.value += step;
        }
    }

    Timer {
        id: timer
        running: false
        interval: slider.value * 1000
        repeat: false
        onTriggered: {
            button.text = qsTr("Start timer");
            periodicTimer.stop();
        }
    }
}
