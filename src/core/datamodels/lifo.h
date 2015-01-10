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

#ifndef LIFO_H
#define LIFO_H

#include <QObject>
#include "abstractqueue.h"

namespace Armax {
namespace Datamodels {

class Lifo : public AbstractQueue
{
    Q_OBJECT

public :
                        Lifo        (QObject * parent = 0);
    explicit            Lifo        (AbstractListItem * prototype, int size, QObject * parent = 0);
                        ~Lifo       ();

    bool                enqueue     (AbstractListItem* item);
    bool                enqueue     (QList<AbstractListItem*> items, int &enquededNumber);
    AbstractListItem*   dequeue     ();

signals:
    /**
     * @brief Signal emmited the the Fifo is full
     * @sa isFull()
     */
    void                lifoFull    ();
    void                lifoEmpty   ();
    void                sizeChanged ();
    
};

}} // END namespace Armax::Datamodels

#endif // LIFO_H
