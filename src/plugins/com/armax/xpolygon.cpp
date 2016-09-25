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

#include "xpolygon.h"

#include <QPainter>
#include <QDebug>

/*******************************************************************
 * XPen
 *******************************************************************/

XPen::XPen(QObject *parent)
    : QObject(parent)
    , m_width(1)
    , m_color("#000000")
    , m_aligned(true)
    , m_valid(false)
{
}

qreal XPen::width() const
{
    return m_width;
}

void XPen::setWidth(qreal w)
{
    if (m_width == w && m_valid)
        return;

    m_width = w;
    m_valid = m_color.alpha() && (qRound(m_width) >= 1 || (!m_aligned && m_width > 0));
    emit penChanged();
}

QColor XPen::color() const
{
    return m_color;
}

void XPen::setColor(const QColor &c)
{
    m_color = c;
    m_valid = m_color.alpha() && (qRound(m_width) >= 1 || (!m_aligned && m_width > 0));
    emit penChanged();
}

bool XPen::pixelAligned() const
{
    return m_aligned;
}

void XPen::setPixelAligned(bool aligned)
{
    if (aligned == m_aligned)
        return;
    m_aligned = aligned;
    m_valid = m_color.alpha() && (qRound(m_width) >= 1 || (!m_aligned && m_width > 0));
    emit penChanged();
}

bool XPen::isValid() const
{
    return m_valid;
}

/*******************************************************************
 * XPolygon
 *******************************************************************/

XPolygon::XPolygon(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_color(Qt::black)
    , m_border(new XPen(this))
{
    setFlag(QQuickItem::ItemHasContents);
    connect(m_border, SIGNAL(penChanged()), this, SLOT(update()));
}

XPolygon::XPolygon(const QPolygon &polygon, QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_polygon(polygon)
    , m_color(Qt::black)
    , m_border(new XPen(this))
{
    setFlag(QQuickItem::ItemHasContents);
    connect(m_border, SIGNAL(penChanged()), this, SLOT(update()));
}

XPolygon::XPolygon(const QPolygonF &polygon, QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_polygon(polygon)
    , m_color(Qt::black)
    , m_border(new XPen(this))
{
    setFlag(QQuickItem::ItemHasContents);
    connect(m_border, SIGNAL(penChanged()), this, SLOT(update()));
}

XPolygon::~XPolygon()
{

}

QColor XPolygon::color() const
{
    return m_color;
}

void XPolygon::setColor(const QColor &color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged(color);
}

XPen * XPolygon::border() const
{
    return m_border;
}

QPolygonF XPolygon::polygon() const
{
    return m_polygon;
}

void XPolygon::setPolygon(const QPolygonF &polygon)
{
    if (m_polygon == polygon)
        return;

    m_polygon = polygon;
    emit polygonChanged(polygon);
    update();
}

void XPolygon::paint(QPainter *painter)
{
    QPainterPath path;
    QPen pen(m_border->color(), m_border->width());

    path.addPolygon(m_polygon);
    path.closeSubpath();

    painter->setRenderHint(QPainter::Antialiasing);
    painter->setClipPath(path);
    painter->setPen(pen);
    painter->fillPath(path, m_color);

    if (m_border->isValid())
        painter->drawPath(path);
}
