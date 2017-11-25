/****************************************************************************
**
** Copyright (C) 2017 Thomas COIN
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
import com.armax 1.0

Item {
    id: root
    property XPolygon polygon : null

    ShaderEffect {
        property variant src: ShaderEffectSource {
            hideSource  : true
            recursive   : true
        }

        property variant mask: ShaderEffectSource {
            anchors.fill: parent
            sourceItem  : polygon
            hideSource  : true
            recursive   : true
        }

        id              : effect
        anchors.fill    : parent
        fragmentShader  : "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D src;
                uniform sampler2D mask;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec4 tex = texture2D(src, qt_TexCoord0);
                    lowp float texMask = texture2D(mask, qt_TexCoord0).a;
                    gl_FragColor = tex * qt_Opacity * texMask;
                }"
    }

    QtObject {
        id: d
        readonly property int __internalChildrenCount: 1
        function __applyMask() {
            for (var i=0; i<children.length; i++) {
                var child = children[i]
                console.debug(child)
                if (i>=__internalChildrenCount) {
                    //console.debug("Applying mask on", child)
                    effect.src.sourceItem = child
                }
            }
        }
    }

    onPolygonChanged: polygon.parent = root
    onChildrenChanged: d.__applyMask()
}
