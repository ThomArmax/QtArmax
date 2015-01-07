TARGET = QtArmaxCore
TEMPLATE = lib

DEFINES += QT_ARMAX_CORE

include(../common.pri)

DESTDIR = $$LOCAL_LIB_DEST_DIR

DATA_MODELS_HEADERS = \
    datamodels/abstractlistitem.h \
    datamodels/abstractqueue.h \
    datamodels/fifo.h \
    datamodels/lifo.h \
    datamodels/listmodel.h

PUBLIC_HEADERS += \
    $$DATA_MODELS_HEADERS

HEADERS += \
    $$PUBLIC_HEADERS

SOURCES += \
    datamodels/abstractlistitem.cpp \
    datamodels/abstractqueue.cpp \
    datamodels/fifo.cpp \
    datamodels/lifo.cpp \
    datamodels/listmodel.cpp

OTHER_FILES += \
    core.pri

unix {
    target.path = $$LIB_DIR
    headers_dir = $$INC_DIR
    datamodels_headers.path = $$headers_dir/datamodels
    datamodels_headers.files = $$DATA_MODELS_HEADERS
    INSTALLS += target datamodels_headers
}
