include(../../common.pri)

TEMPLATE = app

QT += qml quick

TARGET  = test_plugin_controls

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += main.qml

DESTDIR = $$absolute_path(../../../tests)

# Default rules for deployment.
#include(deployment.pri)
