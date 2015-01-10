/****************************************************************************
**
** Copyright (C) 2014 Thomas COIN
** Contact: esvcorp@gmail.com
**
** This file is part of the QtArmax library.
** QtArmax is free software; you can redistribute it and/or
** modify it under the terms of the GNU Library General Public
** License as published by the Free Software Foundation; either
** version 2 of the License, or (at your option) any later version.
**
** QtArmax is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
** Library General Public License for more details.
**
** You should have received a copy of the GNU Library General Public
** License along with libiberty; see the file COPYING.LIB.  If
** not, write to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
** Boston, MA 02110-1301, USA.
**
****************************************************************************/

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
