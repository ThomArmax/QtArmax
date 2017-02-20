/****************************************************************************
**
** Copyright (C) 2017 Thomas COIN
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

#include "xexclusivegroup.h"

#include "xcheckable.h"

/**
 * @brief XExclusiveGroup's constructor
 * @param parent parent object
 */
XExclusiveGroup::XExclusiveGroup(QObject *parent)
    : QObject(parent)
{

}

/**
 * @brief Adds the given XCheckable into the exclusive group in order to manage it
 * @param checkable checkable to be added
 */
void XExclusiveGroup::addCheckable(XCheckable *checkable)
{
    if (!checkable)
        return;

    m_checkables << checkable;
    connect(checkable, &XCheckable::checkedChanged, this, &XExclusiveGroup::onCheckedChanged);
    connect(checkable, &XCheckable::destroyed, this, &XExclusiveGroup::onCheckableDeleted);
}

/**
 * @brief Removes the given XCheckable from the XExclusiveGroup
 * @param checkable XCheckable to be removed
 */
void XExclusiveGroup::removeCheckable(XCheckable *checkable)
{
    if (!m_checkables.contains(checkable))
        return;

    checkable->disconnect(this);
    m_checkables.removeAll(checkable);
}

/**
 * @brief Updates the checkable checked property. This slots is called each time a checked
 * state changed from one on the manedged checkables.
 */
void XExclusiveGroup::onCheckedChanged()
{
    XCheckable *checkable = static_cast<XCheckable*>(QObject::sender());

    if (!checkable)
        return;

    if (!checkable->isChecked())
        return;

    foreach (XCheckable* c, m_checkables)
        if (c != checkable && c->isChecked())
            c->setChecked(false);
}

/**
 * @brief Slot called when a checkable is deleted using deleteLater()
 */
void XExclusiveGroup::onCheckableDeleted()
{
    XCheckable *checkable = static_cast<XCheckable*>(QObject::sender());

    if (!checkable)
        return;

    checkable->disconnect(this);
    m_checkables.removeAll(checkable);
}
