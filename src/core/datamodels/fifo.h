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

#ifndef FIFO_H
#define FIFO_H

#include "abstractqueue.h"

namespace Armax {
namespace Datamodels {

class AbstractListItem;

/**
 * @brief The Fifo class
 */
class Fifo : public AbstractQueue {

public :

    Fifo(QObject * parent = 0);
    Fifo(AbstractListItem * prototype, int size, QObject * parent = 0);
    ~Fifo();

    bool                enqueue (AbstractListItem* item);
    bool                enqueue (QList<AbstractListItem*> items, int &enquededNumber);
    AbstractListItem*   dequeue ();

signals:

public slots:


};

}} // END namespace Armax::Datamodels

#endif // FIFO_H
