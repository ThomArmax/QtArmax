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

        XProgressBar {
            id      : progress1
            width   : 200
        }

        XProgressBar {
            id      : progress2
            width   : 200
        }

        XProgressBar {
            id      : progress3
            width   : 200
        }

        XCircularProgress {
            id      : progress4
            width   : 200
            height  : 200
        }
    }

    Timer {
        running     : true
        interval    : 500
        repeat      : true
        onTriggered : {
            if(progress1.progress < 100)
                progress1.progress += 20
            else
                progress1.progress = 0
        }
    }

    Timer {
        running     : true
        interval    : 75
        repeat      : true
        onTriggered : {
            if(progress2.progress < 100)
                progress2.progress += 1
            else
                progress2.progress = 0
        }
    }

    Timer {
        running     : true
        interval    : 200
        repeat      : true
        onTriggered : {
            if(progress3.progress < 100)
                progress3.progress += 1
            else
                progress3.progress = 0
        }
    }

    Timer {
        running     : true
        interval    : 100
        repeat      : true
        onTriggered : {
            if(progress4.progress < 100)
                progress4.progress += 1
            else
                progress4.progress = 0
        }
    }
}

