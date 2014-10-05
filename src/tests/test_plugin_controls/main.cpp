#include <QGuiApplication>
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addPluginPath("C:\\Users\\tcoin\\Projects\\QtArmax\\imports");
    engine.addImportPath("C:\\Users\\tcoin\\Projects\\QtArmax\\imports");
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
