#ifndef ABSTRACTTREEITEM_H
#define ABSTRACTTREEITEM_H

#include "abstractlistitem.h"

#include <QModelIndex>

namespace Armax {
namespace Datamodels {

/**
 * @brief The AbstractTreeItem class (inherits AbstractListItem),
 * provides the default implementation of objects to be used with the TreeModel class
 */
class AbstractTreeItem : public AbstractListItem
{
    Q_OBJECT
    Q_PROPERTY(QModelIndex  index       READ index                          NOTIFY indexChanged)
    Q_PROPERTY(QModelIndex  parentIndex READ parentIndex                    CONSTANT)
    Q_PROPERTY(int          nodeType    READ nodeType                       NOTIFY nodeTypeChanged)
    Q_PROPERTY(QString      hierarchy   READ hierarchy  WRITE setHierarchy  NOTIFY hierarchyChanged)

    int m_nodeType;

public :

    enum Roles {
        NodeTypeRole = Qt::UserRole+1,
        ParentIndexRole,
        ItemIndexRole,
        HierarchyRole
    };

    AbstractTreeItem    (AbstractTreeItem *parent);
    ~AbstractTreeItem   ();

    QVariant                            data                (int role) const Q_DECL_OVERRIDE;
    bool                                setData             (const QVariant& value, int role) Q_DECL_OVERRIDE;
    QHash<int,QByteArray>               roleNames           ()                                  const Q_DECL_OVERRIDE;
    virtual int                         childrenCount       ()                                  const;
    virtual AbstractTreeItem*           parent              ()                                  const;
    virtual QModelIndex                 index               ()                                  const { return m_index; }
    virtual QModelIndex                 parentIndex         ()                                  const;
    virtual bool                        setIndex            (const QModelIndex & index);
    virtual bool                        setHierarchy        (const QString &hierarchy);
    virtual QString                     hierarchy           () const;
    virtual AbstractTreeItem*           child               (int number);
    virtual QList<AbstractTreeItem*>    findChildren        (const QVariant &data, const int role);
    virtual int                         columnCount         ();
    virtual bool                        insertColumns       (int position, int columns);
    virtual bool                        insertChildren      (int position, int count, int columns);
    virtual bool                        insertChild         (AbstractTreeItem* item, int position);
    virtual bool                        removeChildren      (int position, int count);
    virtual bool                        removeColumns       (int position, int columns);
    virtual int                         nodeType            () const = 0;
    virtual void                        clear               ();
    QList<AbstractTreeItem*>            children            () const;

signals :
    void indexChanged();
    void nodeTypeChanged();
    void hierarchyChanged();

protected:
    QModelIndex                         m_index;            /**< Item's index           */
    AbstractTreeItem*                   m_pParentItem;      /**< Parent item            */
    QList<AbstractTreeItem*>            m_childItems;       /**< The list of children   */
    QString                             m_hierarchy;        /**< Item's hierachy        */
};

}} // END namespace


#endif // ABSTRACTTREEITEM_H
