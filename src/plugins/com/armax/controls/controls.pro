TEMPLATE = lib
TARGET = QtArmaxControlsPlugin
QT += qml quick
CONFIG += qt plugin

TARGETPATH = ../../../imports
uri = com.armax.controls

# Input
SOURCES += \
    controls_plugin.cpp \
    checkable.cpp

HEADERS += \
    controls_plugin.h \
    checkable.h

OTHER_FILES = \
    qmldir \
    CheckBox.qml \
    Style.qml \
    Button.qml \
    RadioButton.qml

# QML files to be included in resources file
QML_FILES = \
    Style.qml \
    CheckBox.qml \
    RadioButton.qml \
    Button.qml

# Graphics files to be included in resources file
GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

include(../../../plugins.pri)

RESOURCES += $$GENERATED_RESOURCE_FILE

qmldir.files = qmldir
