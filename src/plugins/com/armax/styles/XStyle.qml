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

QtObject {
    property color      backgroundColor

    property color      textColor
    property int        defaultFontSize

    property int        defaultControlsHeight

    property color      colorWhenDefault
    property color      colorWhenPressed
    property color      colorWhenHovered
    property color      colorWhenChecked
    property color      colorWhenDisabled

    property int        borderWidth
    property color      borderColorWhenDefault
    property color      borderColorWhenPressed
    property color      borderColorWhenHovered
    property color      borderColorWhenChecked
    property color      borderColorWhenDisabled

    property int        radius

    property Gradient   gradientWhenDefault
    property Gradient   gradientWhenPressed
    property Gradient   gradientWhenHovered
    property Gradient   gradientWhenChecked
    property Gradient   gradientWhenDisabled

    property real       controlAnimationDuration
}
