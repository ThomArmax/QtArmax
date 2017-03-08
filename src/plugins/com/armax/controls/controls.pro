TEMPLATE = lib
TARGET = QtArmaxControlsPlugin
QT += qml quick
CONFIG += qt plugin

TARGETPATH = ../../../imports
uri = com.armax.controls

# Input
SOURCES += \
    controls_plugin.cpp \
    xcheckable.cpp \
    xexclusivegroup.cpp

HEADERS += \
    controls_plugin.h \
    xcheckable.h \
    xexclusivegroup.h

OTHER_FILES = \
    qmldir \
    XButton.qml \
    XRadioButton.qml \
    XCheckBox.qml \
    XSlider.qml \
    XProgressBar.qml \
    XCircularProgress.qml \
    XToggleSwitch.qml

# QML files to be included in resources file
QML_FILES = \
    XCheckBox.qml \
    XRadioButton.qml \
    XButton.qml \
    XSlider.qml \
    XProgressBar.qml \
    XCircularProgress.qml \
    XToggleSwitch.qml

# Graphics files to be included in resources file
GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

include(../../../plugins.pri)

RESOURCES += $$GENERATED_RESOURCE_FILE

qmldir.files = qmldir

