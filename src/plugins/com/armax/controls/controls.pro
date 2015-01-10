TEMPLATE = lib
TARGET = QtArmaxControlsPlugin
QT += qml quick
CONFIG += qt plugin

TARGETPATH = ../../../imports
uri = com.armax.controls

# Input
SOURCES += \
    controls_plugin.cpp \
    xcheckable_p.cpp

HEADERS += \
    controls_plugin.h \
    xcheckable_p.h

OTHER_FILES = \
    qmldir \
    XButton.qml \
    XStyle.qml \
    XRadioButton.qml \
    XCheckBox.qml \
    XSlider.qml \
    XProgressBar.qml \
    XCheckable.qml

# QML files to be included in resources file
QML_FILES = \
    XStyle.qml \
    XCheckBox.qml \
    XRadioButton.qml \
    XButton.qml \
    XSlider.qml \
    XProgressBar.qml \
    XCheckable.qml

# Graphics files to be included in resources file
GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

include(../../../plugins.pri)

RESOURCES += $$GENERATED_RESOURCE_FILE

qmldir.files = qmldir


