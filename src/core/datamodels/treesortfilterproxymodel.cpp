#include "treesortfilterproxymodel.h"
#include <QDebug>

namespace Armax {
namespace Datamodels {

TreeSortFilterProxyModel::TreeSortFilterProxyModel(QObject *parent) :
    SortFilterProxyModel(parent)
{
}

//bool TreeSortFilterProxyModel::lessThan(const QModelIndex &left, const QModelIndex &right) const
//Q_DECL_OVERRIDE
//{
//    QVariant leftData = sourceModel()->data(mapToSource(left));
//    QVariant rightData = sourceModel()->data(mapToSource(right));

//    qDebug() << leftData << rightData;
//    return SortFilterProxyModel::lessThan(left, right);
//}

//bool TreeSortFilterProxyModel::canFetchMore(const QModelIndex &parent) const
//{
//    return sourceModel()->canFetchMore(parent);
////    return QAbstractProxyModel::canFetchMore(mapFromSource(parent));
//}

QModelIndex TreeSortFilterProxyModel::indexToSource(const QModelIndex &proxyIndex)
{
    return mapToSource(proxyIndex);
}

QModelIndex TreeSortFilterProxyModel::indexFromSource(const QModelIndex &sourceIndex)
{
    QModelIndex proxyIndex = mapFromSource(sourceIndex);
    return proxyIndex;
}

}} // END namespace
