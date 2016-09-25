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

#ifndef XREGULARPOLYGON_H
#define XREGULARPOLYGON_H

#include "xpolygon.h"

class XRegularPolygon : public XPolygon
{
    Q_OBJECT
    Q_PROPERTY(uint faces READ faces WRITE setFaces NOTIFY facesChanged)
    Q_PROPERTY(qreal angle READ angle WRITE setAngle NOTIFY angleChanged)
public:
    XRegularPolygon(QQuickItem *parent = 0);

    uint faces() const;
    void setFaces(uint faces);

    qreal angle() const;
    void setAngle(qreal angle);

signals:
    void facesChanged(uint faces);
    void angleChanged(qreal angle);

private slots:
    void updatePolygon();

private:
    uint m_faces;
    qreal m_angle;
};

#endif // XREGULARPOLYGON_H
