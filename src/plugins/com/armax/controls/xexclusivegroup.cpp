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

#include "xcheckable_p.h"

/**
 * @brief XExclusiveGroup's constructor
 * @param parent parent object
 */
XExclusiveGroup::XExclusiveGroup(QObject *parent)
    : QObject(parent)
{

}

/**
 * @brief Adds the given XCheckablePrivate into the exclusive group in order to manage it
 * @param checkable checkable to be added
 */
void XExclusiveGroup::addCheckable(XCheckablePrivate *checkable)
{
    if (!checkable)
        return;

    m_checkables << checkable;
    connect(checkable, &XCheckablePrivate::checkedChanged, this, &XExclusiveGroup::onCheckedChanged);
    connect(checkable, &XCheckablePrivate::destroyed, this, &XExclusiveGroup::onCheckableDeleted);
}

/**
 * @brief Removes the given XCheckable from the XExclusiveGroup
 * @param checkable XCheckable to be removed
 */
void XExclusiveGroup::removeCheckable(XCheckablePrivate *checkable)
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
    XCheckablePrivate *checkable = static_cast<XCheckablePrivate*>(QObject::sender());

    if (!checkable)
        return;

    if (!checkable->isChecked())
        return;

    foreach (XCheckablePrivate* c, m_checkables)
        if (c != checkable && c->isChecked())
            c->setChecked(false);
}

/**
 * @brief Slot called when a checkable is deleted using deleteLater()
 */
void XExclusiveGroup::onCheckableDeleted()
{
    XCheckablePrivate *checkable = static_cast<XCheckablePrivate*>(QObject::sender());

    if (!checkable)
        return;

    checkable->disconnect(this);
    m_checkables.removeAll(checkable);
}
