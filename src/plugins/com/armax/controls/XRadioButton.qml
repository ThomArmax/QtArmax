import QtQuick 2.0
import com.armax.controls 1.0

XCheckable {
    // public properties
    property XStyle style                   : XStyle {}
    property color  colorWhenDefault        : style.colorWhenDefault
    property color  colorWhenChecked        : style.colorWhenChecked
    property real   opactityWhenDisabled    : 0.4
    property color  backgroundColor         : style.colorWhenDefault
    property color  backgroundBorderColor   : Qt.darker(backgroundColor)

    id          : root
    width       : 35
    height      : 35
    checkable   : true
    Rectangle {
        id          : base
        anchors.fill: parent
        radius      : base.width
        color       : backgroundColor
        border.color: backgroundBorderColor
        border.width: 1

        Rectangle {
            id              : checkRectangle
            anchors.fill    : parent
            anchors.margins : 0.2*parent.width
            radius          : width
            Behavior on color { ColorAnimation { duration : 100 } }
        }
    }

    states: [
        State {
            name: "default"
            when: !checked
            PropertyChanges { target: checkRectangle; color: colorWhenDefault }
            PropertyChanges { target: checkRectangle; border.color: colorWhenDefault }
        },
        State {
            name: "checked"
            when: checked
            PropertyChanges { target: checkRectangle; color: colorWhenChecked }
            PropertyChanges { target: checkRectangle; border.color: Qt.darker(colorWhenChecked) }
        }
    ]
}
