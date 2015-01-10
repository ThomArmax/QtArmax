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

#include "abstractqueue.h"

namespace Armax {
namespace Datamodels {

/**
 * @brief AbstractQueue::AbstractQueue
 * @param parent
 */
AbstractQueue::AbstractQueue(QObject *parent) : QObject(parent) { m_proto = NULL; }

/**
 * @brief AbstractQueue::AbstractQueue
 * @param prototype
 * @param size
 * @param parent
 */
AbstractQueue::AbstractQueue(AbstractListItem *prototype, int size, QObject *parent) : QObject(parent)
{
    m_size = size;
    m_proto = prototype;
}

/**
 * @brief Resizes the AbstractQueue to the given size
 * @param newSize : the new AbstractQueue's size
 * @param rule
 * @return true if succedded, false else
 */
bool AbstractQueue::resize(int newSize, ResizeRule rule)
{
    Q_UNUSED(newSize)
    Q_UNUSED(rule)
    return false;
}

/**
 * @brief AbstractQueue::count
 * @return
 */
int AbstractQueue::count() const
{
    return m_queue.size();
}

/**
 * @brief Returns true if the AbstractQueue contains no items; otherwise returns false.
 * @return true if the AbstractQueue contains no items; otherwise returns false.
 */
bool AbstractQueue::isEmpty() const
{
    return m_queue.isEmpty();
}

/**
 * @brief Returns true if the AbstractQueue is full; otherwise returns false.
 * @return true if the AbstractQueue is full; otherwise returns false.
 */
bool AbstractQueue::isFull() const
{
    if(m_size > m_queue.size())
    {
        return false;
    }
    return true;
}

/**
 * @brief Returns the AbstractQueue as a QList
 * @return the QList containing the AbstractQueue's items
 */
QList<AbstractListItem*> AbstractQueue::toList()
{
    return m_queue;
}

/**
 * @brief Clears the AbstractQueue by deleting all its items
 */
void AbstractQueue::clear()
{
    qDeleteAll(m_queue);
    m_queue.clear();
}

/********************* SETTERS *********************/

/**
 * @brief Set the AbstractQueue's size.
 * Emits the signal sizeChanged() is the setted size if different
 * of the previous one
 * @param size : the new AbstractQueue's size
 * @return true if succedded, false else.
 * @sa getSize()
 */
bool AbstractQueue::setSize(int size)
{
    if(m_size != size)
    {
        m_size = size;
        emit sizeChanged();
        return true;
    }
    return false;
}

/********************* GETTERS *********************/

/**
 * @brief Returns the AbstractQueue's size
 * @return the AbstractQueue's size
 * @sa setSize(int size)
 */
int AbstractQueue::getSize() const
{
    return m_size;
}

}} // END namespace Armax::Datamodels
