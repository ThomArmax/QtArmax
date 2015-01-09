VERSION = 1.0

QML_IMPORT_PATH = $$absolute_path(../imports)

DEFINES += LOCAL_QML_IMPORT_PATH="\\\"$${QML_IMPORT_PATH}\\\""

OUT_PWD = $$PWD/build
OBJECTS_DIR = $$PWD/build/obj
MOC_DIR = $$PWD/build/moc
RCC_DIR = $$PWD/build/qrc
UI_DIR = $$PWD/build/ui

LIB_DIR = /usr/lib/QtArmax-$$VERSION
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
