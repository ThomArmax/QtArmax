TEMPLATE = lib
TARGET = QtArmaxPlugin
QT += qml quick
CONFIG += qt plugin

TARGETPATH = ../../imports
uri = com.armax

# Input
SOURCES += \
    armax_plugin.cpp \
    xpolygon.cpp \
    xregularpolygon.cpp

HEADERS += \
    armax_plugin.h \
    xpolygon.h \
    xregularpolygon.h

OTHER_FILES = \
    qmldir \
    QtArmaxPlugin.qmltypes

include(../../plugins.pri)

qmldir.files = qmldir
