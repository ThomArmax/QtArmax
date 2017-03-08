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
   \qmltype XCircularProgress
   \inqmlmodule com.armax.controls 1.0
   \ingroup qmlmodules
   \brief A circular progress indicator.

    The XCircularProgress, as \l{XProgressBar}, is used to give an indication of the progress of an operation.
    Value is updated regularly and must be between 0 and 100, which is expressed in percent.

    \code
    XCircularProgress {
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

    You can create a custom appearance for a \l{XCircularProgress} by assigning a \l{XStyle}.
 */
Item {
    // public properties
    property int        progress                : 0

    property XStyle     style                   : XDarkBlueStyle {}

    property color      backgoundColor          : style.colorWhenChecked
    property Gradient   backgroundGradient      : style.gradientWhenChecked

    property color      progressColor           : style.colorWhenDefault
    property Gradient   progressGradient        : style.gradientWhenDefault

    property int        borderWidth             : style.borderWidth
    property color      borderColor             : style.borderColorWhenDefault

    property color      fontColor               : style.fontColor
    property int        fontSize                : style.defaultFontSize

    property int        backgroundLineSize      : 2
    property int        progressLineSize        : 4

    property bool       useGradients            : style.useGradients

    property string     text                    : progress + "%"

    // slots
    onUseGradientsChanged: {
        if(!useGradients) {
            backgroundGradient  = null
            progressGradient    = null
        }
    }
    onBackgoundColorChanged     : canvas.requestPaint()
    onProgressColorChanged      : canvas.requestPaint()
    onProgressChanged           : canvas.requestPaint()
    onProgressLineSizeChanged   : canvas.requestPaint()
    onBackgroundLineSizeChanged : canvas.requestPaint()

    id          : root
    width       : 240
    height      : 240
    antialiasing: true
    //Behavior on progress { SpringAnimation { spring: 2; damping: 0.2; loops:Animation.Infinite } }
    Behavior on progress { NumberAnimation { duration: 75 } }

    Canvas {
        id          : canvas
        anchors.fill: parent

        property real centerWidth   : width / 2
        property real centerHeight  : height / 2
        property real radius        : Math.min(canvas.width, canvas.height) / 2 - 2*Math.max(progressLineSize, backgroundLineSize)

        property real minimumValue  : 0
        property real maximumValue  : 100

        // this is the angle that splits the circle in two arcs
        // first arc is drawn from 0 radians to angle radians
        // second arc is angle radians to 2*PI radians
        property real angle         : (progress - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI

        // we want both circle to start / end at 12 o'clock
        // without this offset we would start / end at 9 o'clock
        property real angleOffset   : -Math.PI / 2

        onCenterWidthChanged        : requestPaint()
        onCenterHeightChanged       : requestPaint()
        onMinimumValueChanged       : requestPaint()
        onMaximumValueChanged       : requestPaint()
        onPaint                     : {
            var ctx = getContext("2d")
            ctx.save()

            ctx.clearRect(0, 0, canvas.width - Math.max(progressLineSize, backgroundLineSize), canvas.height- Math.max(progressLineSize, backgroundLineSize))

            // Draw background circle
            ctx.beginPath()
            ctx.lineWidth = backgroundLineSize
            ctx.strokeStyle = backgoundColor
            ctx.arc(canvas.centerWidth,
                    canvas.centerHeight,
                    canvas.radius,
                    angleOffset + canvas.angle,
                    angleOffset + 2*Math.PI)
            ctx.stroke()


            // Draw progress circle
            ctx.beginPath()
            ctx.lineWidth = progressLineSize
            ctx.strokeStyle = progressColor
            ctx.arc(canvas.centerWidth,
                    canvas.centerHeight,
                    canvas.radius,
                    canvas.angleOffset,
                    canvas.angleOffset + canvas.angle)
            ctx.stroke()

            ctx.restore()
        }

        Text {
            anchors.centerIn    : parent
            text                : root.text
            color               : fontColor
            horizontalAlignment : Text.AlignHCenter
            verticalAlignment   : Text.AlignVCenter
            font.pointSize      : fontSize > 0 ? fontSize : 10
        }
    }
}

