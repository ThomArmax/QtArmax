#include "fifo.h"

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
