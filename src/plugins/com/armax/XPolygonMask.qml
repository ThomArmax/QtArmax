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
                    console.debug("Applying mask on", child)
                    effect.src.sourceItem = child
                }
            }
        }
    }

    onPolygonChanged: polygon.parent = root
    onChildrenChanged: d.__applyMask()
}
