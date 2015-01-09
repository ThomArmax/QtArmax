#include <QGuiApplication>
#include <QtQml>
#include <QDebug>

#include "global.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath(QString(LOCAL_QML_IMPORT_PATH));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
