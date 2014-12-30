#include "lifo.h"

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
