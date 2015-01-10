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
    }
}
