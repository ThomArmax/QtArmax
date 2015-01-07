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
