TEMPLATE = app

QT += qml quick

TARGET  = test_plugin_controls

SOURCES += main.cpp

RESOURCES += qml.qrc

DESTDIR = $$absolute_path(../../../tests)

# Default rules for deployment.
include(deployment.pri)
include(../../common.pri)
