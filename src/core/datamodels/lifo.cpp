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

#include "lifo.h"

namespace Armax {
namespace Datamodels {

/**
 * @brief Lifo::AbstractListItem
 * @param parent
 */
Lifo::Lifo(QObject *parent) : AbstractQueue(parent) {
    m_size  = -1;
    m_proto = NULL;
}

/**
 * @brief Lifo::AbstractListItem
 * @param prototype
 * @param size
 * @param parent
 */
Lifo::Lifo(AbstractListItem *prototype, int size, QObject *parent) : AbstractQueue(prototype, size, parent) { }

/**
 * @brief Lifo::~Lifo
 */
Lifo::~Lifo() {

}

/**
 * @brief Lifo::enqueue
 * @param item
 * @return
 */
bool Lifo::enqueue(AbstractListItem *item) {
    if(isFull()) { return false; }

    if(!item || item == NULL) { return false; }

    m_queue.prepend(item);

    if(isFull()) { emit lifoFull(); }

    return true;
}

/**
 * @brief Lifo::enqueue
 * @param items
 * @param enquededNumber
 * @return
 */
bool Lifo::enqueue(QList<AbstractListItem *> items, int &enquededNumber) {
    Q_UNUSED(items)
    Q_UNUSED(enquededNumber)
    return false;
}

/**
 * @brief Lifo::dequeue
 * @return
 */
AbstractListItem * Lifo::dequeue() {
    AbstractListItem * ret = NULL;
    if(!m_queue.isEmpty()) {
        ret = m_queue.takeFirst();
        if(m_queue.isEmpty()) {
            emit lifoEmpty();
        }
    }

    return ret;
}

}} // END namespace Armax::Datamodels
