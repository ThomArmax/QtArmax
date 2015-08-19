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
   \qmltype XProgressBar
   \inqmlmodule com.armax.controls 1.0
   \ingroup qmlmodules
   \brief A progress indicator.

    The XProgressBar is used to give an indication of the progress of an operation.
    Value is updated regularly and must be between 0 and 100, which is expressed in percent.

    \code
    XProgressBar {
        id: progress
    }

    Timer {
        running: true
        interval: 500
        repeat: true
        onTriggered : {
            if(progress.progress < 100)
                progress.progress += 1
            else
                progress.progress = 0
        }
    }
    \endcode

    You can create a custom appearance for a \l{XProgressBar} by assigning a \l{XStyle}.
 */
Item {
    // public properties
    property int        progress                : 0

    property XStyle     style                   : XDarkBlueStyle{}
    property int        radius                  : style.radius

    property color      backgoundColor          : style.colorWhenDefault
    property Gradient   backgroundGradient      : style.gradientWhenDefault

    property color      progressColor           : style.colorWhenChecked
    property Gradient   progressGradient        : style.gradientWhenChecked

    property int        borderWidth             : style.borderWidth
    property color      borderColor             : style.borderColorWhenDefault

    property color      fontColor               : style.controlsFontColor
    property int        fontSize                : style.defaultFontSize

    property bool       useGradients            : style.useGradients
    property bool       showProgress            : true

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            backgroundGradient  = null
            progressGradient    = null
        }
    }

    //Behavior on progress { NumberAnimation { duration: 75 } }
    //Behavior on progress { SpringAnimation { spring: 2; damping: 0.2; loops:Animation.Infinite } }

    id      : root
    width   : 100
    height  : style.defaultControlsHeight
    Rectangle {
        id              : progressBase
        anchors.fill    : parent
        radius          : root.radius
        color           : backgoundColor
        gradient        : backgroundGradient
        border.width    : borderWidth
        border.color    : borderColor
        Item {
            id              : progressContainer
            anchors.fill    : parent
            anchors.margins : 3
            Rectangle {
                id                      : sliderProgress
                height                  : parent.height
                width                   : parent.width*progress/100
                anchors.verticalCenter  : parent.verticalCenter
                color                   : progressColor
                gradient                : progressGradient
                radius                  : progressBase.radius
                Behavior on width { NumberAnimation { duration: 75 } }
            }
        }
        Text {
            visible             : showProgress
            anchors.fill        : parent
            verticalAlignment   : Text.AlignVCenter
            horizontalAlignment : Text.AlignHCenter
            text                : progress + "%"
            color               : fontColor
            font.pointSize      : fontSize > 0 ? fontSize : 10
        }
    }
}

