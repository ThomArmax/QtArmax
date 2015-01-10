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

import QtQuick 2.2
import QtQuick.Window 2.1

import com.armax.controls 1.0

Window {
    visible : true
    width   : 360
    height  : 360
    color   : style.backgroundColor

    XStyle { id: style }

    property real __controlsWidth : 30

    Column {
        id                  : verticalLayout
        anchors.fill        : parent
        anchors.margins     : 10
        spacing             : 10

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "CheckBox :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XCheckBox {
                    anchors.right           : parent.right
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XButton {
                    anchors.right           : parent.right
                    hoverEnabled            : false
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Button Hoverable :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XButton {
                    anchors.right           : parent.right
                    hoverEnabled            : true
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Checkable Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XButton {
                    anchors.right           : parent.right
                    checkable               : true
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Disabled Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XButton {
                    anchors.right           : parent.right
                    checkable               : true
                    enabled                 : false
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "RadioButton :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XRadioButton {
                    anchors.right           : parent.right
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Slider :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XSlider {
                    width                   : 150
                    anchors.right           : parent.right
                    value                   : 25
                    minValue                : 0
                    maxValue                : 100
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                }
            }
        }

        Row {
            width   : parent.width
            height  : 35
            spacing : 10
            Text {
                width               : parent.width - __controlsWidth - parent.spacing
                height              : parent.height
                text                : "Progress bar :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Item {
                width   : __controlsWidth
                height  : parent.height
                XProgressBar {
                    id                      : progress
                    width                   : 150
                    anchors.right           : parent.right
                    Component.onCompleted   : __controlsWidth = Math.max(__controlsWidth, width)
                    Timer {
                        interval    : 75
                        running     : true
                        repeat      : true
                        onTriggered : {
                            if(progress.progress <100) {
                                progress.progress += 1
                            }
                            else {
                                progress.progress = 0
                            }
                        }
                    }
                }
            }
        }

    }
}
