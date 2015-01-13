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

XCheckable {

    // public properties
    property XStyle style                   : XStyle {}
    property color  colorWhenDefault        : style.colorWhenDefault
    property color  colorWhenChecked        : style.colorWhenChecked
    property alias  radius                  : base.radius
    property real   opactityWhenDisabled    : 0.4
    property color  backgroundColor         : style.colorWhenDefault
    property color  backgroundBorderColor   : Qt.darker(backgroundColor)

    property Image  imageWhenDefault        : null
    property Image  imageWhenChecked        : imageWhenDefault

    property alias  label                   : labelTxt
    property int    checkboxWidth           : checkboxHeight
    property int    checkboxHeight          : style.defaultControlsHeight

    // private properties
    property Image __currentImage           : imageWhenDefault

    id      : root
    width   : hLayout.implicitWidth
    height  : hLayout.implicitHeight
    opacity : enabled ? 1.0 : opactityWhenDisabled

    Row {
        id      : hLayout
        height  : style.defaultControlsHeight
        spacing : 10
        Text {
            id                  : labelTxt
            height              : parent.implicitHeight
            verticalAlignment   : Text.AlignVCenter
            color               : root.style.textColor
            font.pointSize      : root.style.defaultFontSize
            visible             : text !== ""
        }

        Rectangle {
            id              : base
            width           : checkboxWidth
            height          : checkboxHeight
            radius          : 5
            color           : backgroundColor
            border.width    : 1
            border.color    : backgroundBorderColor
            Rectangle {
                id              : checkRectangle
                anchors.fill    : parent
                anchors.margins : base.radius > 0 ? 0.8*base.radius : 0.2*width
                radius          : 0.8*base.radius
                Behavior on color { ColorAnimation { duration : 100 } }
            }
        }

    }

    Image {
        id          : backgroundImg
        anchors.fill: parent
        source      : __currentImage ? __currentImage.source : ""
        smooth      : true
    }

    states: [
        State {
            name: "default"
            when: !checked
            PropertyChanges { target: root; __currentImage: imageWhenDefault }
            PropertyChanges { target: checkRectangle; color: colorWhenDefault }
        },
        State {
            name: "checked"
            when: checked
            PropertyChanges { target: root; __currentImage: imageWhenChecked }
            PropertyChanges { target: checkRectangle; color: colorWhenChecked }
        }

    ]

    Component.onCompleted: {
        if(imageWhenDefault === null)
        {
            backgroundImg.destroy()
        }
    }
}
