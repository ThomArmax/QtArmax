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
/*!
   \qmltype XDarkRedStyle
   \inqmlmodule com.armax.styles
   \ingroup styles
   \brief Dark red style sheet
 */
XStyle {
    useGradients                    : true
    backgroundColor                 : "#721215"

    fontColor                       : "white"
    fontColorWhenDisabled           : "#3C3C3C"
    controlsFontColor               : "#D6E9FF"
    defaultFontSize                 : 12

    defaultControlsHeight           : 30

    colorWhenDefault                : "#F2393E"
    colorWhenPressed                : "#CB2026"
    colorWhenHovered                : "#A51A1F"
    colorWhenChecked                : "#AE3A32"
    colorWhenDisabled               : "#7C7C7C"

    handleColorWhenDefault          : "#E6E6E6"
    handleColorWhenPressed          : "#E5E5E5"
    handleColorWhenHovered          : "#CBCBCB"
    handleColorWhenChecked          : "#A5A5A5"
    handleColorWhenDisabled         : "#656565"

    handleBorderColorWhenDefault    : "#4B4B4B"
    handleBorderColorWhenPressed    : "#4B4B4B"
    handleBorderColorWhenHovered    : "#4B4B4B"
    handleBorderColorWhenChecked    : "#4B4B4B"
    handleBorderColorWhenDisabled   : "#333333"

    borderWidth                     : 1
    borderColorWhenDefault          : "#59201C"
    borderColorWhenPressed          : "#59201C"
    borderColorWhenHovered          : "#59201C"
    borderColorWhenChecked          : "#59201C"
    borderColorWhenDisabled         : "#3C3C3C"

    radius                          : 3

    gradientWhenDefault             : Gradient {
        GradientStop { position: 0.00; color: colorWhenDefault }
        GradientStop { position: 0.49; color: Qt.darker(colorWhenDefault, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(colorWhenDefault, 1.05) }
        GradientStop { position: 1.00; color: colorWhenChecked }
    }
    gradientWhenPressed             : Gradient {
        GradientStop { position: 0.00; color: colorWhenPressed }
        GradientStop { position: 0.49; color: Qt.darker(colorWhenPressed, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(colorWhenPressed, 1.05) }
        GradientStop { position: 1.00; color: colorWhenDefault }
    }
    gradientWhenHovered             : Gradient {
        GradientStop { position: 0.00; color: colorWhenHovered }
        GradientStop { position: 0.49; color: Qt.darker(colorWhenHovered, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(colorWhenHovered, 1.05) }
        GradientStop { position: 1.00; color: colorWhenDefault }
    }
    gradientWhenChecked             : Gradient {
        GradientStop { position: 0.00; color: colorWhenChecked }
        GradientStop { position: 0.49; color: Qt.darker(colorWhenChecked, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(colorWhenChecked, 1.05) }
        GradientStop { position: 1.00; color: "#410804" }
    }
    gradientWhenDisabled            : Gradient {
        GradientStop { position: 0.00; color: colorWhenDisabled }
        GradientStop { position: 0.49; color: Qt.darker(colorWhenDisabled, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(colorWhenDisabled, 1.05) }
        GradientStop { position: 1.00; color: "#3C3C3C" }
    }

    handleGradientWhenDefault       : Gradient {
        GradientStop { position: 0.00; color: handleColorWhenDefault }
        GradientStop { position: 0.49; color: Qt.darker(handleColorWhenDefault, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(handleColorWhenDefault, 1.05) }
        GradientStop { position: 1.00; color: handleColorWhenChecked }
    }
    handleGradientWhenPressed       : Gradient {
        GradientStop { position: 0.00; color: handleColorWhenPressed }
        GradientStop { position: 0.49; color: Qt.darker(handleColorWhenPressed, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(handleColorWhenPressed, 1.05) }
        GradientStop { position: 1.00; color: handleColorWhenDefault }
    }
    handleGradientWhenHovered       : Gradient {
        GradientStop { position: 0.00; color: handleColorWhenHovered }
        GradientStop { position: 0.49; color: Qt.darker(handleColorWhenHovered, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(handleColorWhenHovered, 1.05) }
        GradientStop { position: 1.00; color: handleColorWhenDefault }
    }
    handleGradientWhenChecked       : Gradient {
        GradientStop { position: 0.00; color: handleColorWhenChecked }
        GradientStop { position: 0.49; color: Qt.darker(handleColorWhenChecked, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(handleColorWhenChecked, 1.05) }
        GradientStop { position: 1.00; color: Qt.darker(handleColorWhenChecked) }
    }
    handleGradientWhenDisabled      : Gradient {
        GradientStop { position: 0.00; color: handleColorWhenDisabled }
        GradientStop { position: 0.49; color: Qt.darker(handleColorWhenDisabled, 0.95) }
        GradientStop { position: 0.50; color: Qt.darker(handleColorWhenDisabled, 1.05) }
        GradientStop { position: 1.00; color: Qt.darker(handleColorWhenDisabled, 1.50) }
    }

    controlAnimationDuration        : 100
}
