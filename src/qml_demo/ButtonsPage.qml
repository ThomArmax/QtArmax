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

Item {
    width   : 280
    height  : 280
    property int __controlsWidth : 180

    property int __labelsWidth: 0

    Item {
        id      : buttonContainer
        width   : parent.width - __labelsWidth - 50
        height  : parent.height
        x       : __labelsWidth + 50
        XButton {
            id                      : button
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top             : parent.top
            anchors.topMargin       : vLayout.anchors.margins
            style                   : mainStyle
            text                    : "Button"
        }
    }

    Column {
        id              : vLayout
        anchors.fill    : parent
        anchors.margins : 20
        spacing         : 20
        Column {
            id      : buttonsParametersLayout
            width   : implicitWidth
            height  : implicitHeight
            spacing : 10
            XCheckBox {
                style                   : mainStyle
                label.text              : "Enable hovered"
                checked                 : button.hoverEnabled
                onCheckedChanged        : button.hoverEnabled = checked
                label.width             : __labelsWidth
                Component.onCompleted   : __labelsWidth = Math.max(label.paintedWidth, __labelsWidth)
            }
            XCheckBox {
                style                   : mainStyle
                label.text              : "Enabled"
                checked                 : button.enabled
                onCheckedChanged        : button.enabled = checked
                label.width             : __labelsWidth
                Component.onCompleted   : __labelsWidth = Math.max(label.paintedWidth, __labelsWidth)
            }
            XCheckBox {
                style                   : mainStyle
                label.text              : "Checkable"
                onCheckedChanged        : button.checkable = checked
                label.width             : __labelsWidth
                Component.onCompleted   : __labelsWidth = Math.max(label.paintedWidth, __labelsWidth)
            }
            XCheckBox {
                style                   : mainStyle
                enabled                 : false
                label.text              : "Checked"
                checked                 : button.checked
                label.width             : __labelsWidth
                Component.onCompleted   : __labelsWidth = Math.max(label.paintedWidth, __labelsWidth)
            }
            XCheckBox {
                style                   : mainStyle
                id                      : showIconCheckBox
                label.text              : "Show Icon"
                onCheckedChanged        : checked ? button.icon = "qrc:/folder-grey-open-icon.png" : button.icon = ""
                label.width             : __labelsWidth
                Component.onCompleted   : __labelsWidth = Math.max(label.paintedWidth, __labelsWidth)
            }
            Row {
                spacing: 10
                Text {
                    text                    : "Button's layout"
                    width                   : __labelsWidth
                    Component.onCompleted   : __labelsWidth = Math.max(paintedWidth, __labelsWidth)
                    font.pointSize          : mainStyle.defaultFontSize
                    color                   : mainStyle.fontColor
                    height                  : parent.implicitHeight
                    verticalAlignment       : Text.AlignVCenter
                }
                ExclusiveGroup { id: buttonLayoutExGp }
                XRadioButton {
                    style                   : mainStyle
                    exclusiveGroup  : buttonLayoutExGp
                    label.text      : "LeftToRight"
                    enabled         : button.icon !== showIconCheckBox.checked
                    checked         : button.layoutDirection === Qt.LeftToRight
                    onCheckedChanged: if(checked) button.layoutDirection = Qt.LeftToRight
                }
                XRadioButton {
                    style                   : mainStyle
                    exclusiveGroup  : buttonLayoutExGp
                    label.text      : "RightToLeft"
                    enabled         : button.icon !== showIconCheckBox.checked
                    checked         : button.layoutDirection === Qt.RightToLeft
                    onCheckedChanged: if(checked) button.layoutDirection = Qt.RightToLeft
                }
            }
        }

        Rectangle {
            width   : parent.width
            height  : 1
            color   : mainStyle.controlsFontColor
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
                    style       : mainStyle
                }
            }
            Item {
                width   : parent.width/2
                height  : toggle2.height
                XToggleSwitch {
                    id              : toggle2
                    style           : mainStyle
                    enabled         : false
                    anchors.right   : parent.right
                }
            }
        }
    }
}

