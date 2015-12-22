unix:VERSION = 1.0

QML_IMPORT_PATH = $$absolute_path(../imports)

DEFINES += LOCAL_QML_IMPORT_PATH="\\\"$${QML_IMPORT_PATH}\\\""

CONFIG(release, debug|release): OUT_PWD = $$PWD/build/release
else: OUT_PWD = $$PWD/build/debug

OBJECTS_DIR = $$OUT_PWD/obj
MOC_DIR = $$OUT_PWD/moc
RCC_DIR = $$OUT_PWD/qrc
UI_DIR = $$OUT_PWD/ui

LIB_DIR = /usr/lib/
INC_DIR = /usr/include/QtArmax-$$VERSION
LOCAL_LIB_DEST_DIR = $$absolute_path($$PWD/../usr/lib/QtArmax)

INCLUDEPATH+= $$PWD/

contains(CONFIG, INSTALL_IN_QT) {
    LIB_DIR = $$[QT_INSTALL_LIBS]/QtArmax-$$VERSION
    INC_DIR = $$[QT_INSTALL_HEADERS]/QtArmax-$$VERSION
}

isEmpty(QML_PLUGINS_PREFIX) {
    QML_PLUGINS_PREFIX = $$[QT_INSTALL_QML]
}
