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
import QtQuick.Controls 1.0

import com.armax.controls 1.0
import com.armax.styles 1.0

Item {
    id      : root
    width   : 280
    height  : 280
    property int __controlsWidth

    ExclusiveGroup {
        id: exGp
    }
    property XStyle style : XDarkBlueStyle {}
    property int labelsWidth: 0

    Column {
        id              : vLayout
        width           : implicitWidth
        anchors.centerIn: parent
        spacing         : 10

        XCheckBox {
            style                   : mainStyle
            label.text              : "A checkbox :"
            label.width             : labelsWidth
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XCheckBox {
            style                   : mainStyle
            label.text              : "Another checkbox :"
            label.width             : labelsWidth
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XCheckBox {
            style                   : mainStyle
            label.text              : "Disabled checkbox :"
            label.width             : labelsWidth
            enabled                 : false
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XCheckBox {
            style                   : mainStyle
            label.text              : "Disabled checked checkbox :"
            label.width             : labelsWidth
            enabled                 : false
            checked                 : true
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }

//        Rectangle {
//            width   : 0.75*root.width
//            height  : 1
//            color   : style.colorWhenChecked
//        }

        XRadioButton {
            style                   : mainStyle
            label.text              : "Choice 1 :"
            exclusiveGroup          : exGp
            label.width             : labelsWidth
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XRadioButton {
            style                   : mainStyle
            label.text              : "Choice 2 :"
            exclusiveGroup          : exGp
            label.width             : labelsWidth
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XRadioButton {
            style                   : mainStyle
            label.text              : "Choice 3 :"
            exclusiveGroup          : exGp
            label.width             : labelsWidth
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XRadioButton {
            style                   : mainStyle
            label.text              : "Disabled radio button :"
            label.width             : labelsWidth
            enabled                 : false
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
        XRadioButton {
            style                   : mainStyle
            label.text              : "Disabled radio button checked :"
            label.width             : labelsWidth
            checked                 : true
            enabled                 : false
            Component.onCompleted   : labelsWidth = Math.max(label.paintedWidth, labelsWidth)
        }
    }
}

