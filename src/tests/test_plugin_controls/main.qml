import QtQuick 2.2
import QtQuick.Window 2.1

import com.armax.controls 1.0

Window {
    visible : true
    width   : 360
    height  : 360
    color   : style.backgroundColor

    Style { id: style }

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
                font.pointSize      : 14
                verticalAlignment   : Text.AlignVCenter
            }
            CheckBox {
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
                font.pointSize      : 14
                verticalAlignment   : Text.AlignVCenter
            }
            Button {
                checkable               : false
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
                font.pointSize      : 14
                verticalAlignment   : Text.AlignVCenter
            }
            Button {
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
                text                : "RadioButton :"
                font.pointSize      : 14
                verticalAlignment   : Text.AlignVCenter
            }
            RadioButton {
                Component.onCompleted   : __labelsWidth = Math.max(__labelsWidth, width)
            }
        }
    }
}
