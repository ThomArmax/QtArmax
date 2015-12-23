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
#include "treemodel.h"
#include "sortfilterproxymodel.h"
#include "treesortfilterproxymodel.h"

#include <QtQml>

void DataModelsPlugin::registerTypes(const char *uri)
{
    // @uri com.armax.datamodels
    qmlRegisterUncreatableType<Armax::Datamodels::ListModel>    (uri, 1, 0, "XListModel", "Can only be instanciated from C++ side");
    qmlRegisterUncreatableType<Armax::Datamodels::TreeModel>    (uri, 1, 0, "XTreeModel", "Can only be instanciated from C++ side");
    qmlRegisterUncreatableType<Armax::Datamodels::Fifo>         (uri, 1, 0, "XFifo", "Can only be instanciated from C++ side");
    qmlRegisterUncreatableType<Armax::Datamodels::Lifo>         (uri, 1, 0, "XLifo", "Can only be instanciated from C++ side");
    qmlRegisterType<Armax::Datamodels::SortFilterProxyModel>    (uri, 1, 0, "XSortFilterProxyModel");
    qmlRegisterType<Armax::Datamodels::TreeSortFilterProxyModel>(uri, 1, 0, "XTreeSortFilterProxyModel");

    qmlRegisterType<QSortFilterProxyModel>();
    qmlRegisterType<QAbstractProxyModel>();
    qmlRegisterType<QAbstractItemModel>();
    qmlRegisterType<Armax::Datamodels::AbstractListItem>();
}

void DataModelsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
    Q_UNUSED(engine);
}
