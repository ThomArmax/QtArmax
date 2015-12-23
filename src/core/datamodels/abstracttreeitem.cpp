#include "abstracttreeitem.h"
#include "abstractlistitem.h"

#include <QDebug>

namespace Armax {
namespace Datamodels {

/**
 * @brief AbstractTreeItem contructor
 * @param parent : parent AbstractTreeItem
 */
AbstractTreeItem::AbstractTreeItem(AbstractTreeItem *parent) :
    AbstractListItem(parent),
    m_pParentItem(parent)
{

}

/**
 * @brief Frees allocated resources
 */
AbstractTreeItem::~AbstractTreeItem()
{
    qDeleteAll(m_childItems);
    m_childItems.clear();
}

/**
 * @brief Returns the parent's index
 * @return the parent's index; or invalid QModelIndex if not found.
 */
QModelIndex AbstractTreeItem::parentIndex() const
{
    if (m_pParentItem)
        return m_pParentItem->index();

    return QModelIndex();
}

/**
 * @return the child at the given number or 0 if not found
 */
AbstractTreeItem* AbstractTreeItem::child(int number)
{
    return m_childItems.value(number, NULL);
}

QList<AbstractTreeItem*> AbstractTreeItem::findChildren(const QVariant &data, const int role)
{
    QList<AbstractTreeItem*> children;
    foreach (AbstractTreeItem *child, m_childItems) {
        if (child && child->data(role) == data)
            children << child;
    }
    return children;
}

/**
 * @return children count
 */
int AbstractTreeItem::childrenCount() const
{
    return m_childItems.count();
}

/**
 * @return parent item
 */
AbstractTreeItem* AbstractTreeItem::parent() const
{
    return m_pParentItem;
}

/**
 * @brief Sets the item's index in the model
 * @return true if succeeded, false otherwise
 */
bool AbstractTreeItem::setIndex(const QModelIndex &index)
{
    if (m_index != index) {
        m_index = index;
        return true;
    }
    return false;
}

/**
 * @brief Sets item's hierarchy
 * dataChanged() signal is emitted is succeeded.
 * @param hierarchy
 * @return true if succeeded, false otherwise
 */
bool AbstractTreeItem::setHierarchy(const QString &)
{
//    if (m_hierarchy != hierarchy)
//    {
//        m_hierarchy = hierarchy;
//        emit hierarchyChanged();
//        emit dataChanged(Setting::HierarchyRole);
//        return true;
//    }
    return false;
}

/**
 * @return item's hierarchy
 */
QString AbstractTreeItem::hierarchy() const
{
    return m_hierarchy;
}

/**
 * @return Item's column count
 */
int AbstractTreeItem::columnCount()
{
    return 0;
    //return m_itemData.count();
}

/**
 * @brief AbstractTreeItem::insertColumns
 * @param position
 * @param columns
 * @return
 */
bool AbstractTreeItem::insertColumns(int position, int columns)
{
    Q_UNUSED(position)
    Q_UNUSED(columns)

    return false;

//    if (position < 0 || position > m_itemData.size())
//    {
//        return false;
//    }

//    for (int column = 0; column < columns; ++column)
//    {
//        m_itemData.insert(position, QVariant());
//    }

//    foreach (AbstractTreeItem *child, m_childItems)
//    {
//        child->insertColumns(position, columns);
//    }

//    return true;
}

/**
 * @brief AbstractTreeItem::insertChildren
 * @param position
 * @param count
 * @param columns
 * @return
 */
bool AbstractTreeItem::insertChildren(int position, int count, int columns)
{
    Q_UNUSED(position);
    Q_UNUSED(count);
    Q_UNUSED(columns);
    return false;
}

/**
 * @brief Inserts the given item at position
 * @param item : the item to be inserted
 * @param position : the item position
 * @return
 */
bool AbstractTreeItem::insertChild(AbstractTreeItem *item, int position)
{
    QString sHierarchy = hierarchy();
    if (position < 0 || position > m_childItems.size()) {
        qWarning() << Q_FUNC_INFO << "Failed at" << position;
        return false;
    }
    //qDebug() << Q_FUNC_INFO << " sHierarchy:" << sHierarchy << " position:" << position;
    if (!sHierarchy.isEmpty())
        sHierarchy.append(".");
    sHierarchy.append(QString::number(position+1));
    item->setHierarchy(sHierarchy);

    //qDebug() << Q_FUNC_INFO << " sHierarchy set to:" << sHierarchy;

    m_childItems.insert(position, item);

    return true;
}

/**
 * @brief Removes 'count' children from position
 * @param position
 * @param count
 * @return true if succeeded, false otherwise
 */
bool AbstractTreeItem::removeChildren(int position, int count)
{
    if (position < 0 || position + count > m_childItems.size())
        return false;

    for (int row = 0; row < count; ++row)
        m_childItems.takeAt(position)->deleteLater();

    return true;
}

/**
 * @brief AbstractTreeItem::removeColumns
 * @param position
 * @param columns
 * @return
 */
bool AbstractTreeItem::removeColumns(int position, int columns)
{
    Q_UNUSED(position)
    Q_UNUSED(columns)

    return false;
}

/**
 * @brief Clears the item by removing all children
 */
void AbstractTreeItem::clear()
{
    foreach (AbstractTreeItem * item, m_childItems)
        item->deleteLater();

    m_childItems.clear();
}

/**
 * @return item's children
 */
QList<AbstractTreeItem*> AbstractTreeItem::children() const
{
    return m_childItems;
}

/**
 * @brief Returns the list of all attributes and their name as a string. Used in QML side
 */
QHash<int,QByteArray> AbstractTreeItem::roleNames() const
{
    QHash<int,QByteArray> roles;
    roles[NodeTypeRole      ] = "nodeType";
    roles[ParentIndexRole   ] = "parentIndex";
    roles[ItemIndexRole     ] = "itemIndex";
    roles[HierarchyRole     ] = "hierarchy";

    return roles;
}

/**
 * @brief Generic getter of item data
 * @param role attribute to retrieve
 * @return attribute value
 */
QVariant AbstractTreeItem::data(int role) const
{
    switch (role) {
    case NodeTypeRole   : return nodeType   ();
    case ItemIndexRole  : return index      ();
    case ParentIndexRole: return parentIndex();
    case HierarchyRole  : return hierarchy  ();
    default:              return QVariant();
    }
}

/**
 * @brief Generic setter of item data
 * @param role attribute to set
 * @return true if successful, false otherwise
 */
bool AbstractTreeItem::setData(const QVariant &value, int role)
{
    switch (role) {
    case HierarchyRole  : return setHierarchy(value.toString());
    default             : return false;
    }
}

}} // END namespace
