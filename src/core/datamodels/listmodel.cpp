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

#include "listmodel.h"

#include <QDebug>

namespace Armax {
namespace Datamodels {

/**
 * @brief ListModel constructor
 * @param parent : the parent object
 */
ListModel::ListModel(QObject *parent) : QAbstractItemModel(parent),
    m_prototype         (NULL),
    m_maxSize           (-1),
    m_selectedIndex     (-1),
    m_hasObjectOwnership(true)
{

}

/**
 * @brief ListModel contructor
 * @param prototype : the type of items which the model will contains
 * @param parent : the parent object
 * @note the ListModel will take the 'prototype' ownership
 */
ListModel::ListModel(AbstractListItem* prototype, QObject *parent) : QAbstractItemModel(parent),
    m_prototype         (prototype),
    m_maxSize           (-1),
    m_selectedIndex     (-1),
    m_hasObjectOwnership(true)
{
    m_rolesNames = m_prototype->roleNames();
}

/**
 * @brief ListModel destructor, frees allocated resources
 */
ListModel::~ListModel()
{
    if(m_prototype)
        delete m_prototype;
    clear();
}

/**
 * @brief Sets the maximum number of items the model can contain
 * @param size : maximum number of items the model can contain
 * @return true if succeeded, false otherwise
 */
bool ListModel::setMaxSize(const int &size)
{
    if(m_maxSize != size)
    {
        m_maxSize = size;
        return true;
    }
    return false;
}

/**
 * @brief Returns the number of items contained in the model
 * @param parent : not used
 * @return the number of items contained in the model
 */
int ListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_list.size();
}

/**
 * @return the number of roles in the prototype (handled as a column)
 */
int ListModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return roleNames().size();
}

/**
 * @brief Moved the row from "from" to "to".
 * @param from
 * @param to
 * @return true if succedded; false otherwise
 */
bool ListModel::moveRow(const int from, const int to)
{
    if(from >= 0 && from < m_list.size() && to >= 0 && to < m_list.size())
    {
        if(from == to)
            return true;
        int destinationChild = (from < to) ? to+1 : to;
        beginMoveRows(QModelIndex(), from, from, QModelIndex(), destinationChild);
        m_list.move(from, to);
        emit rowsMoved(from, to);
        endMoveRows();
        return true;
    }
    return false;
}

bool ListModel::moveRows(const QModelIndex &sourceParent, int sourceRow, int count, const QModelIndex &destinationParent, int destinationChild)
Q_DECL_OVERRIDE
{
    Q_UNUSED(sourceParent)
    Q_UNUSED(destinationParent)
    Q_UNUSED(count)
    if(count == 1)
        return moveRow(sourceRow, destinationChild);
    qWarning() << Q_FUNC_INFO << "not implemented";
    return false;
}

/**
 * @brief Returns the data stored under the given role for the item referred to by the index.
 * @param index : item's index in the model
 * @param role : data's role
 * @return the data stored under the given role for the item referred to by the index if exists,
 * invalid QVariant otherwise.
 */
QVariant ListModel::data(const QModelIndex &index, int role) const
Q_DECL_OVERRIDE
{
    if(index.row() < 0 || index.row() >= m_list.size()) {
        return QVariant();
    }
    return m_list.at(index.row())->data(role);
}

/**
 * @brief Sets the role data for the item at index to value. The dataChanged() signal is emitted if the data was successfully set.
 * @param index: the index of the object to be updated
 * @param value : the value to be set
 * @param role : the value's role
 * @return true if successful; otherwise returns false.
 */
