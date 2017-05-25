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
    xregularpolygon.cpp \

HEADERS += \
    armax_plugin.h \
    xpolygon.h \
    xregularpolygon.h \

# QML files to be included in resources file
QML_FILES = \
    XPolygonMask.qml \

# Graphics files to be included in resources file
GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

OTHER_FILES = \
    qmldir \
    $$QML_FILES \
    QtArmaxPlugin.qmltypes

include(../../plugins.pri)

qmldir.files = qmldir

RESOURCES += $$GENERATED_RESOURCE_FILE

DISTFILES += \
    qml/XPolygonMask.qml
