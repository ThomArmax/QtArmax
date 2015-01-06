#-------------------------------------------------
#
# Project created by QtCreator 2013-11-08T06:45:57
#
#-------------------------------------------------
include(common.pri)


message(Qml plugins will be installed in $$QML_PLUGINS_PREFIX . You can customize with QML_PLUGINS_PREFIX variable)

CONFIG += ordered no_make_tests

TEMPLATE = subdirs
SUBDIRS  += \
        core    \
        plugins

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
