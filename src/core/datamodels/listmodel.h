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

#ifndef LISTMODEL_H
#define LISTMODEL_H

#include "abstractlistitem.h"

#include <QAbstractItemModel>
#include <QStringList>
#include <QHash>

namespace Armax {
namespace Datamodels {

/**
 * @brief The ListModel class inherists QAbstractListModel, used to handle objects which inherits AbstractListItem into a view
 * (ListView, GridView ...)
 * @sa AbstractListItem
 */
class ListModel : public QAbstractItemModel
{
    Q_OBJECT
    Q_PROPERTY(int                  size            READ rowCount                           NOTIFY rowCountChanged      )
    Q_PROPERTY(int                  selectedIndex   READ selectedIndex  WRITE selectIndex   NOTIFY selectedIndexChanged )
    Q_PROPERTY(AbstractListItem*    selectedItem    READ selectedItem   WRITE selectItem    NOTIFY selectedItemChanged  )

public:
    explicit                ListModel           (QObject * parent = 0);
                            ListModel           (AbstractListItem* prototype, QObject* parent = 0);
    virtual ~               ListModel           ();

    // QAbstractListModel
    int                     rowCount            (const QModelIndex &parent = QModelIndex()) const;
    int                     columnCount         (const QModelIndex &parent = QModelIndex()) const;
    QVariant                data                (const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool                    setData             (const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    bool                    removeRows          (const int &row, const int &count, const QModelIndex &parent = QModelIndex());
    QModelIndexList         match               (const QModelIndex &start, int role, const QVariant &value, int hits=1, Qt::MatchFlags flags = Qt::MatchStartsWith | Qt::MatchWrap) const;
    QHash<int, QByteArray>  roleNames           () const { return m_rolesNames; }
    QModelIndex             index               (int row) const;
    virtual QModelIndex     index               (int row, int column, const QModelIndex & parent = QModelIndex()) const;
    QModelIndex             parent              (const QModelIndex &child) const;

    // Sizes
    bool                    isEmpty             () const { return m_list.isEmpty(); }
    Q_INVOKABLE int         count               () const { return rowCount(); }
    Q_INVOKABLE int         size                () const { return rowCount(); }

    // Row opperations
    void                    prependRow          (AbstractListItem* item);
    void                    prependRows         (const QList<AbstractListItem *> &items);
    void                    appendRow           (AbstractListItem* item);
    void                    appendRows          (const QList<AbstractListItem *> &items);
    void                    insertRow           (const int &row, AbstractListItem* item);
    bool                    removeRow           (const int &row, const QModelIndex &parent = QModelIndex());
    AbstractListItem*       takeRow             (int row);
    Q_INVOKABLE bool        moveRow             (const int from, const int to);
    bool                    moveRows            (const QModelIndex &sourceParent, int sourceRow, int count, const QModelIndex &destinationParent, int destinationChild);

    // Item getters
    AbstractListItem*       at                  (int row);
    Q_INVOKABLE QObject*    get                 (int index);
    QList
        <AbstractListItem*> items               () { return m_list; }
    QList
        <AbstractListItem*>*itemsRef            () { return &m_list; }

    QModelIndex             indexFromItem       (const AbstractListItem* item) const;

    // Model size
    bool                    setMaxSize          (const int &size);
    int                     maxSize             () const { return m_maxSize; }

    // Cleaning
    void                    clear               ();
    void                    clearNoDelete       ();

    // Items handling
    void                    setHasObjectOwnership(const bool hasOwnership) { m_hasObjectOwnership = hasOwnership; }
    bool                    hasObjectOwnership  () const { return m_hasObjectOwnership; }

    // Item selection
    bool                    selectItem          (AbstractListItem * item);
    AbstractListItem*       selectedItem        ();
    bool                    selectIndex         (const int &row);
    int                     selectedIndex       () const;
    
    // Tooling
    QString                 toString            () const;
    QString                 toJSON              () const;

    QString                 prototypeClassName  () const { return m_prototype ? m_prototype->metaObject()->className() : ""; }

public slots:
    AbstractListItem *      find                (const QVariant &toFind, const int &role) const;
    void                    resetSelection      ();

signals:
    void                    selectedIndexChanged();     /**< Signal emitted when the selected index changed                 */
    void                    selectedItemChanged ();     /**< Signal emitted when the selected item changed                  */
    void                    rowCountChanged     ();     /**< Signal emitted when the number of rows in the model changed    */
    void                    rowsMoved           (int from, int to);

private slots:
    void                    handleItemChange    (int role = Qt::DisplayRole);

protected :
    AbstractListItem*           m_prototype;        /**< The model's items' prototype                                   */
    QList<AbstractListItem *>   m_list;             /**< The list containing all model's items                          */
    int                         m_maxSize;          /**< The model's maximum size                                       */
    int                         m_selectedIndex;    /**< The currently selected index                                   */
    QHash<int, QByteArray>      m_rolesNames;       /**< The model's roles                                              */
    bool                        m_hasObjectOwnership;
    
};

}} // END namespace Armax::Datamodels

#endif // LISTMODEL_H
