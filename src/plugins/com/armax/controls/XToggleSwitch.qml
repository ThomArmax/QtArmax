import QtQuick 2.0
import com.armax.styles 1.0

XCheckable {
    property XStyle     style                           : XDarkBlueStyle{}

    property int        radius                          : style.radius

    property color      backgroundColor                 : style.colorWhenDefault
    property color      backgroundColorWhenDisabled     : style.colorWhenDisabled

    property color      handleColorWhenDefault          : style.handleColorWhenDefault
    property color      handleColorWhenPressed          : style.handleColorWhenPressed
    property color      handleColorWhenHovered          : style.handleColorWhenHovered
    property color      handleColorWhenDisabled         : style.handleColorWhenDisabled

    property Gradient   backgroundGradient              : style.gradientWhenDefault
    property Gradient   backgroundGradientWhenDisabled  : style.gradientWhenDisabled

    property Gradient   handleGradientWhenDefault       : style.handleGradientWhenDefault
    property Gradient   handleGradientWhenPressed       : style.handleGradientWhenPressed
    property Gradient   handleGradientWhenHovered       : style.handleGradientWhenHovered
    property Gradient   handleGradientWhenDisabled      : style.handleGradientWhenDisabled

    property color      handleBorderColorWhenDefault    : style.handleBorderColorWhenDefault
    property color      handleBorderColorWhenPressed    : style.handleBorderColorWhenPressed
    property color      handleBorderColorWhenHovered    : style.handleBorderColorWhenHovered
    property color      handleBorderColorWhenDisabled   : style.handleBorderColorWhenDisabled

    property int        borderWidth                     : style.borderWidth
    property color      borderColor                     : style.borderColorWhenDefault
    property color      borderColorWhenDisabled         : style.borderColorWhenDisabled


    property string     textWhenOn                      : "ON"
    property string     textWhenOff                     : "OFF"

    property color      textColorWhenOn                 : style.textColor
    property color      textColorWhenOff                : style.textColor

    property int        fontSize                        : style.defaultFontSize
    property bool       useGradients                    : true

    property int        handleMargins                   : 3

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            handleGradientWhenDefault       = style.handleGradientWhenDefault
            handleGradientWhenPressed       = style.handleGradientWhenPressed
            handleGradientWhenHovered       = style.handleGradientWhenHovered
            handleGradientWhenDisabled      = style.handleGradientWhenDisabled
            backgroundGradient              = style.gradientWhenDefault
            backgroundGradientWhenDisabled  = style.gradientWhenDisabled
        }
    }

    id      : root
    width   : 85
    height  : style.defaultControlsHeight
    states  : [
        State {
            name: "on"
            when: checked && enabled
            PropertyChanges { target: handle; x: parent.width/2 }
        },
        State {
            when: !checked && enabled
            name: "off"
            PropertyChanges { target: handle; x: 0 }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges { target: base; color: backgroundColorWhenDisabled; gradient: backgroundGradientWhenDisabled }
            PropertyChanges { target: base; border.color: handleBorderColorWhenDisabled }
            PropertyChanges { target: handle; color: handleColorWhenDisabled; gradient: handleGradientWhenDisabled }
            PropertyChanges { target: handle; x: enabled ? parent.width/2 : 0 }
        }
    ]

    Rectangle {
        id          : base
        anchors.fill: parent
        radius      : root.radius
        smooth      : true
        color       : backgroundColor
        gradient    : backgroundGradient
        border.width: borderWidth
        border.color: borderColor

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
                    anchors.rightMargin : 2
                    verticalAlignment   : Text.AlignVCenter
                    horizontalAlignment : Text.AlignRight
                    color               : textColorWhenOff
                    font.pointSize      : fontSize > 0 ? fontSize : 10
                    text                : textWhenOff
                    clip                : true
                }
            }
        } // END Row
        Item {
            id              : handleContainer
            anchors.fill    : parent
            anchors.margins : handleMargins
            Rectangle {
                id          : handle
                width       : parent.width / 2
                height      : parent.height
                color       : handleColorWhenDefault
                gradient    : handleGradientWhenDefault
                radius      : root.radius
                border.color: handleBorderColorWhenDefault
                border.width: borderWidth
                Behavior on x { SpringAnimation { spring: 3; damping: 0.3; loops:Animation.Infinite } }
            }
        }

    }
}
