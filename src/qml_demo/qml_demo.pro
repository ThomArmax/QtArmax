TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml_demo.qrc

DESTDIR = $$absolute_path(../../demos)

OTHER_FILES +=  \
    main.qml \
    ButtonsPage.qml \

include(../common.pri)

# Default rules for deployment.
#include(deployment.pri)

DISTFILES += \
    SlidersPage.qml \
    ProgressPage.qml
