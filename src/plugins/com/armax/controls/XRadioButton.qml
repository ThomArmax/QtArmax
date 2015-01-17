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
   \qmltype XRadioButton
   \inqmlmodule com.armax.controls 1.0
   \ingroup controls
   \brief A radio button with a text label.

    A XRadioButton is an option button that can be switched on (checked) or off (unchecked).

    Radio buttons typically present the user with a "one of many" choices.

    In a group of radio buttons, only one radio button can be checked at a time;
    if the user selects another button, the previously selected button is switched off.

    The label is shown next to the checkbox, and you can set the label text using its label property.
 */
XCheckable {

    // public properties
    property XStyle     style                           : XDarkBlueStyle{}

    property color      colorWhenDefault                : style.colorWhenDefault
    property color      colorWhenDisabled               : style.colorWhenDisabled

    property color      handleColorWhenChecked          : style.handleColorWhenDefault
    property color      handleColorWhenDisabled         : style.handleColorWhenDisabled

    property int        borderWidth                     : style.borderWidth
    property color      borderColorWhenDefault          : style.borderColorWhenDefault
    property color      borderColorWhenDisabled         : style.borderColorWhenDisabled

    property color      handleBorderColorWhenChecked    : style.handleBorderColorWhenChecked
    property color      handleBorderColorWhenDisabled   : style.handleBorderColorWhenDisabled

    property Gradient   gradientWhenDefault             : style.gradientWhenDefault
    property Gradient   gradientWhenDisabled            : style.gradientWhenDisabled

    property Gradient   handleGradientWhenChecked       : style.handleGradientWhenDefault
    property Gradient   handleGradientWhenDisabled      : style.handleGradientWhenDisabled

    property alias      label                           : labelTxt
    property int        radioButtonWidth                : radioButtonHeight
    property int        radioButtonHeight               : style.defaultControlsHeight

    property bool       useGradients                    : true

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            gradientWhenDefault         = null
            gradientWhenDisabled        = null
            handleGradientWhenChecked   = null
            handleGradientWhenDisabled  = null
        }
    }

    id      : root
    width   : hLayout.implicitWidth
    height  : hLayout.implicitHeight

    Row {
        id      : hLayout
        height  : style.defaultControlsHeight
        spacing : 10
        Text {
            id                  : labelTxt
            height              : parent.implicitHeight
            verticalAlignment   : Text.AlignVCenter
            color               : root.style.fontColor
            font.pointSize      : root.style.defaultFontSize
            visible             : text !== ""
        }

        Rectangle {
            id              : base
            width           : radioButtonWidth
            height          : radioButtonHeight
            radius          : width/2
            color           : colorWhenDefault
            gradient        : gradientWhenDefault
            border.width    : borderWidth
            border.color    : borderColorWhenDefault
            smooth          : true
            Rectangle {
                id              : handle
                width           : 0.8*parent.width
                height          : 0.8*parent.height
                anchors.centerIn: parent
                radius          : width/2
                color           : handleColorWhenChecked
                gradient        : handleGradientWhenChecked
                border.width    : borderWidth
                border.color    : handleBorderColorWhenChecked
                smooth          : true
                Behavior on opacity { NumberAnimation { duration: style.controlAnimationDuration } }
            } // END Rectangle handle
        } // END Rectangle base
    } // END hLayout

    states: [
        State {
            name: "default"
            when: !checked && enabled
            PropertyChanges { target: handle; opacity       : 0                         }
            PropertyChanges { target: base;   color         : colorWhenDefault          }
            PropertyChanges { target: base;   gradient      : gradientWhenDefault       }
            PropertyChanges { target: base;   border.color  : borderColorWhenDefault    }
        },
        State {
            name: "checked"
            when: checked && enabled
        },
        State {
            name: "disabledChecked"
            when: !enabled && checked
            PropertyChanges { target: handle; color         : handleColorWhenDisabled       }
            PropertyChanges { target: handle; gradient      : handleGradientWhenDisabled    }
            PropertyChanges { target: handle; border.color  : handleBorderColorWhenDisabled }
            PropertyChanges { target: base;   color         : colorWhenDisabled             }
            PropertyChanges { target: base;   gradient      : gradientWhenDisabled          }
            PropertyChanges { target: base;   border.color  : borderColorWhenDisabled       }
        },
        State {
            name: "disabledUnchecked"
            when: !enabled && !checked
            PropertyChanges { target: handle; opacity       : 0                             }
            PropertyChanges { target: base;   color         : colorWhenDisabled             }
            PropertyChanges { target: base;   gradient      : gradientWhenDisabled          }
            PropertyChanges { target: base;   border.color  : borderColorWhenDisabled       }
        }
    ] // END states
}
