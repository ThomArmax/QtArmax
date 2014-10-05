#include "checkable.h"
#include <QDebug>

Checkable::Checkable(QQuickItem *parent):
    QQuickItem      (parent),
    m_checkable     (true),
    m_hoverEnabled  (false),
    m_pressed       (false),
    m_checked       (false),
    m_containsMouse (false)
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

void Checkable::mouseMoveEvent(QMouseEvent *event)
{
    qDebug() << Q_FUNC_INFO;
    if(m_hoverEnabled)
    {
        setContainsMouse(boundingRect().contains(event->globalPos()));
    }
}

void Checkable::mousePressEvent(QMouseEvent *event)
{
    Q_UNUSED(event)
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

    emit released();
}

/**
 * @brief Sets the containsMouse property
 * The signal containsMouseChanged() is emitted if the property changed
 * @param contains
 */
void Checkable::setContainsMouse(const bool containsMouse)
{
    if(m_hoverEnabled && m_containsMouse != containsMouse)
    {
        m_containsMouse = containsMouse;
        emit containsMouseChanged(containsMouse);
    }
}

void Checkable::setHoverEnabled(const bool enabled)
{
    if(m_hoverEnabled != enabled)
    {
        m_hoverEnabled = enabled;
        setContainsMouse(false);
        setAcceptHoverEvents(enabled);
        emit hoverEnabledChanged(enabled);
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
