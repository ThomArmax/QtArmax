#ifndef LISTMODEL_H
#define LISTMODEL_H

#include "abstractlistitem.h"

#include <QAbstractItemModel>
#include <QStringList>
#include <QHash>

/**
 * @brief The ListModel class inherists QAbstractListModel, used to handle objects which inherits AbstractListItem into a view
 * (ListView, GridView ...)
 * @sa AbstractListItem
 */
class ListModel : public QAbstractItemModel
{
    Q_OBJECT
    Q_PROPERTY(int      size            READ rowCount                           NOTIFY rowCountChanged      )
    Q_PROPERTY(int      selectedIndex   READ selectedIndex  WRITE selectIndex   NOTIFY selectedIndexChanged )
    Q_PROPERTY(QObject* selectedObject  READ selectedObject                     NOTIFY selectedItemChanged  )

public:
                        ListModel           (QObject * parent = 0);
    explicit            ListModel           (AbstractListItem* prototype, QObject* parent = 0);
    ~                   ListModel           ();

    // QAbstractListModel
    int                     rowCount            (const QModelIndex &parent = QModelIndex()) const;
    int                     columnCount         (const QModelIndex &parent = QModelIndex()) const;
    QVariant                data                (const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool                    setData             (const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    bool                    removeRows          (const int &row, const int &count, const QModelIndex &parent = QModelIndex());
    QModelIndexList         match               (const QModelIndex &start, int role, const QVariant &value, int hits=1, Qt::MatchFlags flags = Qt::MatchStartsWith | Qt::MatchWrap) const;
    QHash<int, QByteArray>  roleNames           () const { return m_rolesNames; }
    QModelIndex             index               (int row) const;
    virtual QModelIndex     index               (int row, int column, const QModelIndex & parent = QModelIndex()) const;
    QModelIndex             parent              (const QModelIndex &child) const;

    // Sizes
    bool                    isEmpty             () const { return m_list.isEmpty(); }
    Q_INVOKABLE int         count               () const { return rowCount(); }
    int                     size                () const { return rowCount(); }

    // Row opperations
    void                    prependRow          (AbstractListItem* item);
    void                    prependRows         (const QList<AbstractListItem *> &items);
    void                    appendRow           (AbstractListItem* item);
    void                    appendRows          (const QList<AbstractListItem *> &items);
    void                    insertRow           (const int &row, AbstractListItem* item);
    bool                    removeRow           (const int &row, const QModelIndex &parent = QModelIndex());
    AbstractListItem*       takeRow             (int row);
    Q_INVOKABLE bool        moveRow             (const int from, const int to);
    bool                    moveRows            (const QModelIndex &sourceParent, int sourceRow, int count, const QModelIndex &destinationParent, int destinationChild);

    // Item getters
    AbstractListItem*       at                  (int row);
    Q_INVOKABLE QObject*    get                 (int index);
    QList
        <AbstractListItem*> items               () { return m_list; }
    QList
        <AbstractListItem*>* itemsRef           () { return &m_list; }

    QModelIndex             indexFromItem       (const AbstractListItem* item) const;

    // Model size
    bool                    setMaxSize          (const int &size);
    int                     maxSize             () const { return m_maxSize; }

    // Cleaning
    void                    clear               ();
    void                    clearNoDelete       ();

    // Items handling
    void                    setHasObjectOwnership(const bool hasOwnership) { m_hasObjectOwnership = hasOwnership; }
    bool                    hasObjectOwnership  () const { return m_hasObjectOwnership; }

    // Item selection
    bool                    selectItem          (AbstractListItem * item);
    AbstractListItem*       selectedItem        ();
    bool                    selectIndex         (const int &row);
    int                     selectedIndex       () const;
    Q_INVOKABLE QObject*    selectedObject      () { return m_list.value(m_selectedIndex, 0); }

    // Tooling
    QString                 toString            () const;
    QString                 toJSON              () const;

    QString                 prototypeClassName  () const { return m_prototype ? m_prototype->metaObject()->className() : ""; }

    template <class T>
    const T &               operator[]          (int i) const { return m_list.at(i); }

    template <class T>
    T &                     operator[]          (int i) { return m_list.at(i); }

public slots:
    QObject*                find                (const QVariant &toFind, const int &role) const;
    void                    resetSelection      ();

signals:
    void                    selectedIndexChanged();     /**< Signal emitted when the selected index changed                 */
    void                    selectedItemChanged ();     /**< Signal emitted when the selected item changed                  */
    void                    rowCountChanged     ();     /**< Signal emitted when the number of rows in the model changed    */
    void                    rowsMoved           (int from, int to);

private slots:
    void                    handleItemChange    (int role = Qt::DisplayRole);

protected :
    AbstractListItem*           m_prototype;        /**< The model's items' prototype                                   */
    QList<AbstractListItem *>   m_list;             /**< The list containing all model's items                          */
    int                         m_maxSize;          /**< The model's maximum size                                       */
    int                         m_selectedIndex;    /**< The currently selected index                                   */
    QHash<int, QByteArray>      m_rolesNames;       /**< The model's roles                                              */
    bool                        m_hasObjectOwnership;
    
};

#endif // LISTMODEL_H
