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

#include "fifo.h"

namespace Armax {
namespace Datamodels {

/**
 * @brief FIFO's constructor
 * @param parent : the parent object
 */
Fifo::Fifo(QObject *parent) : AbstractQueue(parent) {}

/**
 * @brief FIFO's constructor
 * @param size : the FIFO's size
 * @param parent : the parent object
 */
Fifo::Fifo(AbstractListItem * prototype, int size, QObject *parent) : AbstractQueue(prototype, size, parent) {}

/**
 * @brief FIFO's destructor
 */
Fifo::~Fifo()
{

}

/**
 * @brief Enqueues an item in the FIFO
 * @param item : the item to be enqueued
 * @return true if succeded, false else.
 */
bool Fifo::enqueue(AbstractListItem *item)
{
    if(isFull()) { return false; }

    if(!item || item == NULL) { return false; }

    m_queue.prepend(item);

    if(isFull()) { emit queueFull(); }

    return true;
}

/**
 * @brief Fifo::enqueue
 * @param items
 * @param enquededNumber
 * @return
 */
bool Fifo::enqueue(QList<AbstractListItem *> items, int &enquededNumber)
{
    Q_UNUSED(items)
    Q_UNUSED(enquededNumber)
    return false;
}

/**
 * @brief Dequeues the FIFO by returning the earliest item enqueued
 * @return
 */
AbstractListItem * Fifo::dequeue()
{
    AbstractListItem * ret = NULL;
    if(!m_queue.isEmpty()) {
        ret = m_queue.takeFirst();
        if(m_queue.isEmpty()) {
            emit queueEmpty();
        }
    }

    return ret;
}

}} // END namespace Armax::Datamodels
