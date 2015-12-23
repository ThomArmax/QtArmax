#include "treemodel.h"

#include <QDir>
#include <QDateTime>
#include <QDebug>

namespace Armax {
namespace Datamodels {
/**
 * @brief TreeModel default constructor
 * @param parent : TreeModel's parent obbject
 */

TreeModel::TreeModel(QObject *parent) : QAbstractItemModel(parent)
{
    m_rootItem      = new TreeRoot();
    m_rootItem->setParent(this);
    m_selectedIndex = createIndex(0,0);
}

/**
  * @brief TreeModel::TreeModel
  * @param headers
  * @param data
  * @param parent
  */
TreeModel::TreeModel(const QStringList &headers, const QString &data, QObject *parent) : QAbstractItemModel(parent)
{
    Q_UNUSED(data);
    QVector<QVariant> rootData;
    foreach (QString header, headers)
        rootData << header;

    m_rootItem = new TreeRoot();
    m_rootItem->setParent(this);
    m_rootItem->setIndex(createIndex(0,0));
    m_selectedIndex = m_rootItem->index();
}

/**
 * @brief TreeModel::~TreeModel
 */
TreeModel::~TreeModel()
{
    if (m_rootItem)
        m_rootItem->deleteLater();
}

/**
 * @return the number of columns for the children of the given parent.
 */
int TreeModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_rootItem->roleNames().count();
}

/**
 * @return the data stored under the given role for the item referred to by the index
 */
QVariant TreeModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        qWarning() << Q_FUNC_INFO << index << "INVALID !";
        return QVariant();
    }

    AbstractTreeItem *item = getItem(index);

    return item->data(role);
}

/**
 * @brief TreeModel::flags
 * @param index
 * @return
 */
Qt::ItemFlags TreeModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return 0;

    return Qt::ItemIsEditable | Qt::ItemIsEnabled | Qt::ItemIsSelectable;
}

/**
 * @return the item at index if found, root item otherwise
 */
AbstractTreeItem *TreeModel::getItem(const QModelIndex &index) const
{
    if (index.isValid()) {
        AbstractTreeItem *item = static_cast<AbstractTreeItem*>(index.internalPointer());
        if (item)
            return item;
    }
    return m_rootItem;
}

/**
 * @return the object at index if found, root item otherwise
 */
QObject * TreeModel::getObject(const QModelIndex &index) const
{
   QObject * obj;
   AbstractTreeItem * item = getItem(index);
   obj = qobject_cast<QObject*>(item);
   return obj;
}

/**
 * @return true if parent has any children; otherwise returns false.
 * @note Use rowCount() on the parent to find out the number of children.
 */
bool TreeModel::hasChildren(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return false;

    AbstractTreeItem * parentItem= getItem(parent);
    if (parentItem->childrenCount() > 0)
        return true;

    return false;
}

/**
 * @brief Selects the given index.
 * selectedIndexChanged() signal is emitted is succeeded
 * @return true if succeeded, false otherwise
 */
bool TreeModel::selectIndex(const QModelIndex &index)
{
    if (m_selectedIndex != index) {
        m_selectedIndex = index;
        emit selectedIndexChanged();
        return true;
    }
    return false;
}

/**
 * @return the selected index
 */
QModelIndex TreeModel::selectedIndex() const
{    
    return m_selectedIndex;
}

/**
 * @return all parents objects for the given index
 */
QList<QObject *> TreeModel::parentsObjects(const QModelIndex &index)
{
    QList<QObject * > parents;
    QModelIndex tmpIndex = index;
    while (tmpIndex.isValid()) {
        tmpIndex = parent(tmpIndex);
        parents.prepend(getObject(tmpIndex));
    }

    return parents;
}

/**
 * @return parents count for the given index
 */
int TreeModel::parentsCount(const QModelIndex &index)
{
    QModelIndex tmpIndex = index;
    int count = 0;
    while (tmpIndex.isValid()) {
        tmpIndex = parent(tmpIndex);
        count++;
    }

    return count;
}

