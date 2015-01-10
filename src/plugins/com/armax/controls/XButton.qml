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
import com.armax.controls 1.0

XCheckable {

    // public properties
    property XStyle     style                   : XStyle {}

    property alias      text                    : txt.text
    property color      textColor               : style.textColor

    property color      colorWhenDefault        : style.colorWhenDefault
    property color      colorWhenPressed        : style.colorWhenPressed
    property color      colorWhenChecked        : style.colorWhenChecked
    property color      colorWhenHovered        : style.colorWhenHovered
    property color      colorWhenDisabled       : style.colorWhenDisabled

    property int        borderWidth             : style.borderWidth
    property color      borderColorWhenDefault  : style.borderColorWhenDefault
    property color      borderColorWhenPressed  : style.borderColorWhenPressed
    property color      borderColorWhenHovered  : style.borderColorWhenHovered
    property color      borderColorWhenChecked  : style.borderColorWhenChecked
    property color      borderColorWhenDisabled : style.borderColorWhenDisabled

    property Gradient   gradientWhenDefault     : style.gradientWhenDefault
    property Gradient   gradientWhenPressed     : style.gradientWhenPressed
    property Gradient   gradientWhenChecked     : style.gradientWhenChecked
    property Gradient   gradientWhenHovered     : style.gradientWhenHovered
    property Gradient   gradientWhenDisabled    : style.gradientWhenDisabled

    property int        radius                  : style.radius

    property bool       useGradients            : true
    property real       animationDuration       : style.controlAnimationDuration

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

    id          : root
    width       : txt.paintedWidth + 20
    height      : txt.paintedHeight + 10
    checkable   : false

    Rectangle {
        id          : rectangle
        anchors.fill: parent
        color       : colorWhenDefault
        gradient    : gradientWhenDefault
        radius      : root.radius
        border.width: borderWidth
        border.color: borderColorWhenDefault
        state       : root.state
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
            PropertyChanges { target: rectangle; color          : colorWhenHovered          }
            PropertyChanges { target: rectangle; gradient       : gradientWhenHovered       }
            PropertyChanges { target: rectangle; border.color   : borderColorWhenHovered    }
        },
        State {
            name: "pressed"
            when: pressed && !checkable
            PropertyChanges { target: rectangle; color          : colorWhenPressed          }
            PropertyChanges { target: rectangle; gradient       : gradientWhenPressed       }
            PropertyChanges { target: rectangle; border.color   : borderColorWhenPressed    }
        },
        State {
            name: "checked"
            when: checked && checkable
            PropertyChanges { target: rectangle; color          : colorWhenChecked          }
            PropertyChanges { target: rectangle; gradient       : gradientWhenChecked       }
            PropertyChanges { target: rectangle; border.color   : borderColorWhenChecked    }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges { target: rectangle; color          : colorWhenDisabled         }
            PropertyChanges { target: rectangle; gradient       : gradientWhenDisabled      }
            PropertyChanges { target: rectangle; border.color   : borderColorWhenDisabled   }
        }
    ]
}
