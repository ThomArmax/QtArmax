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

import QtQuick 2.1
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.2

import com.armax.controls 1.0

Window {
    visible : true
    width   : 480
    height  : 480

    XStyle {
        id: style
    }

    TabView {
        id          : tabView
        anchors.fill: parent
        Tab {
            title: "Buttons"
            ButtonsPage {
                anchors.fill        : parent
                anchors.topMargin   : 20
            }
        }
        Tab {
            title: "Progress"
            ProgressPage {
                anchors.fill        : parent
                anchors.topMargin   : 20
            }
        }
        Tab {
            title: "Sliders"
            SlidersPage {
                anchors.fill        : parent
                anchors.topMargin   : 20
            }
        }
        Tab {
            title: "Checkables"
            CheckablesPage {
                anchors.fill        : parent
                anchors.topMargin   : 20
            }
        }

        style: TabViewStyle {
            tab: XButton {
                radius          : 0
                implicitWidth   : width
                implicitHeight  : height
                width           : tabView.width/tabView.count
                text            : styleData.title
                enabled         : false
                checkable       : true
                checked         : styleData.selected
            }
            frame: Rectangle {
                gradient: style.gradientWhenDisabled
                //color: style.backgroundColor
                //color: "#677593"
            }
        }
    }
}
