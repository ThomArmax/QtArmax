TEMPLATE = lib
TARGET = QtArmaxDatamodelsPlugin
QT += qml quick
CONFIG += qt plugin

include(../../../../core/core.pri)

TARGETPATH = ../../../imports
uri = com.armax.datamodels

# Input
SOURCES += \
    datamodels_plugin.cpp

HEADERS += \
    datamodels_plugin.h

OTHER_FILES = \
    qmldir

include(../../../plugins.pri)

qmldir.files = qmldir
