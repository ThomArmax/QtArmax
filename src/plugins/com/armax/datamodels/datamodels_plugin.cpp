#include "datamodels_plugin.h"
#include "listmodel.h"
#include "abstractlistitem.h"
#include "fifo.h"
#include "lifo.h"

#include <QtQml>

using namespace Armax::Datamodels;

static void initResources()
{
    //Q_INIT_RESOURCE(datamodels);
}

void DataModelsPlugin::registerTypes(const char *uri)
{
    initResources();

    qmlRegisterType<ListModel>  (uri, 1, 0, "XListModel");
    qmlRegisterType<Fifo>       (uri, 1, 0, "XFifo");
    qmlRegisterType<Lifo>       (uri, 1, 0, "XLifo");

    qmlRegisterUncreatableType<AbstractListItem>(uri, 1, 0, "XAbstractListItem", "Virtual");
}

void DataModelsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
    Q_UNUSED(engine);

    if (isLoadedFromResource())
        engine->addImportPath(QStringLiteral("qrc:/"));

}

QString DataModelsPlugin::fileLocation() const
{
    if (isLoadedFromResource())
        return "qrc:/com/armax/datamodels";
    return baseUrl().toString();
}

bool DataModelsPlugin::isLoadedFromResource() const
{
    // If one file is missing, it will load all the files from the resource
//    QFile file(baseUrl().toLocalFile() + "/ApplicationWindow.qml");
//    if (!file.exists())
//        return true;
//    return false;

    return true;
}
