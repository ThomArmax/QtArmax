TEMPLATE = lib
TARGET = controls
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
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

GFX = \

INCLUDED_RESOURCE_FILES = $$QML_FILES $$GFX

include(../../../plugins.pri)

RESOURCES += $$GENERATED_RESOURCE_FILE

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir

installPath = $$DESTDIR
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}
