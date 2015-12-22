#ifndef TREESORTFILTERPROXYMODEL_H
#define TREESORTFILTERPROXYMODEL_H

#include "sortfilterproxymodel.h"

namespace Armax {
namespace Datamodels {

class TreeSortFilterProxyModel : public SortFilterProxyModel
{
    Q_OBJECT
public:
    explicit TreeSortFilterProxyModel(QObject *parent = 0);
//    bool canFetchMore(const QModelIndex &parent) const;
//    bool lessThan(const QModelIndex &left, const QModelIndex &right) const;

public slots:
    QModelIndex indexToSource(const QModelIndex &proxyIndex);
    QModelIndex indexFromSource(const QModelIndex &sourceIndex);

};

}} // END namespace

#endif // TREESORTFILTERPROXYMODEL_H
