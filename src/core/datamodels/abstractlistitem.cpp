#include "abstractlistitem.h"

/**
 * @brief AbstractListItem contructor
 * @param parent : AbstractListItem's parent object
 */
AbstractListItem::AbstractListItem(QObject *parent) :
    QObject         (parent),
    m_isSelected    (false),
    m_valueChanged  (false)
{
    setIsSelected(false);
}

/**
 * @brief AbstractListItem destructor
 */
AbstractListItem::~AbstractListItem()
{

}

/**
 * @brief Creates the item from the given map containing its properties
 * @note The map's key MUST be the roles' names
 * @param map
 * @return true if succedded, false otherwise
 */
bool AbstractListItem::fromMap(const QVariantMap map)
{
    QMapIterator<QString, QVariant> i(map);
    QHash<int, QByteArray>          roles(roleNames());
    QHashIterator<int, QByteArray>  r(roles);
    QStringList                     rolesNamesLists;
    bool                            bRet = true;

    foreach(QByteArray ba, roles)
    {
        rolesNamesLists << QString(ba);
    }

    foreach(QString key, map.keys())
    {
        if(!rolesNamesLists.contains(key))
        {
            return false;
        }
    }

    while(i.hasNext())
    {
        int role = -1;
        i.next();
        r.toFront();
        while(r.hasNext())
        {
            r.next();
            if(QString(r.value()) == i.key())
            {
                role = r.key();
                break;
            }
        }
        bRet &= setData(i.value(), role);
    }
    return bRet;
}

/**
 * @brief Returns true if other is equal to this AbstractListItem; otherwise returns false.
 * Two AbstractListItem are considered equal if they contain the roles, and if the data for each roles are equal.
 * @param other
 * @return true if other is equal to this AbstractListItem; otherwise returns false.
 */
bool AbstractListItem::operator ==(AbstractListItem * other) const
{
   QHash<int, QByteArray> roles = other->roleNames();
   if(roles != roleNames())
       return false;

   foreach(int role, roles.keys())
   {
       if(data(role) != other->data(role))
           return false;
   }
   return true;
}

/**
 * @brief Returns true if other is not equal to this AbstractListItem; otherwise returns false.
 * Two AbstractListItem are not considered equal if they does not contain the roles, and if at least one data for each roles is not equal.
 * @param other
 * @return true if other is not equal to this AbstractListItem; otherwise returns false.
 */
bool AbstractListItem::operator !=(AbstractListItem * other) const
{
    QHash<int, QByteArray> roles = other->roleNames();
    if(roles != roleNames())
        return true;

    foreach(int role, roles.keys())
    {
        if(data(role) == other->data(role))
            return true;
    }
    return false;
}

/**
 * @brief Returns true if other is equal to this AbstractListItem; otherwise returns false.
 * Two AbstractListItem are considered equal if they contain the roles, and if the data for each roles are equal.
 * @param other
 * @return true if other is equal to this AbstractListItem; otherwise returns false.
 */
bool AbstractListItem::equals(AbstractListItem *other) const
{
    return this->operator ==(other);
}

/**
 * @brief Returns the item as a QVariantMap. Each item's role is inserted in the map with it's corresponding value;
 * @return the item as a QVariantMap. Each item's role is inserted in the map with it's corresponding value.
 */
QVariantMap AbstractListItem::toMap() const
{
    QVariantMap map;
    QHashIterator<int, QByteArray> i(roleNames());
    while(i.hasNext())
    {
        i.next();
        map.insert(QString(i.value()), data(i.key()));
    }
    return map;
}

/**
 * @return the item as a string. Usefull for debug.
 */
QString AbstractListItem::toString() const
{
    return QString();
}

/**
 * @brief Returns the item as a JSON string.
 * @return the item as a JSON string.
 */
/*QString AbstractListItem::toJSON() const
{
    return JSON::Instance().serialize(toMap());
    return QString();
}*/

/**
 * @brief Set which beverage is selected from user
 */
void AbstractListItem::setIsSelected(bool newSelected)
{
    if(m_isSelected != newSelected)
    {
        m_isSelected = newSelected;
        emit isSelectedChanged(m_isSelected);
        emit dataChanged();
    }
}

/**
 * @brief AbstractListItem::valuesHasChanged
 * @return
 */
bool AbstractListItem::valuesHasChanged() const
{
    return m_valueChanged;
}
