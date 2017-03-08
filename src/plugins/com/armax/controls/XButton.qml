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
import com.armax.controls 1.0

/*!
   \qmltype XButton
   \inqmlmodule com.armax.controls 1.0
   \ingroup qmlmodules
   \brief A push button with a text label.

    The push button is perhaps the most commonly used widget in any graphical user interface.

    Pushing (or clicking) a button commands the computer to perform some action or answer a question.

    Common examples of buttons are OK, Apply, Cancel, Close, Yes, No, and Help buttons.

    \code
    XButton {
        text: "Super Button"
    }
    \endcode

    You can create a custom appearance for a \l{XButton} by assigning a \l{XStyle}.
 */
XCheckable {

    // public properties
    property XStyle     style                   : XDarkBlueStyle{}

    property alias      text                    : txt.text
    property alias      textElement             : txt
    property color      fontColor               : style.controlsFontColor
    property color      fontColorWhenDisabled   : style.fontColorWhenDisabled
    property int        fontSize                : style.defaultFontSize
    property alias      textHAlignment          : txt.horizontalAlignment
    property alias      textVAlignment          : txt.verticalAlignment

    property alias      layoutDirection         : hLayout.layoutDirection
    property alias      layout                  : hLayout

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

    property bool       useGradients            : style.useGradients
    property real       animationDuration       : style.controlAnimationDuration

    property url        icon                    : ""
    property int        spacing                 : 4
    property int        margins                 : 4

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            gradientWhenDefault = null
            gradientWhenPressed = null
            gradientWhendChecked= null
            gradientWhenHovered = null
            gradientWhenDisabled= null
        }
    }

    id          : root
    width       : icon === "" ? (txt.paintedWidth) : (txt.paintedWidth + image.width + layout.spacing) + 20
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
        smooth      : true
        state       : root.state
    }

    Row {
        id              : hLayout
        anchors.fill    : parent
        anchors.margins : root.margins
        spacing         : root.spacing
        layoutDirection : Qt.LeftToRight

        Item {
            id      : imageItem
            height  : parent.height
            width   : visible ? height : 0
            visible : ((image.source != "") /*|| showIcon*/)

            Image {
                id                      : image
                height                  : parent.height < implicitHeight ? parent.height : implicitHeight
                width                   : height
                anchors.verticalCenter  : parent.verticalCenter
                source                  : icon
                fillMode                : Image.PreserveAspectFit
            }
        }
        Item {
            id      : textItem
            height  : parent.height
            width   : imageItem.visible ? root.width - imageItem.width - 3*root.spacing : root.width - 2 * root.spacing

            Text {
                id                  : txt
                anchors.fill        : parent
                horizontalAlignment : root.icon.toString() !== "" ?  (layout.layoutDirection === Qt.LeftToRight ? Text.AlignRight : Text.AlignLeft) : Text.AlignHCenter
                verticalAlignment   : Text.AlignVCenter
                text                : "Button"
                color               : fontColor
                font.pointSize      : fontSize > 0 ? fontSize : 10
                clip                : true
            }
        }
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
            PropertyChanges { target: txt;       color          : fontColorWhenDisabled     }
            PropertyChanges { target: rectangle; color          : colorWhenDisabled         }
            PropertyChanges { target: rectangle; gradient       : gradientWhenDisabled      }
            PropertyChanges { target: rectangle; border.color   : borderColorWhenDisabled   }
        }
    ]
}
