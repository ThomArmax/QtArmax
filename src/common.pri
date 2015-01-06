VERSION = 0.1

QML_IMPORT_PATH = $$absolute_path(../imports)

OUT_PWD = $$PWD/build
OBJECTS_DIR = $$PWD/build/obj
MOC_DIR = $$PWD/build/moc
RCC_DIR = $$PWD/build/qrc
UI_DIR = $$PWD/build/ui

isEmpty(QML_PLUGINS_PREFIX) {
    QML_PLUGINS_PREFIX = $$[QT_INSTALL_QML]
}

