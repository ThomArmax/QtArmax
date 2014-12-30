TARGET = QtArmaxCore
TEMPLATE = lib

DEFINES += QT_ARMAX_CORE

include(../common.pri)

DESTDIR = $$PWD/../../usr/lib/QtArmax

PUBLIC_HEADERS += \
    datamodels/abstractlistitem.h \
    datamodels/abstractqueue.h \
    datamodels/fifo.h \
    datamodels/lifo.h \
    datamodels/listmodel.h

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
    target.path = /usr/lib/QtArmax
    public_headers.path = /usr/include/QtArmax
    public_headers.files = $$PUBLIC_HEADERS
    INSTALLS += target public_headers
}