bool ListModel::setData(const QModelIndex &index, const QVariant &value, int role/* = Qt::EditRole*/)
Q_DECL_OVERRIDE
{
    if(index.row() < 0 || index.row() >= m_list.size())
        return false;

    if(m_list.at(index.row())->setData(value, role))
    {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

QModelIndex ListModel::index(int row) const
{
    return index(row, 0, QModelIndex());
}

QModelIndex ListModel::index(int row, int column, const QModelIndex &parent) const
Q_DECL_OVERRIDE
{
    Q_UNUSED(parent)
    return createIndex(row, column, m_list.at(row));
}

QModelIndex ListModel::parent(const QModelIndex &) const
Q_DECL_OVERRIDE
{
    return QModelIndex();
}

/**
 * @brief Prepends the given item into the model
 * @param item : the item to be prepended
 */
void ListModel::prependRow(AbstractListItem *item)
{
    prependRows(QList<AbstractListItem*>() << item);
}

/**
 * @brief Prepends the given item into the model
 * @param items : the items list to be prepended
 */
void ListModel::prependRows(const QList<AbstractListItem *> &items)
{
    QList<AbstractListItem*> newList = items;
    if(maxSize() > 0)
    {
        if((items.count() + rowCount()) > maxSize())
        {
            if(items.count() <= maxSize())
            {
                removeRows(items.count()-1, items.count());
            }
            else
            {
                while(newList.count() > maxSize())
                {
                    newList.removeAt(newList.count()-1);
                }
            }
        }
    }

    beginInsertRows(QModelIndex(), 0, items.size()-1);
    foreach(AbstractListItem *item, newList)
    {
        connect(item, SIGNAL(dataChanged(int)), SLOT(handleItemChange(int)));
        //connect(item, SIGNAL(dataChanged()), SLOT(handleItemChange()));
        m_list.prepend(item);
        emit rowCountChanged();
    }
    endInsertRows();
}

/**
 * @brief Appends a single row to the model
 * @param item : the item to be appended
 */
void ListModel::appendRow(AbstractListItem *item)
{
    appendRows(QList<AbstractListItem*>() << item);
}

/**
 * @brief Appends a list of rows to the model.
 * @param items : the item's list to be appened.
 */
void ListModel::appendRows(const QList<AbstractListItem *> &items)
{
    QList<AbstractListItem*> newList = items;
    if(m_maxSize > 0)
    {
        if((items.count() + rowCount()) > maxSize())
        {
            if(items.count() <= maxSize())
            {
                removeRows(0, (items.count() + rowCount())- maxSize());
            }
            else
            {
                while(newList.count() > maxSize())
                {
                    newList.removeAt(0);
                }
            }
        }
    }

    beginInsertRows(QModelIndex(), rowCount(), rowCount()+items.size()-1);
    foreach(AbstractListItem *item, newList)
    {
        connect(item, SIGNAL(dataChanged(int)), SLOT(handleItemChange(int)));
        //connect(item, SIGNAL(dataChanged()), SLOT(handleItemChange()));
        m_list.append(item);
        emit rowCountChanged();
    }
    endInsertRows();
}

/**
 * @brief Inserts a single row before the given row.
 * @note If the 'maxSize' property is set (>0), and the model is full, the first item of the model will be deleted
 * @param row
 * @param item
 */
void ListModel::insertRow(const int &row, AbstractListItem *item)
{
    if(maxSize() > 0)
    {
        if(rowCount() >= maxSize())
        {
            removeRow(0);
        }
    }
    beginInsertRows(QModelIndex(), row, row);
    connect(item, SIGNAL(dataChanged()), SLOT(handleItemChange()));
    m_list.insert(row, item);
    emit rowCountChanged();
    endInsertRows();
}

/**
 * @brief Slot used to handle the items changes.
 * The dataChanged signal is emitted if a property changes in a model's item
 */
void ListModel::handleItemChange(int role)
{
    AbstractListItem* item = static_cast<AbstractListItem*>(sender());
    QModelIndex index = indexFromItem(item);
    if(index.isValid())
    {
        //qDebug() << Q_FUNC_INFO << roleNames().value(role) << item->data(role) << index;
        emit dataChanged(index, index, QVector<int>() << role);
    }
}

/**
 * @brief Returns a list of indexes for the items in the column of the start index where data stored under the given role matches the specified value.
 * The way the search is performed is defined by the flags given.
 * The list that is returned may be empty.
 * @todo Handle start, hits, flags params, and make the match not only on QString value/contains
 */
QModelIndexList ListModel::match(const QModelIndex &start, int role, const QVariant &value, int hits, Qt::MatchFlags flags) const
{
    Q_UNUSED(start)
    Q_UNUSED(hits)
    Q_UNUSED(flags)
    QModelIndexList matchIndexes;
    foreach(AbstractListItem* item, m_list)
    {
        if(item->data(role).toString().contains(value.toString(), Qt::CaseInsensitive))
            matchIndexes << indexFromItem(item);
    }

    return matchIndexes;
}

/**
 * @brief Finds the item which has the given value for the given role
 * @param toFind : the value to find
 * @param role : the role in which to find
 * @return the item corresponding if succeeded, 0 otherwise
 */
AbstractListItem * ListModel::find(const QVariant &toFind, const int &role) const
{
    AbstractListItem * o = NULL;

    foreach(AbstractListItem* item, m_list)
    {
        if(item->data(role) == toFind)
        {
            o = item;
        }
    }
    return o;
}

/**
 * @brief Returns the index of the given item
 * @param item
 * @return the index of the given item if succeeded; empty QModelIndex otherwise
 */
QModelIndex ListModel::indexFromItem(const AbstractListItem *item) const
{
    Q_ASSERT(item);
    for(int row=0; row<m_list.size(); ++row)
    {
        if(m_list.at(row) == item)
        {
            //qDebug() << Q_FUNC_INFO << "item found" << item;
            return index(row);
        }
    }
    qWarning() << Q_FUNC_INFO << item << "item NOT found";
    return QModelIndex();
}

/**
 * @brief Clears the model by deleting all its items.
 */
void ListModel::clear()
{
    beginResetModel();

    if(m_hasObjectOwnership)
    {
        foreach(AbstractListItem * item, m_list)
            item->deleteLater();
    }
    m_list.clear();
    endResetModel();
}

/**
 * @brief Clears the model without deleting its elements
 */
void ListModel::clearNoDelete()
{
    beginResetModel();
    m_list.clear();
    endResetModel();
}

/**
 * @brief Removes the given row from the child items of the parent specified.
 * @param row
 * @param parent
 * @return true if the row is removed; otherwise returns false.
 */
bool ListModel::removeRow(const int &row, const QModelIndex &parent)
{
    Q_UNUSED(parent);
    if(row < 0 || row >= m_list.size()) return false;
    beginRemoveRows(QModelIndex(), row, row);
    m_list.at(row)->disconnect(this);
    if(m_hasObjectOwnership)
        m_list.takeAt(row)->deleteLater();
    else
        m_list.takeAt(row);
    emit rowCountChanged();
    endRemoveRows();
    return true;
}

/**
 * @brief Removes count rows starting with the given row under parent parent from the model.
 * @param row
 * @param count
 * @param parent
 * @return true if the rows were successfully removed; otherwise returns false.
 */
bool ListModel::removeRows(const int &row, const int &count, const QModelIndex &parent)
{
    Q_UNUSED(parent);
    if(row < 0 || (row+count) > m_list.size())
    {
        qWarning() << Q_FUNC_INFO << "BAD RANGE (from row" << row << ", count = " << count << ", size =" << m_list.size() << ")";
        return false;
    }
    beginRemoveRows(QModelIndex(), row, row+count-1);
    m_list.at(row)->disconnect(this);
    for(int i=0; i<count; ++i)
    {
        if(m_hasObjectOwnership)
            m_list.takeAt(row)->deleteLater();
        else
            m_list.takeAt(row);
    }
    emit rowCountChanged();
    endRemoveRows();
    return true;
}

/**
 * @brief Removes the item at index position row and returns it. row must be a valid index position in the model (i.e., 0 <= i < rowCount()).
 * @param row
 * @return the taken item
 */
AbstractListItem * ListModel::takeRow(int row)
{
    beginRemoveRows(QModelIndex(), row, row);
    AbstractListItem* item = m_list.takeAt(row);
    item->disconnect(this);
    emit rowCountChanged();
    endRemoveRows();
    return item;
}

/**
 * @brief Returns the item at the given row.
 * @param row
 * @return the item at the given row if exists; otherwise 0.
 */
AbstractListItem *ListModel::at(int row)
{
    if(row < 0 || row >= m_list.size()) return 0;
    return m_list.at(row);
}

/**
 * @brief Selects the given item in the model
 * @param item : the item to be set as selected.
 * @return true if succeeded, false otherwise
 * @sa selectedItem()
 * @sa selectIndex(int row)
 * @sa selectedIndex()
 */
bool ListModel::selectItem(AbstractListItem *item)
{
    bool bRet = false;
    QModelIndex modelIndex;
    if(item)
    {
        modelIndex = indexFromItem(item);
        if(modelIndex.isValid())
            bRet = selectIndex(modelIndex.row());
    }

    return bRet;
}

/**
 * @brief Returns the selected item
 * @return
 */
AbstractListItem * ListModel::selectedItem()
{
    return m_list.value(m_selectedIndex, 0);
}

/**
 * @brief Selects the given row
 * @param row : the row to be selected
 * @return true if succeeded, false otherwise
 */
bool ListModel::selectIndex(const int &row)
{
    if(m_selectedIndex != row)
    {
        m_selectedIndex = row;

        foreach(AbstractListItem *item, m_list)
            item->setIsSelected(false);

        m_list.at(m_selectedIndex)->setIsSelected(true);

        emit selectedIndexChanged();
        emit selectedItemChanged();
        return true;
    }
    return false;
}

/**
 * @brief Returns the selected index
 * @return the selected index
 * @sa selectIndex(int row)
 */
int ListModel::selectedIndex() const
{
    return m_selectedIndex;
}

/**
 * @brief Returns the model as string.
 * @return the model as string.
 */
QString ListModel::toString() const
{
    QString str;
    foreach(AbstractListItem * item, m_list)
    {
        str.append(item->toString()).append("\n");
    }
    //str.remove(str.length()-1, 1);

    return str;
}

/**
 * @brief Reset current selection
 */
void ListModel::resetSelection()
{
    m_selectedIndex = -1;

    foreach(AbstractListItem *item, m_list)
        item->setIsSelected(false);

    emit selectedIndexChanged();
    emit selectedItemChanged();
}

/**
 * @brief Returns the model as a JSON string.
 * @return the model as a JSON string.
 */
/*QString ListModel::toJSON() const
{
    QVariantList list;
    foreach(AbstractListItem * item, m_list)
    {
        list << item->toMap();
    }
    return JSON::Instance().serialize(list);
}*/

}} // END namespace
