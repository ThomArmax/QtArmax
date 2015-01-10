import QtQuick 2.0
import QtQuick.Controls 1.0

import com.armax.controls.private 1.0

XCheckablePrivate {
    id: root

    // public properties
    property ExclusiveGroup exclusiveGroup: null

    // slots
    onClicked : {
        if(exclusiveGroup) {
            if(checkable) checked = true
            toggled(true)
        }
    }
    onExclusiveGroupChanged: {
        if (exclusiveGroup)
            exclusiveGroup.bindCheckable(root)
    }
}