/**
 * @brief Updates the model's roles names with the given item
 */
void TreeModel::updateRolesNames(AbstractTreeItem *item)
{
    QHash<int,QByteArray> newRoles = item->roleNames();
    QHashIterator<int,QByteArray> i(newRoles);
    while (i.hasNext()) {
        i.next();
        m_roleNames[i.key()] =  i.value();
    }
}

/**
 * @return the data for the given role and section in the header with the specified orientation.
 * For horizontal headers, the section number corresponds to the column number.
 * Similarly, for vertical headers, the section number corresponds to the row number.
 */
QVariant TreeModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    Q_UNUSED(section)
    if (orientation == Qt::Horizontal && role == Qt::DisplayRole) {
        return m_rootItem->roleNames().value(role, "NoHeader");
    }

    return QVariant();
}

/**
 * @return model's roles names
 */
QHash<int,QByteArray> TreeModel::roleNames() const
{
    return m_roleNames;
}

/**
 * @return the index of the item in the model specified by the given row, column and parent index.
 */
QModelIndex TreeModel::index(int row, int column, const QModelIndex &parent) const
{
    AbstractTreeItem *parentItem    = getItem(parent);
    if (parentItem) {
        AbstractTreeItem *childItem     = parentItem->child(row);

        if (childItem) {
            QModelIndex index = createIndex(row, column, childItem);
            return index;
        }
    }
    return QModelIndex();
}

/**
 * @brief Inserts a single column before the given column in the child items of the parent specified.
 * @param position
 * @param item
 * @param parent
 * @return true if the column is inserted; otherwise returns false.
 */
bool TreeModel::insertColumn(int position, AbstractTreeItem *item, const QModelIndex &parent)
{
    bool success;

    beginInsertColumns(parent, position, position);
    success = m_rootItem->insertChild(item, parent.row());
    endInsertColumns();

    return success;
}

/**
 * @brief TreeModel::insertColumns
 * @param position
 * @param columns
 * @param parent
 * @return
 */
bool TreeModel::insertColumns(int position, int columns, const QModelIndex &parent)
{
    bool success;

    beginInsertColumns(parent, position, position + columns - 1);
    success = m_rootItem->insertColumns(position, columns);
    endInsertColumns();

    return success;
}

/**
 * @brief TreeModel::insertRows
 * @param position
 * @param rows
 * @param parent
 * @return
 */
bool TreeModel::insertRows(int position, int rows, const QModelIndex &parent)
{
    AbstractTreeItem *parentItem = getItem(parent);
    bool success;

    beginInsertRows(parent, position, position + rows - 1);
    success = parentItem->insertChildren(position, rows, m_rootItem->columnCount());
    endInsertRows();

    return success;
}

/**
 * @brief Inserts a single row before the given row in the child items of the parent specified.
 * @return true if the row is inserted; otherwise returns false.
 */
bool TreeModel::insertRow(int position, AbstractTreeItem *item, const QModelIndex &parent)
{
    AbstractTreeItem *parentItem = getItem(parent);
    bool success;

    beginInsertRows(parent, position, position);
    success = parentItem->insertChild(item, position);
    item->setIndex(index(position, 0, parent));
    if (success)  {
        connect(item, SIGNAL(dataChanged(int)), SLOT(handleItemChange(int)));
        updateRolesNames(item);
    }
    endInsertRows();

    return success;
}


/**
 * @brief Append a single row in the parent specified.
 * @return true if the row was appended; otherwise returns false.
 */
bool TreeModel::appendRow(AbstractTreeItem *item, const QModelIndex &parent)
{
    return insertRow(rowCount(parent), item, parent);
}

/**
 * @brief TreeModel::insertChild
 * @param position
 * @param child
 * @param parent
 * @return
 */
