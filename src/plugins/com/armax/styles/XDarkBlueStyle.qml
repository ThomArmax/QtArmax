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
    backgroundColor         : "#253344"

    textColor               : "white"
    defaultFontSize         : 12

    defaultControlsHeight   : 30

    colorWhenDefault        : "#6A92C3"
    colorWhenPressed        : "#719CD0"
    colorWhenHovered        : "#5C7FAA"
    colorWhenChecked        : "#425c99"
    colorWhenDisabled       : "#7C7C7C"

    borderWidth             : 1
    borderColorWhenDefault  : "#222222"
    borderColorWhenPressed  : "#222222"
    borderColorWhenHovered  : "#222222"
    borderColorWhenChecked  : "#222222"
    borderColorWhenDisabled : "#222222"

    radius                  : 3

    gradientWhenDefault     : Gradient { GradientStop { position: 0.0; color: colorWhenDefault } GradientStop { position: 1.0; color: colorWhenChecked } }
    gradientWhenPressed     : Gradient { GradientStop { position: 0.0; color: colorWhenPressed } GradientStop { position: 1.0; color: colorWhenDefault } }
    gradientWhenHovered     : Gradient { GradientStop { position: 0.0; color: colorWhenHovered } GradientStop { position: 1.0; color: colorWhenDefault } }
    gradientWhenChecked     : Gradient { GradientStop { position: 0.0; color: colorWhenChecked } GradientStop { position: 1.0; color: "#253343" } }
    gradientWhenDisabled    : Gradient { GradientStop { position: 0.0; color: colorWhenDisabled } GradientStop { position: 1.0; color: "#3C3C3C" } }

    controlAnimationDuration: 100
}
