import QtQuick 2.0
import com.armax.controls 1.0

Checkable {

    // public properties
    property Style  style                   : Style {}
    property color  colorWhenDefault        : style.colorWhenDefault
    property color  colorWhenChecked        : style.colorWhenChecked
    property alias  radius                  : base.radius
    property real   opactityWhenDisabled    : 0.4
    property color  backgroundColor         : style.colorWhenDefault
    property color  backgroundBorderColor   : Qt.darker(backgroundColor)

    property Image imageWhenDefault         : null
    property Image imageWhenChecked         : imageWhenDefault

    // private properties
    property Image __currentImage           : imageWhenDefault

    id      : root
    width   : 35
    height  : 35
    opacity : enabled ? 1.0 : opactityWhenDisabled

    Rectangle {
        id              : base
        anchors.fill    : parent
        radius          : 5
        color           : backgroundColor
        border.width    : 1
        border.color    : backgroundBorderColor
        Rectangle {
            id              : checkRectangle
            anchors.fill    : parent
            anchors.margins : base.radius > 0 ? 0.8*base.radius : 0.2*width
            radius          : 0.8*base.radius
            Behavior on color { ColorAnimation { duration : 300 } }
        }
    }

    Image {
        id          : backgroundImg
        anchors.fill: parent
        source      : __currentImage ? __currentImage.source : ""
        smooth      : true
    }

    states: [
        State {
            name: "default"
            when: !checked
            PropertyChanges { target: root; __currentImage: imageWhenDefault }
            PropertyChanges { target: checkRectangle; color: colorWhenDefault }
        },
        State {
            name: "checked"
            when: checked
            PropertyChanges { target: root; __currentImage: imageWhenChecked }
            PropertyChanges { target: checkRectangle; color: colorWhenChecked }
        }

    ]

    Component.onCompleted: {
        if(imageWhenDefault === null)
        {
            backgroundImg.destroy()
        }
    }
}
