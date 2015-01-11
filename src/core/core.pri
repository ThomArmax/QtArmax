include(../common.pri)

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../usr/lib/QtArmax -lQtArmaxCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../usr/lib/QtArmax -lQtArmaxCore
else:unix: LIBS += -L$$PWD/../../usr/lib/QtArmax -lQtArmaxCore

INCLUDEPATH += $$PWD/datamodels
DEPENDPATH += $$PWD/datamodels
