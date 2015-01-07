import QtQuick 2.0

Item {
    SystemPalette { id: systemPalette }

    property color      backgroundColor         : "#253344"

    property color      textColor               : "white"
    property int        defaultFontSize         : 12

    property color      colorWhenDefault        : "#6A92C3"
    property color      colorWhenPressed        : "#719CD0"
    property color      colorWhenHovered        : "#5C7FAA"
    property color      colorWhenChecked        : "#425c99"
    property color      colorWhenDisabled       : "#7C7C7C"

    property int        borderWidth             : 1
    property color      borderColorWhenDefault  : "#222222"
    property color      borderColorWhenPressed  : "#222222"
    property color      borderColorWhenHovered  : "#222222"
    property color      borderColorWhenChecked  : "#222222"
    property color      borderColorWhenDisabled : "#222222"

    property int        radius                  : 5

    property Gradient   gradientWhenDefault     : Gradient { GradientStop { position: 0.0; color: colorWhenDefault } GradientStop { position: 1.0; color: colorWhenChecked } }
    property Gradient   gradientWhenPressed     : Gradient { GradientStop { position: 0.0; color: colorWhenPressed } GradientStop { position: 1.0; color: colorWhenDefault } }
    property Gradient   gradientWhenHovered     : Gradient { GradientStop { position: 0.0; color: colorWhenHovered } GradientStop { position: 1.0; color: colorWhenDefault } }
    property Gradient   gradientWhenChecked     : Gradient { GradientStop { position: 0.0; color: colorWhenChecked } GradientStop { position: 1.0; color: "#253343" } }
    property Gradient   gradientWhenDisabled    : Gradient { GradientStop { position: 0.0; color: colorWhenDisabled } GradientStop { position: 1.0; color: "#3C3C3C" } }

    property real       controlAnimationDuration: 100
}
