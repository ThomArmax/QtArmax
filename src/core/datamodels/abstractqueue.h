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

#ifndef QUEUE_H
#define QUEUE_H

#include <QObject>

#include "listmodel.h"

namespace Armax {
namespace Datamodels {

/**
 * @brief The AbstractQueue class
 */
class AbstractQueue : public QObject
{
    Q_OBJECT

public :

    /**
     * @brief The ResizeRule enum
     */
    enum ResizeRule {
        FromFront   = 0,    /**< */
        FromBack    = 1     /**< */
    };

                AbstractQueue(QObject * parent = 0);
    explicit    AbstractQueue(AbstractListItem * prototype, int size, QObject * parent = 0);

            int                         count   () const;
            bool                        isEmpty () const;
            bool                        isFull  () const;
    virtual bool                        enqueue (AbstractListItem* item) = 0;
    virtual bool                        enqueue (QList<AbstractListItem*> items, int &enquededNumber) = 0;
    virtual AbstractListItem*           dequeue () = 0;
            bool                        resize  (int newSize, ResizeRule rule);
            void                        clear   ();
            QList<AbstractListItem*>    toList  ();

    /********************* SETTERS *********************/
            bool                        setSize (int size);


    /********************* GETTERS *********************/
            int                         getSize () const;

signals:
            void                        queueFull       ();
            void                        queueEmpty      ();
            void                        itemEnqueded    ();
            void                        itemDequeuded   ();
            void                        sizeChanged     ();

public slots:

protected :
    int                         m_size;     /**< The Queue's size */
    QList<AbstractListItem*>    m_queue;    /**< The QList containing the Queue's items */
    AbstractListItem*           m_proto;
    
};

}} // END namespace Armax::Datamodels

#endif // QUEUE_H
