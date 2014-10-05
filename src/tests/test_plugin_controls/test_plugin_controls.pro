TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

DESTDIR = ../../tests

# Default rules for deployment.
include(deployment.pri)
include(../../common.pri)
