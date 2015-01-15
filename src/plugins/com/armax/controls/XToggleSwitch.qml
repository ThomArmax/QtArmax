import QtQuick 2.0
import com.armax.styles 1.0

XCheckable {
    property XStyle     style                           : XDarkBlueStyle{}

    property int        radius                          : style.radius

    property color      backgroundColor                 : style.colorWhenDefault
    property color      backgroundColorWhenDisabled     : style.colorWhenDefault
    property color      handleColor                     : style.colorWhenChecked
    property color      handleColorWhenDisabled         : style.colorWhenDisabled

    property Gradient   backgroundGradient              : style.gradientWhenDefault
    property Gradient   backgroundGradientWhenDisabled  : style.gradientWhenDefault
    property Gradient   handleGradient                  : style.gradientWhenChecked
    property Gradient   handleGradientWhenDisabled      : style.gradientWhenDisabled

    property int        borderWidth                     : style.borderWidth
    property color      borderColorWhenDefault          : style.borderColorWhenDefault
    property color      borderColorWhenPressed          : style.borderColorWhenPressed
    property color      borderColorWhenHovered          : style.borderColorWhenHovered
    property color      borderColorWhenChecked          : style.borderColorWhenChecked
    property color      borderColorWhenDisabled         : style.borderColorWhenDisabled

    property string     textWhenOn                      : "ON"
    property string     textWhenOff                     : "OFF"

    property color      textColorWhenOn                 : style.textColor
    property color      textColorWhenOff                : style.textColor

    property int        fontSize                        : style.defaultFontSize
    property bool       useGradients                    : true

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            backgroundGradient              = null
            backgroundGradientWhenDisabled  = null
            handleGradient                  = null
            handleGradientWhenDisabled      = null
        }
    }

    id      : root
    width   : 85
    height  : style.defaultControlsHeight
    states  : [
        State {
            name: "on"
            when: checked
            PropertyChanges { target: handle; x: root.width/2 }
        },
        State {
            when: !checked
            name: "off"
            PropertyChanges { target: handle; x: 0 }
        },
        State {
            name: "disabled"
            PropertyChanges { target: base; color: backgroundColorWhenDisabled; gradient: backgroundGradientWhenDisabled }
            PropertyChanges { target: handle; color: handleColorWhenDisabled; gradient: handleGradientWhenDisabled }
        }
    ]

    Rectangle {
        id          : base
        anchors.fill: parent
        radius      : root.radius
        smooth      : true
        color       : backgroundColor
        gradient    : backgroundGradient

        Row {
            anchors.fill    : parent
            anchors.margins : 2
            Item {
                id      : onTxtContainer
                height  : parent.height
                width   : parent.width/2
                Text {
                    anchors.fill        : parent
                    anchors.leftMargin  : 2
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignLeft
                    color               : textColorWhenOn
                    font.pointSize      : fontSize > 0 ? fontSize : 10
                    text                : textWhenOn
                    clip                : true
                }
            }
            Item {
                id      : offTxtContainer
                height  : parent.height
                width   : parent.width/2
                Text {
                    anchors.fill        : parent
                    anchors.leftMargin  : 10
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignRight
                    color               : textColorWhenOff
                    font.pointSize      : fontSize > 0 ? fontSize : 10
                    text                : textWhenOff
                    clip                : true
                }
            }
        } // END Row
        Rectangle {
            id      : handle
            width   : parent.width / 2
            height  : parent.height
            color   : root.enabled ? handleColor : handleColorWhenDisabled
            gradient: root.enabled ? handleGradient : handleGradientWhenDisabled
            radius  : root.radius
            Behavior on x { SpringAnimation { spring: 3; damping: 0.3; loops:Animation.Infinite } }
        }

    }
}

