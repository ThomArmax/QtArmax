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

XStyle {
    backgroundColor                 : "#253344"

    textColor                       : "white"
    defaultFontSize                 : 12

    defaultControlsHeight           : 30

    colorWhenDefault                : "#6A92C3"
    colorWhenPressed                : "#719CD0"
    colorWhenHovered                : "#5C7FAA"
    colorWhenChecked                : "#425c99"
    colorWhenDisabled               : "#7C7C7C"

    handleColorWhenDefault          : "#F2F2F2"
    handleColorWhenPressed          : "#E5E5E5"
    handleColorWhenHovered          : "#CBCBCB"
    handleColorWhenChecked          : "#A5A5A5"
    handleColorWhenDisabled         : "#656565"

    borderWidth                     : 1
    borderColorWhenDefault          : "#263659"
    borderColorWhenPressed          : "#263659"
    borderColorWhenHovered          : "#263659"
    borderColorWhenChecked          : "#263659"
    borderColorWhenDisabled         : "#3C3C3C"

    radius                          : 3

    gradientWhenDefault             : Gradient { GradientStop { position: 0.0; color: colorWhenDefault } GradientStop { position: 1.0; color: colorWhenChecked } }
    gradientWhenPressed             : Gradient { GradientStop { position: 0.0; color: colorWhenPressed } GradientStop { position: 1.0; color: colorWhenDefault } }
    gradientWhenHovered             : Gradient { GradientStop { position: 0.0; color: colorWhenHovered } GradientStop { position: 1.0; color: colorWhenDefault } }
    gradientWhenChecked             : Gradient { GradientStop { position: 0.0; color: colorWhenChecked } GradientStop { position: 1.0; color: "#253343" } }
    gradientWhenDisabled            : Gradient { GradientStop { position: 0.0; color: colorWhenDisabled } GradientStop { position: 1.0; color: "#3C3C3C" } }

    handleGradientWhenDefault       : Gradient { GradientStop { position: 0.0; color: handleColorWhenDefault } GradientStop { position: 1.0; color: handleColorWhenChecked } }
    handleGradientWhenPressed       : Gradient { GradientStop { position: 0.0; color: handleColorWhenPressed } GradientStop { position: 1.0; color: handleColorWhenDefault } }
    handleGradientWhenHovered       : Gradient { GradientStop { position: 0.0; color: handleColorWhenHovered } GradientStop { position: 1.0; color: handleColorWhenDefault } }
    handleGradientWhenChecked       : Gradient { GradientStop { position: 0.0; color: handleColorWhenChecked } GradientStop { position: 1.0; color: Qt.darker(handleColorWhenChecked) } }
    handleGradientWhenDisabled      : Gradient { GradientStop { position: 0.0; color: handleColorWhenDisabled } GradientStop { position: 1.0; color: Qt.darker(handleColorWhenDisabled) } }

    controlAnimationDuration        : 100
}
