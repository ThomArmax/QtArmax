#ifndef TREEMODEL_H
#define TREEMODEL_H

#include <QAbstractItemModel>
#include <QModelIndex>
#include <QVariant>
#include <QStringList>

#include "abstracttreeitem.h"

namespace Armax {
namespace Datamodels {
class AbstractTreeItem;

class TreeRoot : public AbstractTreeItem
{
    Q_OBJECT
public :
    TreeRoot() : AbstractTreeItem(NULL) {}
    int nodeType() const { return 0; }
};

/**
 * @brief The TreeModel class is used to handle nested model in a tree.
 * @sa QAbstractItemModel
 */
class TreeModel : public QAbstractItemModel
{
    Q_OBJECT

    Q_PROPERTY(QModelIndex selectedIndex READ selectedIndex WRITE selectIndex NOTIFY selectedIndexChanged)

public:
                            TreeModel       (QObject * parent = 0);
                            TreeModel       (const QStringList &headers, const QString &data, QObject *parent = 0);
                            ~TreeModel      ();

    QVariant                data            (const QModelIndex &index, int role) const;
    QVariant                headerData      (int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray>  roleNames()     const;

    QModelIndex             index           (int row, int column, const QModelIndex &parent = QModelIndex()) const;
    Q_INVOKABLE
    QModelIndex             parent          (const QModelIndex &index) const;

    int                     rowCount        (const QModelIndex &parent = QModelIndex()) const;
    int                     columnCount     (const QModelIndex &parent = QModelIndex()) const;

    Qt::ItemFlags           flags           (const QModelIndex &index) const;
    bool                    setData         (const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    bool                    setHeaderData   (int section, Qt::Orientation orientation, const QVariant &value, int role = Qt::EditRole);

    bool                    insertColumn    (int position, AbstractTreeItem * item, const QModelIndex &parent);
    bool                    insertColumns   (int position, int columns  , const QModelIndex &parent = QModelIndex());
    bool                    removeColumns   (int position, int columns  , const QModelIndex &parent = QModelIndex());
    bool                    insertRows      (int position, int rows     , const QModelIndex &parent = QModelIndex());
    bool                    insertRow       (int position, AbstractTreeItem * item, const QModelIndex &parent = QModelIndex());
    bool                    appendRow       (AbstractTreeItem *item, const QModelIndex &parent = QModelIndex());
    bool                    insertChild     (int position, AbstractTreeItem * child, AbstractTreeItem * parent);
    bool                    appendChild     (AbstractTreeItem * child, AbstractTreeItem * parent);
    bool                    removeRows      (int position, int rows     , const QModelIndex &parent = QModelIndex());

    void                    clear           ();
    AbstractTreeItem*       getItem         (const QModelIndex &index) const;

    QModelIndex             selectedIndex   () const;
    bool                    selectIndex     (const QModelIndex &index);

    AbstractTreeItem*       rootItem        () const { return m_rootItem; } /**< @return the model's root item    */

signals :
    void                    selectedIndexChanged();

public slots :
    QObject*                getObject       (const QModelIndex &index) const;
    bool                    hasChildren     (const QModelIndex &parent) const;
    bool                    isIndexValid    (const QModelIndex &index) const { return index.isValid(); }
    QList<QObject*>         parentsObjects  (const QModelIndex &index);
    int                     parentsCount    (const QModelIndex &index);
    QModelIndex             rootIndex       () const { return createIndex(0,0); }

private slots:
    void                    handleItemChange(int role=Qt::DisplayRole);

protected:
    void                    updateRolesNames(AbstractTreeItem * item);
    AbstractTreeItem*       m_rootItem;
    QHash<int, QByteArray>  m_roleNames;
    QModelIndex             m_selectedIndex;
};

}} // END namespace

Q_DECLARE_METATYPE(QModelIndex)

#endif
