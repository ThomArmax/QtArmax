TEMPLATE = lib
TARGET = QtArmaxDatamodelsPlugin
QT += qml quick
CONFIG += qt plugin

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
include(../../../../core/core.pri)

#!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
#    copy_qmldir.target = $$OUT_PWD/qmldir
#    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
#    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
#    QMAKE_EXTRA_TARGETS += copy_qmldir
#    PRE_TARGETDEPS += $$copy_qmldir.target
#}

qmldir.files = qmldir

#installPath = $$DESTDIR
#qmldir.path = $$installPath
#target.path = $$installPath
#INSTALLS += target qmldir

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

