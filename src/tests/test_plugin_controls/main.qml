import QtQuick 2.2
import QtQuick.Window 2.1

import com.armax.controls 1.0 as Armax

Window {
    visible : true
    width   : 360
    height  : 360
    color   : style.backgroundColor

    Armax.Style { id: style }

    property real __labelsWidth : 30

    Column {
        id              : verticalLayout
        anchors.fill    : parent
        anchors.margins : 10
        spacing         : 10

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "CheckBox :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.CheckBox {
                Component.onCompleted: __labelsWidth = Math.max(__labelsWidth, width)
            }
        }

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.Button {
                hoverEnabled            : false
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "Button Hoverable :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.Button {
                hoverEnabled            : true
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "Checkable Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.Button {
                checkable               : true
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "Disabled Button :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.Button {
                checkable               : true
                enabled                 : false
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }

        Row {
            width   : parent.width
            height  : implicitHeight
            spacing : 10
            Text {
                width               : parent.width - __labelsWidth - parent.spacing
                height              : parent.height
                text                : "RadioButton :"
                font.pointSize      : style.defaultFontSize
                color               : style.textColor
                verticalAlignment   : Text.AlignVCenter
            }
            Armax.RadioButton {
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }
    }
}
