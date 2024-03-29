/****************************************************************************
**
** Copyright (C) 2014 Thomas COIN
** Contact: esvcorp@gmail.com
**
** This file is part of the QtArmax library.
** QtArmax is free software; you can redistribute it and/or
** modify it under the terms of the GNU Library General Public
** License as published by the Free Software Foundation; either
** version 2 of the License, or (at your option) any later version.
**
** QtArmax is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
** Library General Public License for more details.
**
** You should have received a copy of the GNU Library General Public
** License along with libiberty; see the file COPYING.LIB.  If
** not, write to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
** Boston, MA 02110-1301, USA.
**
****************************************************************************/

#ifndef XEXCLUSIVEGROUP_H
#define XEXCLUSIVEGROUP_H

#include <QObject>


class XCheckable;

/**
 * @brief XExclusiveGroup provides a way to declare several
 * checkable controls as mutually exclusive
 */
class XExclusiveGroup : public QObject
{
    Q_OBJECT
public:
    explicit XExclusiveGroup(QObject *parent = Q_NULLPTR);

public slots:
    void addCheckable(XCheckable *checkable);
    void removeCheckable(XCheckable *checkable);

private slots:
    void onCheckedChanged();
    void onCheckableDeleted();

private:
    QList<XCheckable*> m_checkables;
};

#endif // XEXCLUSIVEGROUP_H
