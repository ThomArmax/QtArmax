#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "global.h"

int main(int argc, char *argv[])
{
    QGuiApplication         app(argc, argv);
    QQmlApplicationEngine   engine;
    QString                 localPlugins = QString(STRINGIFY(LOCAL_QML_IMPORT_PATH));

    localPlugins = localPlugins.remove("\"");
    engine.addImportPath(localPlugins);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
