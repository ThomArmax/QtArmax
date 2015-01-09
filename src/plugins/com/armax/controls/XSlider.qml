import QtQuick 2.0

Item {
    // public properties
    property real       minValue                : 0
    property real       maxValue                : 100
    property real       value                   : 0
    property int        decimals                : 0

    property XStyle     style                   : XStyle{}
    property int        radius                  : style.radius

    property color      backgoundColor          : style.colorWhenDefault
    property color      colorWhenDefault        : style.colorWhenDefault
    property color      colorWhenPressed        : style.colorWhenPressed
    property color      colorWhenHovered        : style.colorWhenHovered
    property color      colorWhenDisabled       : style.colorWhenDisabled

    property int        borderWidth             : style.borderWidth
    property color      borderColorWhenDefault  : style.borderColorWhenDefault
    property color      borderColorWhenPressed  : style.borderColorWhenPressed
    property color      borderColorWhenHovered  : style.borderColorWhenHovered
    property color      borderColorWhenDisabled : style.borderColorWhenDisabled

    property Gradient   gradientWhenDefault     : style.gradientWhenDefault
    property Gradient   gradientWhenPressed     : style.gradientWhenPressed
    property Gradient   gradientWhenHovered     : style.gradientWhenHovered
    property Gradient   gradientWhenDisabled    : style.gradientWhenDisabled

    property bool       useGradients            : true
    property bool       hoverEnabled            : true

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            gradientWhenDefault : null
            gradientWhenPressed : null
            gradientWhenHovered : null
            gradientWhenDisabled: null
        }
    }

    id      : root
    width   : 100
    height  : 30
    states  : [
        State {
            name: "default"
        },
        State {
            name: "hovered"
            when: dragArea.hoverEnabled && dragArea.containsMouse
            PropertyChanges { target: slide; color          : colorWhenHovered          }
            PropertyChanges { target: slide; gradient       : gradientWhenHovered       }
            PropertyChanges { target: slide; border.color   : borderColorWhenHovered    }
        },
        State {
            name: "pressed"
            when: dragArea.pressed
            PropertyChanges { target: slide; color          : colorWhenPressed          }
            PropertyChanges { target: slide; gradient       : gradientWhenPressed       }
            PropertyChanges { target: slide; border.color   : borderColorWhenPressed    }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges { target: slide; color          : colorWhenDisabled         }
            PropertyChanges { target: slide; gradient       : gradientWhenDisabled      }
            PropertyChanges { target: slide; border.color   : borderColorWhenDisabled   }
        }
    ]

    Rectangle {
        id              : sliderBase
        width           : parent.width -2//- slide.width
        height          : 0.4*parent.height
        anchors.centerIn: parent
        radius          : root.radius
        color           : backgoundColor
        border.width    : borderWidth
        border.color    : borderColorWhenDefault
    }

    Rectangle {
        property int __activeArea: root.width - width
        function __computeValue(x) {
            var percent = 100*x /__activeArea
            console.debug("value =", percent, "%")
            value = percent
        }

        id          : slide
        width       : height
        height      : parent.height
        radius      : width/2
        color       : colorWhenDefault
        gradient    : gradientWhenDefault
        border.width: borderWidth
        border.color: borderColorWhenDefault
        state       : root.state
        onXChanged  : __computeValue(x)
        MouseArea {
            id              : dragArea
            anchors.fill    : parent
            drag.axis       : Drag.XAxis
            drag.minimumX   : 0
            drag.maximumX   : root.width-width
            drag.target     : slide
            hoverEnabled    : root.hoverEnabled
        }
    }
}

