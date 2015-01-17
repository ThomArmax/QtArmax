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
   \qmltype XStyle
   \inqmlmodule com.armax.styles
   \ingroup styles
   \brief Base style sheet used in QtArmax.

   The XStyle is used over all com.armax plugins, to stylish the QML component.
   So each compoment has a style property.
   To customize the components, you can create your own stylesheet based on XStyle.
 */

QtObject {
    /*! The color used as background. */
    property color      backgroundColor
    /*! The default font color. */
    property color      fontColor
    /*! The font color used when the component is disabled. */
    property color      fontColorWhenDisabled
    /*! The font color used for controls (XButton, ...). */
    property color      controlsFontColor
    /*! The default font size. */
    property int        defaultFontSize
    /*! The default height used for controls (XButton, XSlider, ...). */
    property int        defaultControlsHeight

    /*! This is the base color defining the color of an element when it is in the default state. */
    property color      colorWhenDefault
    /*! This is the color defining the color of an element when it is in the 'pressed' state. */
    property color      colorWhenPressed
    /*! This is the color defining the color of an element when it is in the 'hovered' state. */
    property color      colorWhenHovered
    /*! This is the color defining the color of an element when it is in the 'checked' state. */
    property color      colorWhenChecked
    /*! This is the color defining the color of an element when it is in the 'disabled' state. */
    property color      colorWhenDisabled

    /*! This is the base color defining the color of an handle when it is in the default state. */
    property color      handleColorWhenDefault
    /*! This is the color defining the color of an handle when it is in the 'pressed' state. */
    property color      handleColorWhenPressed
    /*! This is the color defining the color of an handle when it is in the 'hovered' state. */
    property color      handleColorWhenHovered
    /*! This is the color defining the color of an handle when it is in the 'checked' state. */
    property color      handleColorWhenChecked
    /*! This is the color defining the color of an handle when it is in the 'disabled' state. */
    property color      handleColorWhenDisabled

    /*! This property defines the borders width. */
    property int        borderWidth
    /*! This property defines the borders color when the component is in the default state. */
    property color      borderColorWhenDefault
    /*! This property defines the borders color when the component is in the 'pressed' state. */
    property color      borderColorWhenPressed
    /*! This property defines the borders color when the component is in the 'hovered' state. */
    property color      borderColorWhenHovered
    /*! This property defines the borders color when the component is in the 'checked' state. */
    property color      borderColorWhenChecked
    /*! This property defines the borders color when the component is in the 'disabled' state. */
    property color      borderColorWhenDisabled

    /*! This property defines the borders color applied to the handle when the component is in the default state. */
    property color      handleBorderColorWhenDefault
    /*! This property defines the borders color applied to the handle when the component is in the 'pressed' state. */
    property color      handleBorderColorWhenPressed
    /*! This property defines the borders color applied to the handle when the component is in the 'hovered' state. */
    property color      handleBorderColorWhenHovered
    /*! This property defines the borders color applied to the handle when the component is in the 'checked' state. */
    property color      handleBorderColorWhenChecked
    /*! This property defines the borders color applied to the handle when the component is in the 'disabled' state. */
    property color      handleBorderColorWhenDisabled

    /*! This property defines the gradient to be applied to the component when it is in the 'default' state. */
    property Gradient   gradientWhenDefault
    /*! This property defines the gradient to be applied to the component when it is in the 'pressed' state. */
    property Gradient   gradientWhenPressed
    /*! This property defines the gradient to be applied to the component when it is in the 'hovered' state. */
    property Gradient   gradientWhenHovered
    /*! This property defines the gradient to be applied to the component when it is in the 'checked' state. */
    property Gradient   gradientWhenChecked
    /*! This property defines the gradient to be applied to the component when it is in the 'disabled' state. */
    property Gradient   gradientWhenDisabled

    /*! This property defines the gradient to be applied to the handle when the component is in the 'default' state. */
    property Gradient   handleGradientWhenDefault
    /*! This property defines the gradient to be applied to the handle when the component is in the 'pressed' state. */
    property Gradient   handleGradientWhenPressed
    /*! This property defines the gradient to be applied to the handle when the component is in the 'hovered' state. */
    property Gradient   handleGradientWhenHovered
    /*! This property defines the gradient to be applied to the handle when the component is in the 'checked' state. */
    property Gradient   handleGradientWhenChecked
    /*! This property defines the gradient to be applied to the handle when the component is in the 'disabled' state. */
    property Gradient   handleGradientWhenDisabled

    /*! This property defines radius to be applied to the components */
    property int        radius

    /*! This property defines the animation duration (when there is an animation) for controls component. */
    property real       controlAnimationDuration
}
