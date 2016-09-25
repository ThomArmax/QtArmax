unix:VERSION = 0.1

QML_IMPORT_PATH = $$absolute_path(../imports)

DEFINES += LOCAL_QML_IMPORT_PATH="\\\"$${QML_IMPORT_PATH}\\\""

CONFIG(release, debug|release): OUT_PWD = $$PWD/build/release
else: OUT_PWD = $$PWD/build/debug

OBJECTS_DIR = $$OUT_PWD/obj
MOC_DIR = $$OUT_PWD/moc
RCC_DIR = $$OUT_PWD/qrc
UI_DIR = $$OUT_PWD/ui

LIB_DIR = /usr/lib/
INC_DIR = /usr/include/QtArmax
LOCAL_LIB_DEST_DIR = $$absolute_path($$PWD/../usr/lib/QtArmax)

INCLUDEPATH+= $$PWD/

contains(CONFIG, INSTALL_IN_QT) {
    LIB_DIR = $$[QT_INSTALL_LIBS]/QtArmax
    INC_DIR = $$[QT_INSTALL_HEADERS]/QtArmax
}

isEmpty(QML_PLUGINS_PREFIX) {
    QML_PLUGINS_PREFIX = $$[QT_INSTALL_QML]
}

# Copies the given files to the destination directory
defineTest(copyToDestdir) {
    files = $$1

    for(FILE, files) {
        DDIR = $$DESTDIR

        # Replace slashes in paths with backslashes for Windows
        win32:FILE ~= s,/,\\,g
        win32:DDIR ~= s,/,\\,g

        QMAKE_POST_LINK += $$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t)
    }

    export(QMAKE_POST_LINK)
}
