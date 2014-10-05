import QtQuick 2.0
import com.armax.controls 1.0

Checkable {

    // public properties
    property Style style            : Style {}

    property alias text             : txt.text
    property color textColor        : style.textColor

    property color colorWhenDefault : style.colorWhenDefault
    property color colorWhenPressed : style.colorWhenPressed
    property color colorWhendChecked: style.colorWhenChecked
    property color colorWhenHovered : style.colorWhenHovered
    property color colorWhenDisabled: style.colorWhenDisabled

    width       : txt.paintedWidth + 20
    height      : txt.paintedHeight + 20
    checkable   : false

    Rectangle {
        id          : rectangle
        anchors.fill: parent
        color       : colorWhenDefault
        radius      : 5
    }

    Text {
        id              : txt
        anchors.centerIn: parent
        text            : "Button"
        color           : textColor
        font.pointSize  : 12
    }

    states: [
        State {
            name: "default"
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges { target: rectangle; color: colorWhenHovered }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges { target: rectangle; color: colorWhenPressed }
        },
        State {
            name: "checked"
            when: checked && checkable
            PropertyChanges { target: rectangle; color: colorWhendChecked }
        },
        State {
            name: "disabled"
            when: disabled
            PropertyChanges { target: rectangle; color: colorWhenDisabled }
        }
    ]
}
