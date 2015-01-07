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
