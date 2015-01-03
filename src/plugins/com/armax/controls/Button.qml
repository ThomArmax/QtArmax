import QtQuick 2.0
import com.armax.controls 1.0

Checkable {

    // public properties
    property Style      style               : Style {}

    property alias      text                : txt.text
    property color      textColor           : style.textColor

    property color      colorWhenDefault    : style.colorWhenDefault
    property color      colorWhenPressed    : style.colorWhenPressed
    property color      colorWhendChecked   : style.colorWhenChecked
    property color      colorWhenHovered    : style.colorWhenHovered
    property color      colorWhenDisabled   : style.colorWhenDisabled

    property Gradient   gradientWhenDefault : style.gradientWhenDefault
    property Gradient   gradientWhenPressed : style.gradientWhenPressed
    property Gradient   gradientWhendChecked: style.gradientWhenChecked
    property Gradient   gradientWhenHovered : style.gradientWhenHovered
    property Gradient   gradientWhenDisabled: style.gradientWhenDisabled

    property bool       useGradients        : true

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            gradientWhenDefault : null
            gradientWhenPressed : null
            gradientWhendChecked: null
            gradientWhenHovered : null
            gradientWhenDisabled: null
        }
    }

    width       : txt.paintedWidth + 20
    height      : txt.paintedHeight + 20
    checkable   : false

    Rectangle {
        id          : rectangle
        anchors.fill: parent
        color       : colorWhenDefault
        gradient    : gradientWhenDefault
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
            PropertyChanges { target: rectangle; gradient: gradientWhenHovered }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges { target: rectangle; color: colorWhenPressed }
            PropertyChanges { target: rectangle; gradient: gradientWhenPressed }
        },
        State {
            name: "checked"
            when: checked && checkable
            PropertyChanges { target: rectangle; color: colorWhendChecked }
            PropertyChanges { target: rectangle; gradient: gradientWhendChecked }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges { target: rectangle; color: colorWhenDisabled }
            PropertyChanges { target: rectangle; gradient: gradientWhenDisabled }
        }
    ]
}
