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

#ifndef XPOLYGON_H
#define XPOLYGON_H

#include <QQuickPaintedItem>
#include <QPolygon>
#include <QPolygonF>

class XPen : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal width READ width WRITE setWidth NOTIFY penChanged)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY penChanged)
    Q_PROPERTY(bool pixelAligned READ pixelAligned WRITE setPixelAligned NOTIFY penChanged)
public:
    XPen(QObject *parent=0);

    qreal width() const;
    void setWidth(qreal w);

    QColor color() const;
    void setColor(const QColor &c);

    bool pixelAligned() const;
    void setPixelAligned(bool aligned);

    bool isValid() const;

signals:
    void penChanged();

private:
    qreal m_width;
    QColor m_color;
    bool m_aligned : 1;
    bool m_valid : 1;
};

class XPolygon : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QPolygonF polygon READ polygon WRITE setPolygon NOTIFY polygonChanged)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(XPen * border READ border CONSTANT)
public:
    explicit XPolygon(QQuickItem *parent = 0);
    XPolygon(const QPolygon &polygon, QQuickItem *parent = 0);
    XPolygon(const QPolygonF &polygon, QQuickItem *parent = 0);
    ~XPolygon();

    void paint(QPainter *painter);
    bool contains(const QPointF &point) const;

    QPolygonF polygon() const;
    void setPolygon(const QPolygonF &polygon);

    QColor color() const;
    void setColor(const QColor &color);

    XPen * border() const;

signals:
    void polygonChanged(QPolygonF polygon);
    void colorChanged(QColor color);

private:
    QPolygonF m_polygon;
    QColor m_color;
    XPen * m_border;
};

#endif // XPOLYGON_H
