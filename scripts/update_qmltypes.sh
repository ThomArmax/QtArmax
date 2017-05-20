#!/bin/sh
export LD_LIBRARY_PATH=${PWD}/usr/lib/QtArmax/

echo "-- Generating qmltypes for com.armax 1.0"
qmlplugindump -nonrelocatable -defaultplatform com.armax 1.0 imports > src/plugins/com/armax/QtArmaxPlugin.qmltypes

echo "-- Generating qmltypes for com.armax.controls 1.0"
qmlplugindump -nonrelocatable -defaultplatform com.armax.controls 1.0 imports > src/plugins/com/armax/controls/QtArmaxControlsPlugin.qmltypes

echo "-- Generating qmltypes for com.armax.styles 1.0"
qmlplugindump -nonrelocatable -defaultplatform com.armax.styles 1.0 imports > src/plugins/com/armax/styles/QtArmaxStylesPlugin.qmltypes

echo "-- Generating qmltypes for com.armax.datamodels 1.0"
qmlplugindump -nonrelocatable -defaultplatform com.armax.datamodels 1.0 imports > src/plugins/com/armax/datamodels/QtArmaxDatamodelsPlugin.qmltypes

unset LD_LIBRARY_PATH
echo "Done ..."

