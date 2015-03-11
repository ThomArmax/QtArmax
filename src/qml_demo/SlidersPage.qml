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

Item {
    width   : 280
    height  : 280
    property int __controlsWidth
    Column {
        anchors.centerIn: parent
        spacing         : 20

        XSlider {
            width   : 200
            value   : 50
            minValue: -50
            maxValue: 75
            style   : mainStyle
        }

        XSlider {
            width   : 200
            value   : 20
            style   : mainStyle
        }

        XSlider {
            width   : 200
            value   : 75
            enabled : false
            style   : mainStyle
        }
    }
}

