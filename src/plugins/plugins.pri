TEMPLATE = lib
CONFIG += qt plugin

include(../common.pri)

#win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release

#isEmpty(TARGETPATH) {
#    error("plugins.pri: You must provide a TARGETPATH!")
#}
isEmpty(TARGET) {
    error("plugins.pri: You must provide a TARGET!")
}
isEmpty(uri) {
    error("plugins.pri: You must provide an uri!")
}

URI_TO_PATH = $$replace(uri, \\., /)

DESTDIR = $$absolute_path(../../imports/$$URI_TO_PATH)

TARGETPATH = $$QML_IMPORT_PATH/$$URI_TO_PATH

# Create the resource file
!isEmpty(INCLUDED_RESOURCE_FILES) {
    GENERATED_RESOURCE_FILE = $$absolute_path($${OUT_PWD}/$${TARGET}.qrc)

    RESOURCE_CONTENT = \
        "<RCC>" \
        "<qresource prefix=\"/$$URI_TO_PATH\">"

    for(resourcefile, INCLUDED_RESOURCE_FILES) {
        resourcefileabsolutepath =  $$absolute_path($${_PRO_FILE_PWD_}/$$resourcefile)

        relativepath_in = $$relative_path($$resourcefileabsolutepath, $$_PRO_FILE_PWD_)
        relativepath_out = $$relative_path($$resourcefileabsolutepath, $$OUT_PWD)
        RESOURCE_CONTENT += "<file alias=\"$$relativepath_in\">$$relativepath_out</file>"

#        message("plugins.pri: generating qrc file for " $$resourcefile " ==> " $$resourcefileabsolutepath)
#        message("          relativepath_in ==> " $$relativepath_in)
#        message("          relativepath_out ==> " $$relativepath_out)
    }

    RESOURCE_CONTENT += \
        "</qresource>" \
        "</RCC>"

    write_file($$GENERATED_RESOURCE_FILE, RESOURCE_CONTENT)|error("Aborting.")
}
esle {
    warning("plugins.pri : To create a resource file, you must provide a INCLUDED_RESOURCE_FILES")
}

QMLDIRFILE = $$absolute_path($${_PRO_FILE_PWD_}/qmldir)

copy2build.input = QMLDIRFILE
copy2build.output = $$TARGETPATH/qmldir
!contains(TEMPLATE_PREFIX, vc):copy2build.variable_out = PRE_TARGETDEPS
copy2build.commands = $$QMAKE_COPY ${QMAKE_FILE_IN} ${QMAKE_FILE_OUT}
copy2build.name = COPY ${QMAKE_FILE_IN}
copy2build.CONFIG += no_link
# `clean' should leave the build in a runnable state, which means it shouldn't delete qmldir
copy2build.CONFIG += no_clean
QMAKE_EXTRA_COMPILERS += copy2build

#TARGET = $$qtLibraryTarget($$TARGET)
contains(QT_CONFIG, reduce_exports):CONFIG += hide_symbols

wince*:LIBS += $$QMAKE_LIBS_GUI

# Create qmltypes file
system(qmlplugindump $$uri 1.0 $$absolute_path($${_PRO_FILE_PWD_}) > $$absolute_path($${OUT_PWD}/$${TARGET}.qmltypes))

#message("plugins.pri: " $$TARGET ": DESTDIR = " $$DESTDIR)
#message("plugins.pri: " $$TARGET ": URI_TO_PATH = " $$URI_TO_PATH)
#message("plugins.pri: " $$TARGET ": QML_IMPORT_PATH = " $$QML_IMPORT_PATH)
#message("plugins.pri: " $$TARGET ": TARGETPATH = " $$TARGETPATH)
#message("plugins.pri: " $$TARGET ": QMLDIRFILE = " $$QMLDIRFILE)
#message("plugins.pri: " $$TARGET ": GENERATED_RESOURCE_FILE = " $$GENERATED_RESOURCE_FILE)
#message("plugins.pri: " $$TARGET ": copy2build.output = " $$copy2build.output)
