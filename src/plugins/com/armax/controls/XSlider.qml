/****************************************************************************
**
** Copyright (C) 2014 Thomas COIN
** Contact: esvcorp@gmail.com
**
** This file is part of the QtArmax library.
** QtArmax is free software; you can redistribute it and/or
** modify it under the terms of the GNU Library General Public
** License as published by the Free Software Foundation; either
** version 2 of the License, or (at your option) any later version.
**
** QtArmax is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
** Library General Public License for more details.
**
** You should have received a copy of the GNU Library General Public
** License along with libiberty; see the file COPYING.LIB.  If
** not, write to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
** Boston, MA 02110-1301, USA.
**
****************************************************************************/

import QtQuick 2.0
import com.armax.styles 1.0

/*!
   \qmltype XSlider
   \inqmlmodule com.armax.controls 1.0
   \ingroup qmlmodules
   \brief Provides a vertical or horizontal slider control.

    The slider is the classic control for providing a bounded value.
    It lets the user move a slider handle along a horizontal or vertical groove and translates
    the handle's position into a value within the legal range.

    \code
    Slider {
        id: slider
        minValue: -50
        maxValue: 50
        value: 25
    }
    \endcode

    The slider value is by default in the range [0, 100].
    If floats values are needed, you can set the \l{decimals} property.
    You can create a custom appearance for a \l{XSlider} by assigning a \l{XStyle}.
 */
