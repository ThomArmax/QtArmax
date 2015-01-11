#-------------------------------------------------
#
# Project created by QtCreator 2013-11-08T06:45:57
#
#-------------------------------------------------
include(common.pri)

message(Headers will be installed in $$INC_DIR)
message(Libs will be installed in $$LIB_DIR)
message(Qml plugins will be installed in $$QML_PLUGINS_PREFIX)

CONFIG += ordered make_tests

TEMPLATE = subdirs
SUBDIRS  += \
        core    \
        plugins \
        qml_demo

contains(CONFIG, make_tests) {
    message(Tests will be build)
    SUBDIRS += tests
}
else {
    message(Tests will not be build)
    SUBDIRS -= tests
}
OTHER_FILES += \
    common.pri

HEADERS += global.h

QMAKE_DISTCLEAN += $$PWD/../imports -r
QMAKE_DISTCLEAN += $$PWD/../usr -r
