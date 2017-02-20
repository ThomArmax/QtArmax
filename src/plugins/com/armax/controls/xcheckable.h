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

#ifndef CHECKABLE_H
#define CHECKABLE_H

#include <QQuickItem>

class XExclusiveGroup;

/**
 * @brief Base class to implement checkable components
 */
class XCheckable : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(XCheckable)

    Q_PROPERTY(bool checkable                   READ isCheckable    WRITE setCheckable      NOTIFY checkableChanged)
    Q_PROPERTY(bool pressed                     READ isPressed      WRITE setPressed        NOTIFY pressedChanged)
    Q_PROPERTY(bool checked                     READ isChecked      WRITE setChecked        NOTIFY checkedChanged)
    Q_PROPERTY(bool hoverEnabled                READ isHoverEnabled WRITE setHoverEnabled   NOTIFY hoverEnabledChanged)
    Q_PROPERTY(bool hovered                     READ isHovered                              NOTIFY hoveredChanged)
    Q_PROPERTY(XExclusiveGroup* exclusiveGroup  READ exclusiveGroup WRITE setExclusiveGroup NOTIFY exclusiveGroupChanged)

public:
                        XCheckable              (QQuickItem *parent = 0);
                        ~XCheckable             ();

    // Overridden from QQuickItem
    virtual void        mouseReleaseEvent       (QMouseEvent * event);
    virtual void        mousePressEvent         (QMouseEvent * event);
    virtual void        hoverEnterEvent         (QHoverEvent * event);
    virtual void        hoverLeaveEvent         (QHoverEvent * event);

    bool                isHoverEnabled          () const { return m_hoverEnabled; } /**< @return the hoverEnabled property */
    bool                isPressed               () const { return m_pressed; }      /**< @return the pressed property */
    bool                isChecked               () const { return m_checked; }      /**< @return the checked property */
    bool                isCheckable             () const { return m_checkable; }    /**< @return the checkable property */
    bool                isHovered               () const { return m_hovered; }      /**< @return the hoverd property */
    XExclusiveGroup*    exclusiveGroup          () { return m_exclusiveGroup; }     /**< @return the exclusiveGroup property */

public slots:
    void                setHoverEnabled         (const bool enabled);
    void                setPressed              (const bool pressed);
    void                setChecked              (const bool checked);
    void                setCheckable            (const bool checkable);
    void                setExclusiveGroup       (XExclusiveGroup *exclusiveGroup);

private slots:
    void                onEnabledChanged        ();

private:
    void                setHovered              (const bool hovered);

signals:
    void                hoverEnabledChanged     (const bool enabled);           /**< Signal emitted when the hoverEnabled property changed */
    void                toggled                 (const bool toggled);           /**< Signal emitted when the checkable is toggled */
    void                checkedChanged          (const bool checked);           /**< Signal emitted when the checked property changed */
    void                checkableChanged        (const bool checkable);         /**< Signal emitted when the checkable property changed */
    void                pressedChanged          (const bool pressed);           /**< Signal emitted when the pressed property changed */
    void                hoveredChanged          (const bool hovered);           /**< Signal emitted when the hovered property changed */
    void                pressed                 ();                             /**< Signal emitted when the Checkable is pressed */
    void                released                ();                             /**< Signal emitted when the Checkable is released */
    void                clicked                 ();                             /**< Signal emitted when the Checkable is clicked */
    void                exclusiveGroupChanged   ();                             /**< Signal emitted when the exclusiveGroup property changed */

private:
    bool                m_checkable;                                            /**< Holds the checkable property */
    bool                m_hoverEnabled;                                         /**< Holds the hoverEnabled property */
    bool                m_pressed;                                              /**< Holds the pressed property */
    bool                m_checked;                                              /**< Holds the checked property */
    bool                m_hovered;                                              /**< Holds the hovered property */
    XExclusiveGroup*    m_exclusiveGroup;                                       /**< Holds the exclusive group property */
};

#endif // CHECKABLE_H