bool TreeModel::insertChild(int position, AbstractTreeItem *child, AbstractTreeItem *parent)
{
    bool success = false;
    if (parent) {
        beginInsertRows(parent->index(), position, position);
        success = parent->insertChild(child, position);
        child->setIndex(index(position, 0, parent->index()));
        if (success) {
            connect(child, SIGNAL(dataChanged(int)), SLOT(handleItemChange(int)));
            updateRolesNames(child);
        }
        endInsertRows();
    }
    return success;
}

/**
 * @brief TreeModel::appendChild
 * @param child
 * @param parent
 * @return
 */
bool TreeModel::appendChild(AbstractTreeItem *child, AbstractTreeItem *parent)
{
    bool success = false;
    int position = -1;
    if (parent) {
        position = parent->childrenCount();
        success = insertChild(position, child, parent);
    }
    return success;
}

/**
 * @return the parent of the model item with the given index.
 * If the item has no parent, an invalid QModelIndex is returned.
 */
QModelIndex TreeModel::parent(const QModelIndex &index) const
{
    if (!index.isValid())
        return QModelIndex();

    AbstractTreeItem *childItem     = getItem(index);
    AbstractTreeItem *parentItem    = childItem->parent();

    if (parentItem == m_rootItem)
        return QModelIndex();

    // Parent not found ? return invalid QModelIndex
    if (!parentItem) {
        qWarning() << "TreeModel::parent" << index << "Parent not found";
        return QModelIndex();
    }

    return parentItem->index();
}

/**
 * @brief TreeModel::removeColumns
 * @param position
 * @param columns
 * @param parent
 * @return
 */
bool TreeModel::removeColumns(int position, int columns, const QModelIndex &parent)
{
    bool success;

    beginRemoveColumns(parent, position, position + columns - 1);
    success = m_rootItem->removeColumns(position, columns);
    endRemoveColumns();

    if (m_rootItem->columnCount() == 0)
        removeRows(0, rowCount());

    return success;
}

/**
 * @brief TreeModel::removeRows
 * @param position
 * @param rows
 * @param parent
 * @return
 */
bool TreeModel::removeRows(int position, int rows, const QModelIndex &parent)
{
    AbstractTreeItem*   parentItem  = getItem(parent);
    bool        success     = true;

    beginRemoveRows(parent, position, position + rows - 1);
    success = parentItem->removeChildren(position, rows);
    endRemoveRows();

    return success;
}

void TreeModel::clear()
{
    if (m_rootItem) {
        beginResetModel();
        m_rootItem->clear();
        endResetModel();
    }
}

/**
 * @return the number of rows under the given parent.
 * When the parent is valid it means that rowCount is returning the number of children of parent.
 */
int TreeModel::rowCount(const QModelIndex &parent) const
{
    int count = 0;
    AbstractTreeItem *parentItem = getItem(parent);

    if (parentItem)
        count = parentItem->childrenCount();

    return count;
}

/**
 * @brief Sets the role data for the item at index to value.
 * The dataChanged() signal is emitted if the data was successfully set.
 * @return true if successful; otherwise returns false.
 */
bool TreeModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    AbstractTreeItem *item = getItem(index);
    bool result = item->setData(value, role);

    if (result) {
        emit dataChanged(index, index);
        emit dataChanged(index, index, QVector<int>() << role);
    }

    return result;
}

/**
 * @brief TreeModel::setHeaderData
 * @param section
 * @param orientation
 * @param value
 * @param role
 * @return
 */
bool TreeModel::setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role)
{
    bool result = m_rootItem->setData(value, role);

    if (result)
        emit headerDataChanged(orientation, section, section);

    return result;
}

/**
 * @brief TreeModel::handleItemChange
 */
void TreeModel::handleItemChange(int role)
{
    AbstractTreeItem*   item    = static_cast<AbstractTreeItem*>(sender());
    QModelIndex         index   = item->index();

    if (index.isValid())
        emit dataChanged(index, index, QVector<int>() << role);

}

}} // END namespace
