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

#include "xregularpolygon.h"

#include <QtMath>

XRegularPolygon::XRegularPolygon(QQuickItem *parent)
    : XPolygon(parent)
    , m_faces(3)
    , m_angle(0)
{
    connect(this, SIGNAL(widthChanged()), this, SLOT(updatePolygon()));
    connect(this, SIGNAL(heightChanged()), this, SLOT(updatePolygon()));
    connect(this, SIGNAL(implicitHeightChanged()), this, SLOT(updatePolygon()));
    connect(this, SIGNAL(implicitWidthChanged()), this, SLOT(updatePolygon()));
}

uint XRegularPolygon::faces() const
{
    return m_faces;
}

void XRegularPolygon::setFaces(uint faces)
{
    if (m_faces == faces)
        return;

    if (m_faces < 3)
        return;

    m_faces = faces;

    updatePolygon();

    emit facesChanged(faces);
}

qreal XRegularPolygon::angle() const
{
    return m_angle;
}

void XRegularPolygon::setAngle(qreal angle)
{
    if (m_angle == angle)
        return;

    m_angle = angle;
    emit angleChanged(angle);
    updatePolygon();
}

void XRegularPolygon::updatePolygon()
{
    QPolygonF p;
    qreal radius = qMax<qreal>(width(), height()) / 2;
    qreal angleRad = qDegreesToRadians(m_angle);

    if (m_faces < 3)
        return;

    for (uint i = 0; i < m_faces; i++) {
        qreal val = 2 * M_PI * i / m_faces + angleRad;
        qreal x = radius * cos(val) + radius;
        qreal y = radius * sin(val) + radius;
        QPointF point(x, y);
        p.append(point);
    }
    setPolygon(p);
}
