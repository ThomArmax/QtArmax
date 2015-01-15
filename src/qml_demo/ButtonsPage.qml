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
    property int __controlsWidth : 180
    Column {
        anchors.centerIn: parent
        spacing         : 20

        XButton {
            width   : __controlsWidth
            text    : "Simple Button"
        }

        XButton {
            width       : __controlsWidth
            text        : "Hoverable Button"
            hoverEnabled: true
        }

        XButton {
            width       : __controlsWidth
            text        : "Checkable Button"
            checkable   : true
        }

        XButton {
            width   : __controlsWidth
            text    : "Disabled Button"
            enabled : false
        }

        Row {
            width   : __controlsWidth
            height  : 30
            Item {
                width   : parent.width/2
                height  : toggle1.height
                XToggleSwitch {
                    id          : toggle1
                    anchors.left: parent.left
                }
            }
            Item {
                width   : parent.width/2
                height  : toggle2.height
                XToggleSwitch {
                    enabled         : false
                    id              : toggle2
                    anchors.right   : parent.right
                }
            }
        }
    }
}

