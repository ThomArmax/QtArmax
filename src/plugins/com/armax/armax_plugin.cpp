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

#include "armax_plugin.h"
#include "xpolygon.h"
#include "xregularpolygon.h"

#include <QQmlEngine>
#include <QQmlContext>

static const struct {
    const char *type;
    int major, minor;
} qmldir [] = {
    { "XPolygonMask", 1, 0 }
};

void ArmaxPlugin::registerTypes(const char *uri)
{
    Q_INIT_RESOURCE(QtArmaxPlugin);

    // @uri com.armax
    qmlRegisterType<XPen>(uri, 1, 0, "XPen");
    qmlRegisterType<XPolygon>(uri, 1, 0, "XPolygon");
    qmlRegisterType<XRegularPolygon>(uri, 1, 0, "XRegularPolygon");

    for (int i = 0; i < int(sizeof(qmldir)/sizeof(qmldir[0])); i++)
        qmlRegisterType(QUrl(QString("qrc:/com/armax/") + qmldir[i].type + ".qml"), uri, qmldir[i].major, qmldir[i].minor, qmldir[i].type);
}

void ArmaxPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
    engine->addImportPath(QStringLiteral("qrc:/"));
}
