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

#include "xcheckable_p.h"

XCheckablePrivate::XCheckablePrivate(QQuickItem *parent):
    QQuickItem      (parent),
    m_checkable     (true),
    m_hoverEnabled  (false),
    m_pressed       (false),
    m_checked       (false),
    m_hovered       (false)
{
    setAcceptHoverEvents(m_hoverEnabled);
    setAcceptedMouseButtons(Qt::LeftButton);
}

/**
 * @brief Destroys the XCheckablePrivate instance
 */
XCheckablePrivate::~XCheckablePrivate()
{
}

void XCheckablePrivate::mousePressEvent(QMouseEvent *event)
{
    Q_UNUSED(event)
    setHovered(false);
    setPressed(true);
    emit pressed();
}

/**
 * @brief Checkable::mouseReleaseEvent
 * @param event
 * @todo Avoid emitting checked, clicked, pressed and CO if the event is catch outside of the component
 */
void XCheckablePrivate::mouseReleaseEvent(QMouseEvent *event)
{
    Q_UNUSED(event);

    if(m_pressed)
    {
        if(m_checkable)
        {
            setChecked(!isChecked());
        }
        emit clicked();
    }

    setPressed(false);

    if(contains(event->localPos()))
        setHovered(true);

    emit released();
}

void XCheckablePrivate::hoverEnterEvent(QHoverEvent */*event*/)
{
    setHovered( m_hoverEnabled );
}

void XCheckablePrivate::hoverLeaveEvent(QHoverEvent */*event*/)
{
    setHovered(false);
}

void XCheckablePrivate::setHoverEnabled(const bool enabled)
{
    if(m_hoverEnabled != enabled)
    {
        m_hoverEnabled = enabled;
        setHovered(false);
        setAcceptHoverEvents(enabled);
        emit hoverEnabledChanged(enabled);
    }
}

void XCheckablePrivate::setHovered(const bool hovered)
{
    bool newHovered = hovered && m_hoverEnabled;
    if(m_hovered != newHovered)
    {
        m_hovered = newHovered;
        emit hoveredChanged(m_hovered);
    }
}

void XCheckablePrivate::setCheckable(const bool checkable)
{
    if (m_checkable != checkable) {
        m_checkable = checkable;
        emit checkableChanged(checkable);
    }
}

void XCheckablePrivate::setPressed(const bool pressed)
{
    if(m_pressed != pressed)
    {
        m_pressed = pressed;
        emit pressedChanged(pressed);
    }
}

void XCheckablePrivate::setChecked(const bool checked)
{
    if (m_checkable && m_checked != checked)
    {
        m_checked = checked;
        emit checkedChanged(checked);
        emit toggled(checked);
    }
}
