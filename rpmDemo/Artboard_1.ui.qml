import QtQuick 2.8
import QtQuick.Timeline 1.0
import Data 1.0 as Data
import QtQuick.Controls 2.3
import QtQuick.Studio.Effects 1.0

Item {
    id: artboard_1
    width: 1920
    height: 1080
    property alias arc_track: arc_track

    Image {
        id: artboard_1Asset
        x: 0
        y: 0
        source: "artboard_1_576_40.png"
    }

    Item {
        id: rpm_dial
        x: 743
        y: 277

        Image {
            id: white_ring
            x: 22
            y: 32
            source: "white_ring_576_3.png"
        }

        Arc_track {
            id: arc_track
            x: 48
            y: 47
            displayRpmText: Data.Values.displayRpm
            rpm: Data.Values.rpm
        }

        Image {
            id: ellipse_4_copy_2
            x: 35
            y: 230
            source: "ellipse_4_copy_2_576_8.png"
        }

        Image {
            id: ellipse_4_copy_21
            x: 99
            y: 383
            source: "ellipse_4_copy_2_576_9.png"
        }

        Image {
            id: ellipse_4_copy_22
            x: 98
            y: 75
            source: "ellipse_4_copy_2_576_10.png"
        }

        Image {
            id: ellipse_4_copy_23
            x: 144
            y: 418
            source: "ellipse_4_copy_2_576_11.png"
        }

        Image {
            id: ellipse_4_copy_6
            x: 197
            y: 438
            source: "ellipse_4_copy_6_576_12.png"
        }

        Image {
            id: ellipse_4_copy_7
            x: 251
            y: 445
            source: "ellipse_4_copy_7_576_13.png"
        }

        Image {
            id: ellipse_4_copy_8
            x: 315
            y: 435
            source: "ellipse_4_copy_8_576_14.png"
        }

        Image {
            id: ellipse_4_copy_24
            x: 64
            y: 121
            source: "ellipse_4_copy_2_576_15.png"
        }

        Image {
            id: ellipse_4_copy_25
            x: 42
            y: 173
            source: "ellipse_4_copy_2_576_16.png"
        }

        Image {
            id: ellipse_4_copy_26
            x: 42
            y: 286
            source: "ellipse_4_copy_2_576_17.png"
        }

        Image {
            id: ellipse_4_copy_27
            x: 64
            y: 338
            source: "ellipse_4_copy_2_576_18.png"
        }

        Image {
            id: ellipse_4_copy_28
            x: 144
            y: 40
            source: "ellipse_4_copy_2_576_19.png"
        }

        Text {
            id: copy_2
            x: 323
            y: 473
            color: "#FFFFFF"
            text: "0"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget1
            x: 251
            y: 477
            color: "#FFFFFF"
            text: "1"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget2
            x: 185
            y: 470
            color: "#FFFFFF"
            text: "2"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget3
            x: 120
            y: 445
            color: "#FFFFFF"
            text: "3"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget4
            x: 64
            y: 404
            color: "#FFFFFF"
            text: "4"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget5
            x: 31
            y: 351
            color: "#FFFFFF"
            text: "5"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget6
            x: 6
            y: 283
            color: "#FFFFFF"
            text: "6"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget7
            x: 0
            y: 220
            color: "#FFFFFF"
            text: "7"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget8
            x: 7
            y: 158
            color: "#FFFFFF"
            text: "8"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget9
            x: 27
            y: 95
            color: "#FFFFFF"
            text: "9"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget10
            x: 64
            y: 40
            color: "#FFFFFF"
            text: "10"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }

        Text {
            id: gadget11
            x: 120
            y: 0
            color: "#FFFFFF"
            text: "11"
            font.pixelSize: 0
            font.family: "FlamaSemicondensed-Ultralight"
        }
    }

    Timeline {
        id: timeline
        endFrame: 1000
        startFrame: 0
        enabled: true
    }
}



/*##^## Designer {
    D{i:29}
}
 ##^##*/
