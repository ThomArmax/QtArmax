import QtQuick 2.0
import QtQuick.Controls 1.0

import com.armax.controls.private 1.0

/*!
   \qmltype XCheckable
   \inqmlmodule com.armax.controls 1.0
   \ingroup qmlmodules
   \brief Base item to create checkable components.
 */
XCheckablePrivate {
    id: root

    // public properties
    /*! This property stores the ExclusiveGroup that the control belongs to.*/
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
