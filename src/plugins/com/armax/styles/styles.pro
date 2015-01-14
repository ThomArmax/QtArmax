TEMPLATE = lib
TARGET = QtArmaxStylesPlugin
QT += qml quick
CONFIG += qt plugin

TARGETPATH = ../../../imports
uri = com.armax.styles

# Input
SOURCES += \
    styles_plugin.cpp \

HEADERS += \
    styles_plugin.h \

OTHER_FILES = \
    qmldir \
    XStyle.qml \

# QML files to be included in resources file
QML_FILES = \
    XStyle.qml \

# Graphics files to be included in resources file
GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

include(../../../plugins.pri)

RESOURCES += $$GENERATED_RESOURCE_FILE

qmldir.files = qmldir


