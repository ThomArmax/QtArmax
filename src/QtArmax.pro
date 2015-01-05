#-------------------------------------------------
#
# Project created by QtCreator 2013-11-08T06:45:57
#
#-------------------------------------------------

CONFIG += ordered no_make_tests

TEMPLATE = subdirs
SUBDIRS  += \
        core    \
        plugins

message("QML Plugins will be installed in $$[QT_INSTALL_QML]")

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
