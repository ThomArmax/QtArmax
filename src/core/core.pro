TARGET = QtArmaxCore
TEMPLATE = lib

DEFINES += QT_ARMAX_CORE

unix {
    target.path = /usr/lib
    INSTALLS += target
}

DESTDIR = $$PWD/../../usr/lib
message(DESTDIR $$DESTDIR)
HEADERS += \
    datamodels/abstractlistitem.h \
    datamodels/abstractqueue.h \
    datamodels/fifo.h \
    datamodels/lifo.h \
    datamodels/listmodel.h

SOURCES += \
    datamodels/abstractlistitem.cpp \
    datamodels/abstractqueue.cpp \
    datamodels/fifo.cpp \
    datamodels/lifo.cpp \
    datamodels/listmodel.cpp

OTHER_FILES += \
    core.pri
