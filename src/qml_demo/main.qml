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
import com.armax.styles 1.0

Window {
    visible : true
    width   : 480
    height  : 480

    property XStyle mainStyle : darkBlueStyle

    XDarkRedStyle       { id: darkRedStyle }
    XDarkBlueStyle      { id: darkBlueStyle }
    XFlatDarkBlueStyle  { id: flatDarkBlueStyle }

    Column {
        id          : vLayout
        anchors.fill: parent
        spacing     : 10
        TabView {
            id      : tabView
            width   : parent.width
            height  : parent.height - styleChooserLayout.height - parent.spacing
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
                    style           : mainStyle
                }
                frame: Rectangle {
                    color: mainStyle.backgroundColor
                }
            }
        } // END TabView
        Rectangle {
            id      : styleChooserLayout
            color   : mainStyle.backgroundColor
            width   : parent.width
            height  : 75
            Column {
                anchors.fill    : parent
                anchors.margins : 10
                spacing         : 5
                Text {
                    text            : "Choose a style"
                    color           : mainStyle.fontColor
                    font.pointSize  : mainStyle.defaultFontSize
                }
                Row {
                    width   : parent.width
                    spacing : 20
                    XExclusiveGroup { id: styleExGp }
                    XButton { exclusiveGroup: styleExGp; style: darkBlueStyle; text: "DarkBlue"; checkable: true; onCheckedChanged: if(checked) mainStyle = darkBlueStyle; checked: true }
                    XButton { exclusiveGroup: styleExGp; style: darkRedStyle;  text: "DarkRed";  checkable: true; onCheckedChanged: if(checked) mainStyle = darkRedStyle }
                    XButton { exclusiveGroup: styleExGp; style: flatDarkBlueStyle;  text: "FlatDarkBlue";  checkable: true; onCheckedChanged: if(checked) mainStyle = flatDarkBlueStyle }
                }
            }
        }
    } // END Column
}
