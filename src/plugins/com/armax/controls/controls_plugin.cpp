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

#include "controls_plugin.h"
#include "xexclusivegroup.h"
#include "xcheckable.h"

#include <QQmlEngine>
#include <QQmlContext>

static const struct {
    const char *type;
    int major, minor;
} qmldir [] = {
    { "XCheckBox"           , 1, 0 },
    { "XRadioButton"        , 1, 0 },
    { "XButton"             , 1, 0 },
    { "XSlider"             , 1, 0 },
    { "XProgressBar"        , 1, 0 },
    { "XCircularProgress"   , 1, 0 },
    { "XToggleSwitch"       , 1, 0 }
};

static void initResources()
{
    Q_INIT_RESOURCE(QtArmaxControlsPlugin);
}

void ControlsPlugin::registerTypes(const char *uri)
{
    initResources();
    // @uri com.mycompany.qmlcomponents

    qmlRegisterType<XCheckable>(uri, 1, 0, "XCheckable");
    qmlRegisterType<XExclusiveGroup>(uri, 1, 0, "XExclusiveGroup");

    const QString filesLocation = fileLocation();
    for (int i = 0; i < int(sizeof(qmldir)/sizeof(qmldir[0])); i++)
        qmlRegisterType(QUrl(filesLocation + "/" + qmldir[i].type + ".qml"), uri, qmldir[i].major, qmldir[i].minor, qmldir[i].type);
}

void ControlsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine);
    Q_UNUSED(uri);

    qmlRegisterType<XCheckable>(uri, 1, 0, "XCheckable");
    qmlRegisterType<XExclusiveGroup>(uri, 1, 0, "XExclusiveGroup");

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
