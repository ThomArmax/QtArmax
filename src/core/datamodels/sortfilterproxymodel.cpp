#include "sortfilterproxymodel.h"

namespace Armax {
namespace Datamodels {

SortFilterProxyModel::SortFilterProxyModel(QObject *parent) : QSortFilterProxyModel(parent)
{

}

void SortFilterProxyModel::setSortRole(int role)
{
    QSortFilterProxyModel::setSortRole(role);
    sort(0);
}

//void SortFilterProxyModel::setSourceModel(QAbstractItemModel *newSourceModel)
//{
////    QSortFilterProxyModel::setSourceModel(newSourceModel);
//    if (sourceModel())
//        sourceModel()->disconnect(this);

//    QSortFilterProxyModel::setSourceModel(newSourceModel);

//    connect(sourceModel(), SIGNAL(rowsAboutToBeMoved(QModelIndex,int,int,QModelIndex,int)), this,SLOT(onSourceRowsAboutToBeMoved(QModelIndex,int,int,QModelIndex,int)));
//    connect(sourceModel(), SIGNAL(rowsMoved(QModelIndex,int,int,QModelIndex,int)), this, SLOT(onSourceRowsMoved(QModelIndex,int,int,QModelIndex,int)));
////    connect(sourceModel(), SIGNAL(rowsInserted(QModelIndex,int,int)), this, SLOT(onSourceRowsInserted(QModelIndex,int,int)));
//    connect(sourceModel(), SIGNAL(layoutChanged()), this, SLOT(emitLayoutChangedSignal()));
//}

int SortFilterProxyModel::indexToSource(const int proxyIndex) const
{
    return mapToSource(index(proxyIndex, 0)).row();
}

void SortFilterProxyModel::onSourceRowsInserted(const QModelIndex &sourceParent, int /*sourceFirst*/, int /*sourceLast*/)
{
    QModelIndex proxyParent = mapFromSource(sourceParent);
}

void SortFilterProxyModel::onSourceRowsAboutToBeMoved(const QModelIndex &sourceParent, int sourceStart , int sourceEnd, const QModelIndex &destParent, int dest)
{
    Q_UNUSED(sourceParent)
    Q_UNUSED(destParent)
    Q_UNUSED(sourceStart)
    Q_UNUSED(sourceEnd)
    Q_UNUSED(destParent)
    Q_UNUSED(dest)

//    QModelIndex mappedParent        = mapFromSource(sourceParent);
//    QModelIndex mappedSourceStart   = mapFromSource(sourceModel()->index(sourceStart, 0, sourceParent));
//    QModelIndex mappedSourceEnd     = mapFromSource(sourceModel()->index(sourceEnd, 0, sourceParent));
//    QModelIndex mappedDestParent    = mapFromSource(destParent);

//    int mappedStart = mappedSourceStart.row();
//    int mappedEnd   = mappedSourceEnd.row();
//    int mappedDest  = dest;

//    beginMoveRows(mappedParent, mappedStart, mappedEnd, mappedDestParent, mappedDest);
}

void SortFilterProxyModel::onSourceRowsMoved( const QModelIndex &sourceParent, int sourceStart, int sourceEnd, const QModelIndex &destParent, int dest)
{
    Q_UNUSED(sourceParent)
    Q_UNUSED(destParent)
    Q_UNUSED(sourceStart)
    Q_UNUSED(sourceEnd)
    Q_UNUSED(destParent)
    Q_UNUSED(dest)

//    QModelIndex mappedParent        = mapFromSource(sourceParent);
//    QModelIndex mappedSourceStart   = mapFromSource(sourceModel()->index(sourceStart, 0, sourceParent));
//    QModelIndex mappedSourceEnd     = mapFromSource(sourceModel()->index(sourceEnd, 0, sourceParent));
//    QModelIndex mappedDestParent    = mapFromSource(destParent);

//    int mappedStart = mappedSourceStart.row();
//    int mappedEnd   = mappedSourceEnd.row();
//    int mappedDest  = dest;

//    beginMoveRows(mappedParent, mappedStart, mappedEnd, mappedDestParent, mappedDest);

//    endMoveRows();
}

}} // END namespace