Item {
    // public properties
    property real       minValue                        : 0
    property real       maxValue                        : 100
    property real       value                           : 0
    property int        decimals                        : 0

    property XStyle     style                           : XDarkBlueStyle{}

    property int        radius                          : style.radius

    property color      backgroundColor                 : style.colorWhenDefault
    property Gradient   backgroundGradient              : style.gradientWhenDefault

    property color      colorWhenDefault                : style.colorWhenDefault
    property color      colorWhenPressed                : style.colorWhenPressed
    property color      colorWhenHovered                : style.colorWhenHovered
    property color      colorWhenDisabled               : style.colorWhenDisabled

    property color      handleColorWhenDefault          : style.handleColorWhenDefault
    property color      handleColorWhenPressed          : style.handleColorWhenPressed
    property color      handleColorWhenHovered          : style.handleColorWhenHovered
    property color      handleColorWhenDisabled         : style.handleColorWhenDisabled

    property color      handleBorderColorWhenDefault    : style.handleBorderColorWhenDefault
    property color      handleBorderColorWhenPressed    : style.handleBorderColorWhenPressed
    property color      handleBorderColorWhenHovered    : style.handleBorderColorWhenHovered
    property color      handleBorderColorWhenDisabled   : style.handleBorderColorWhenDisabled

    property color      progressColor                   : style.colorWhenChecked
    property Gradient   progressGradient                : style.gradientWhenChecked

    property int        borderWidth                     : style.borderWidth
    property color      borderColorWhenDefault          : style.borderColorWhenDefault
    property color      borderColorWhenPressed          : style.borderColorWhenPressed
    property color      borderColorWhenHovered          : style.borderColorWhenHovered
    property color      borderColorWhenDisabled         : style.borderColorWhenDisabled

    property Gradient   gradientWhenDefault             : style.gradientWhenDefault
    property Gradient   gradientWhenPressed             : style.gradientWhenPressed
    property Gradient   gradientWhenHovered             : style.gradientWhenHovered
    property Gradient   gradientWhenDisabled            : style.gradientWhenDisabled

    property Gradient   handleGradientWhenDefault       : style.handleGradientWhenDefault
    property Gradient   handleGradientWhenPressed       : style.handleGradientWhenPressed
    property Gradient   handleGradientWhenHovered       : style.handleGradientWhenHovered
    property Gradient   handleGradientWhenDisabled      : style.handleGradientWhenDisabled

    property bool       useGradients                    : style.useGradients
    property bool       hoverEnabled                    : true
    property bool       showValue                       : true
    property color      fontColor                       : style.fontColor
    property color      fontColorWhenDisabled           : style.fontColorWhenDisabled
    property int        fontSize                        : style.defaultFontSize

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            backgroundGradient  = null
            progressGradient    = null
            gradientWhenDefault = null
            gradientWhenPressed = null
            gradientWhenHovered = null
            gradientWhenDisabled= null
        }
    }
    onValueChanged: {
        handle.updatePosition(value)
    }
    Component.onCompleted: handle.updatePosition(value)

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
            PropertyChanges { target: handle; color          : handleColorWhenHovered       }
            PropertyChanges { target: handle; gradient       : handleGradientWhenHovered    }
            PropertyChanges { target: handle; border.color   : borderColorWhenHovered       }
        },
        State {
            name: "pressed"
            when: dragArea.pressed
            PropertyChanges { target: handle; color          : handleColorWhenPressed       }
            PropertyChanges { target: handle; gradient       : handleGradientWhenPressed    }
            PropertyChanges { target: handle; border.color   : handleBorderColorWhenPressed }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges { target: handle;           color       : handleColorWhenDisabled       }
            PropertyChanges { target: handle;           gradient    : handleGradientWhenDisabled    }
            PropertyChanges { target: handle;           border.color: handleBorderColorWhenDisabled }
            PropertyChanges { target: sliderProgress;   visible     : false                         }
            PropertyChanges { target: sliderBase;       color       : colorWhenDisabled             }
            PropertyChanges { target: sliderBase;       gradient    : gradientWhenDisabled          }
            PropertyChanges { target: sliderBase;       border.color: borderColorWhenDisabled       }
            PropertyChanges { target: textValue;        color       : fontColorWhenDisabled         }
        }
    ]

    Rectangle {
        id              : sliderBase
        width           : parent.width -2//- slide.width
        height          : 0.4*parent.height
        anchors.centerIn: parent
        radius          : root.radius
        color           : backgroundColor
        gradient        : backgroundGradient
        border.width    : borderWidth
        border.color    : borderColorWhenDefault
        smooth          : true
        Item {
            id              : progressContainer
            anchors.fill    : parent
            anchors.margins : 3
            Rectangle {
                id                      : sliderProgress
                height                  : parent.height
                width                   : handle.x + handle.width/2
                anchors.verticalCenter  : parent.verticalCenter
                color                   : progressColor
                gradient                : progressGradient
                radius                  : 0.8*sliderBase.radius
                smooth                  : true
            }
        }
    }

    Rectangle {
        property int __activeArea: root.width - width
        property real percent : (100*x /__activeArea)
        function computeValue(x) {
            var ratio   = (x /__activeArea)
            percent     = (100*ratio).toFixed(decimals)
            value       = (((maxValue - minValue) * ratio) + minValue).toFixed(decimals)
            //console.debug("XSlider::computeValue : percent = " + percent + "%, value =", value)
        }
        function updatePosition(value) {
            var ratio   = (value - minValue) / (maxValue - minValue)
            percent     = (100*ratio).toFixed(decimals)
            x           = __activeArea*ratio
        }

        id          : handle
        width       : height
        height      : parent.height
        radius      : width/2
        color       : handleColorWhenDefault
        gradient    : handleGradientWhenDefault
        border.width: borderWidth
        border.color: handleBorderColorWhenDefault
        state       : root.state
        onXChanged  : computeValue(x)
        MouseArea {
            id              : dragArea
            anchors.fill    : parent
            drag.axis       : Drag.XAxis
            drag.minimumX   : 0
            drag.maximumX   : root.width-width
            drag.target     : handle
            hoverEnabled    : root.hoverEnabled
        }
        Text {
            id                      : textValue
            text                    : value
            anchors.bottom          : parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            visible                 : showValue
            color                   : fontColor
            font.pointSize          : fontSize > 0 ? fontSize : 10
        }
    }
}

