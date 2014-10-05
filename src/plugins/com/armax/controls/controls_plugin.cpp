#include "controls_plugin.h"
#include "checkable.h"

#include <QQmlEngine>
#include <QQmlContext>

static const struct {
    const char *type;
    int major, minor;
} qmldir [] = {
    { "CheckBox"    , 1, 0 },
    { "RadioButton" , 1, 0 },
    { "Button"      , 1, 0 },
    { "Style"       , 1, 0 }
};

static void initResources()
{
    //Q_INIT_RESOURCE(controls);
}

void ControlsPlugin::registerTypes(const char *uri)
{
    initResources();
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType<Checkable>(uri, 1, 0, "Checkable");

    const QString filesLocation = fileLocation();
        for (int i = 0; i < int(sizeof(qmldir)/sizeof(qmldir[0])); i++)
            qmlRegisterType(QUrl(filesLocation + "/" + qmldir[i].type + ".qml"), uri, qmldir[i].major, qmldir[i].minor, qmldir[i].type);
}

void ControlsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
    Q_UNUSED(engine);

    if (isLoadedFromResource())
        engine->addImportPath(QStringLiteral("qrc:/"));

}

QString ControlsPlugin::fileLocation() const
{
    if (isLoadedFromResource())
        return "qrc:/com/armax/controls";
    return baseUrl().toString();
}

bool ControlsPlugin::isLoadedFromResource() const
{
    // If one file is missing, it will load all the files from the resource
//    QFile file(baseUrl().toLocalFile() + "/ApplicationWindow.qml");
//    if (!file.exists())
//        return true;
//    return false;

    return true;
}
