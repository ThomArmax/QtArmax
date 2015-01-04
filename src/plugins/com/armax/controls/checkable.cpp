#include "checkable.h"
#include <QDebug>

Checkable::Checkable(QQuickItem *parent):
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
 * @brief Destroys the Checkable instance
 */
Checkable::~Checkable()
{
}

void Checkable::mousePressEvent(QMouseEvent *event)
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
void Checkable::mouseReleaseEvent(QMouseEvent *event)
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

void Checkable::hoverEnterEvent(QHoverEvent */*event*/)
{
    setHovered( m_hoverEnabled );
}

void Checkable::hoverLeaveEvent(QHoverEvent */*event*/)
{
    setHovered(false);
}

void Checkable::setHoverEnabled(const bool enabled)
{
    if(m_hoverEnabled != enabled)
    {
        m_hoverEnabled = enabled;
        setHovered(false);
        setAcceptHoverEvents(enabled);
        emit hoverEnabledChanged(enabled);
    }
}

void Checkable::setHovered(const bool hovered)
{
    bool newHovered = hovered && m_hoverEnabled;
    if(m_hovered != newHovered)
    {
        m_hovered = newHovered;
        emit hoveredChanged(m_hovered);
    }
}

void Checkable::setCheckable(const bool checkable)
{
    if (m_checkable != checkable) {
        m_checkable = checkable;
        emit checkableChanged(checkable);
    }
}

void Checkable::setPressed(const bool pressed)
{
    if(m_pressed != pressed)
    {
        m_pressed = pressed;
        emit pressedChanged(pressed);
    }
}

void Checkable::setChecked(const bool checked)
{
    if (m_checkable && m_checked != checked)
    {
        m_checked = checked;
        emit checkedChanged(checked);
        emit toggled(checked);
    }
}
