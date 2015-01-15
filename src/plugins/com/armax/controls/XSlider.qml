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

Item {
    // public properties
    property real       minValue                : 0
    property real       maxValue                : 100
    property real       value                   : 0
    property int        decimals                : 0

    property XStyle     style                   : XDarkBlueStyle{}
    property int        radius                  : style.radius

    property color      backgroundColor         : style.colorWhenDefault
    property Gradient   backgroundGradient      : style.gradientWhenDefault
    property color      colorWhenDefault        : style.colorWhenDefault
    property color      colorWhenPressed        : style.colorWhenPressed
    property color      colorWhenHovered        : style.colorWhenHovered
    property color      colorWhenDisabled       : style.colorWhenDisabled
    property color      progressColor           : style.colorWhenChecked
    property Gradient   progressGradient        : style.gradientWhenChecked

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
    onValueChanged: {
        slide.updatePosition(value)
    }
    Component.onCompleted: slide.updatePosition(value)

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
            PropertyChanges { target: slide; color              : colorWhenDisabled         }
            PropertyChanges { target: slide; gradient           : gradientWhenDisabled      }
            PropertyChanges { target: slide; border.color       : borderColorWhenDisabled   }
            PropertyChanges { target: sliderBase; color         : colorWhenDisabled         }
            PropertyChanges { target: sliderBase; gradient      : gradientWhenDisabled      }
            PropertyChanges { target: sliderBase; border.color  : borderColorWhenDisabled   }
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
        Item {
            id              : progressContainer
            anchors.fill    : parent
            anchors.margins : 3
            Rectangle {
                id                      : sliderProgress
                height                  : parent.height
                width                   : slide.x + slide.width/2
                anchors.verticalCenter  : parent.verticalCenter
                color                   : progressColor
                gradient                : progressGradient
                radius                  : sliderBase.radius
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

        id          : slide
        width       : height
        height      : parent.height
        radius      : width/2
        color       : colorWhenDefault
        gradient    : gradientWhenDefault
        border.width: borderWidth
        border.color: borderColorWhenDefault
        state       : root.state
        onXChanged  : computeValue(x)
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

