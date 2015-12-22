#ifndef NWSORTFILTERPROXYMODEL_H
#define NWSORTFILTERPROXYMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>

namespace Armax {
namespace Datamodels {

/**
 * @brief The SortFilterProxyModel class provides support for sorting
 * and filtering data passed between another model and a view.
 *
 * SortFilterProxyModel can be used for sorting items, filtering out items, or both.
 * The model transforms the structure of a source model by mapping the model indexes
 * it supplies to new indexes, corresponding to different locations, for views to use.
 * This approach allows a given source model to be restructured as far as views are concerned
 * without requiring any transformations on the underlying data,
 * and without duplicating the data in memory.
 */
class SortFilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QString                      filterFixedString   READ filterFixedString  WRITE setFilterFixedString NOTIFY filterFixedStringChanged)
    Q_PROPERTY(int                          sortRole            READ sortRole           WRITE setSortRole)

public:
    explicit    SortFilterProxyModel        (QObject *parent = 0);

//    void        setSourceModel              (QAbstractItemModel *sourceModel);
    void        setSortRole                 (int role);
    QString     filterFixedString           () const { return filterRegExp().pattern(); }

public slots:
    int         indexToSource               (const int proxyIndex) const;
    void        emitLayoutChangedSignal     () { emit layoutChanged(); }

private slots:
    void        onSourceRowsAboutToBeMoved  (const QModelIndex&,int,int,const QModelIndex&,int);
    void        onSourceRowsMoved           (const QModelIndex&,int,int,const QModelIndex&,int);
    void        onSourceRowsInserted        (const QModelIndex& sourceParent, int sourceFirst, int sourceLast);

signals:
    void        filterFixedStringChanged    ();    /**< Dummy signal for filterFixedString property */
};

}}  // END namespace

#endif // NWSORTFILTERPROXYMODEL_H
