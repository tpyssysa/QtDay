import QtQuick 2.8
import QtQuick.Timeline 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Studio.Effects 1.0

Image {
    id: arc_track
    property alias rpm: timeline.currentFrame
    property alias displayRpmText: gadget.text
    source: "arc_track_576_21.png"

    Image {
        id: background_guage
        x: 85
        y: 62
        source: "background_guage_576_4.png"

        Text {
            id: x_1000
            x: 85
            y: 191
            color: "#FFFFFF"
            text: "X 1000"
            font.weight: Font.ExtraLight
            font.pixelSize: 22
            font.family: "IBMPlexMono-ExtraLight"
        }

        Text {
            id: rpm_copy
            x: 88
            y: 152
            color: "#FFFFFF"
            text: "RPM"
            font.pixelSize: 35
            font.family: "IBMPlexMono-ExtraLight"
        }
        Text {
            id: gadget
            x: -8
            y: 76
            width: 264
            height: 59
            color: "#f3f1f1"
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            font.family: "FlamaSemicondensed-Book"
        }
    }

    Timeline {
        id: timeline
        endFrame: 4000
        startFrame: 0
        enabled: true

        KeyframeGroup {
            target: item1
            property: "rotation"

            Keyframe {
                frame: 0
                value: -135
            }

            Keyframe {
                easing.bezierCurve: [0.25, 0.25, 0.75, 0.75, 1, 1]
                frame: 11066.418
                value: 36
            }
        }

        KeyframeGroup {
            target: arc
            property: "end"

            Keyframe {
                frame: 11081.06
                value: 62
            }

            Keyframe {
                frame: 0
                value: -108.9
            }
        }

        KeyframeGroup {
            target: arc
            property: "strokeColor"

            Keyframe {
                frame: 11.081
                value: "#76ea7a"
            }

            Keyframe {
                frame: 4443.505
                value: "#d48f55"
            }

            Keyframe {
                frame: 4432.424
                value: "#76ea7a"
            }

            Keyframe {
                frame: 11081.06
                value: "#f04044"
            }

            Keyframe {
                frame: 7269.175
                value: "#d48f55"
            }

            Keyframe {
                frame: 7280.256
                value: "#f04044"
            }
        }

        KeyframeGroup {
            target: pie
            property: "strokeColor"

            Keyframe {
                value: "#76ea7a"
                frame: 12
            }

            Keyframe {
                value: "#76ea7a"
                frame: 4451
            }

            Keyframe {
                value: "#d48f55"
                frame: 4609
            }

            Keyframe {
                value: "#d48f55"
                frame: 7248
            }

            Keyframe {
                value: "#f04044"
                frame: 7357
            }
        }
    }

    PieItem {
        id: pie
        x: 77
        y: 54
        width: 264
        height: 264
        end: 360
        strokeWidth: 4.1
    }

    ArcItem {
        id: arc
        x: 6
        y: -16
        width: 405
        height: 405
        end: 62
        begin: -108.9
        strokeWidth: 40
    }
    Item {
        id: item1
        x: 183
        y: 161
        width: 50
        height: 50

        Image {
            id: needle
            x: -164
            y: -68
            source: "needle_576_22.png"
        }
    }
}




/*##^## Designer {
    D{i:0;height:397;width:280}D{i:5;timeline_expanded:true;y:false}D{i:39;timeline_expanded:true}
D{i:7;timeline_expanded:true}D{i:18;timeline_expanded:true}D{i:25;timeline_expanded:true}
D{i:6}D{i:26;timeline_expanded:true}D{i:27;timeline_expanded:true}
}
 ##^##*/
