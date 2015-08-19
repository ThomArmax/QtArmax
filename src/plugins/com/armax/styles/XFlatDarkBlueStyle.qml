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
   \qmltype XDarkBlueStyle
   \inqmlmodule com.armax.styles
   \ingroup styles
   \brief Dark blue style sheet
 */
XStyle {
    useGradients                    : true
    backgroundColor                 : "#2C3E50"

    fontColor                       : "white"
    fontColorWhenDisabled           : "#22313F"
    controlsFontColor               : "#D6E9FF"
    defaultFontSize                 : 12

    defaultControlsHeight           : 30

    colorWhenDefault                : "#3498DB"
    colorWhenPressed                : "#22A7F0"
    colorWhenHovered                : "#3498DB"
    colorWhenChecked                : "#52B3D9"// "#425c99"
    colorWhenDisabled               : "#34495E"

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

    borderWidth                     : 0
    borderColorWhenDefault          : "#263659"
    borderColorWhenPressed          : "#263659"
    borderColorWhenHovered          : "#263659"
    borderColorWhenChecked          : "#263659"
    borderColorWhenDisabled         : "#3C3C3C"

    radius                          : 0

    gradientWhenDefault             : null
    gradientWhenPressed             : null
    gradientWhenHovered             : null
    gradientWhenChecked             : null
    gradientWhenDisabled            : null

    handleGradientWhenDefault       : null
    handleGradientWhenPressed       : null
    handleGradientWhenHovered       : null
    handleGradientWhenChecked       : null
    handleGradientWhenDisabled      : null

    controlAnimationDuration        : 100
}
