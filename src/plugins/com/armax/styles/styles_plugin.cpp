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

#include "styles_plugin.h"

#include <QtQml>

static const struct {
    const char *type;
    int major, minor;
} qmldir [] = {
    { "XStyle"              , 1, 0 },
    { "XDarkBlueStyle"      , 1, 0 },
    { "XDarkRedStyle"       , 1, 0 },
    { "XFlatDarkBlueStyle"  , 1, 0 }
};

static void initResources()
{
    Q_INIT_RESOURCE(QtArmaxStylesPlugin);
}

void StylesPlugin::registerTypes(const char *uri)
{
    initResources();
    // @uri com.mycompany.qmlcomponents

    const QString filesLocation = fileLocation();
    for (int i = 0; i < int(sizeof(qmldir)/sizeof(qmldir[0])); i++)
        qmlRegisterType(QUrl(filesLocation + "/" + qmldir[i].type + ".qml"), uri, qmldir[i].major, qmldir[i].minor, qmldir[i].type);
}

void StylesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
    Q_UNUSED(engine);

    if (isLoadedFromResource())
        engine->addImportPath(QStringLiteral("qrc:/"));
}

QString StylesPlugin::fileLocation() const
{
    if (isLoadedFromResource())
        return "qrc:/com/armax/styles";
    return baseUrl().toString();
}

bool StylesPlugin::isLoadedFromResource() const
{
    // If one file is missing, it will load all the files from the resource
//    QFile file(baseUrl().toLocalFile() + "/ApplicationWindow.qml");
//    if (!file.exists())
//        return true;
//    return false;

    return true;
}
