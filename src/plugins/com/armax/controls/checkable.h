#ifndef CHECKABLE_H
#define CHECKABLE_H

#include <QQuickItem>

/**
 * @brief The base class used to create Checkable, Button, RadioButton ...
 */
class Checkable : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(Checkable)

    Q_PROPERTY(bool checkable       READ isCheckable    WRITE setCheckable      NOTIFY checkableChanged)
    Q_PROPERTY(bool pressed         READ isPressed      WRITE setPressed        NOTIFY pressedChanged)
    Q_PROPERTY(bool checked         READ isChecked      WRITE setChecked        NOTIFY checkedChanged)
    Q_PROPERTY(bool containsMouse   READ containsMouse                          NOTIFY containsMouseChanged)
    Q_PROPERTY(bool hoverEnabled    READ isHoverEnabled WRITE setHoverEnabled   NOTIFY hoverEnabledChanged)

public:
                    Checkable           (QQuickItem *parent = 0);
                    ~Checkable          ();

    // Overridden from QQuickItem
    virtual void    mouseReleaseEvent   (QMouseEvent * event);
    virtual void    mousePressEvent     (QMouseEvent * event);
    virtual void    mouseMoveEvent      (QMouseEvent * event);

    bool            isHoverEnabled      () const { return m_hoverEnabled; } /**< @return the hoverEnabled property */
    bool            isPressed           () const { return m_pressed; }      /**< @return the pressed property */
    bool            isChecked           () const { return m_checked; }      /**< @return the checked property */
    bool            isCheckable         () const { return m_checkable; }    /**< @return the checkable property */
    bool            containsMouse       () const { return m_containsMouse; }/**< @return the containsMouse property */

public slots:
    void            setHoverEnabled     (const bool enabled);
    void            setPressed          (const bool pressed);
    void            setChecked          (const bool checked);
    void            setCheckable        (const bool checkable);

private slots:
    void            setContainsMouse    (const bool containsMouse);

signals:
    void            hoverEnabledChanged (const bool enabled);               /**< Signal emitted when the hoverEnabled property changed */
    void            toggled             (const bool toggled);               /**< Signal emitted when the checkable is toggled */
    void            checkedChanged      (const bool checked);               /**< Signal emitted when the checked property changed */
    void            checkableChanged    (const bool checkable);             /**< Signal emitted when the checkable property changed */
    void            containsMouseChanged(const bool containsMouse);         /**< Signal emitted when the containsMouse property changed */
    void            pressedChanged      (const bool pressed);               /**< Signal emitted when the pressed property changed */
    void            pressed             ();                                 /**< Signal emitted when the Checkable is pressed */
    void            released            ();                                 /**< Signal emitted when the Checkable is released */
    void            clicked             ();                                 /**< Signal emitted when the Checkable is clicked */

private:
    bool            m_checkable;                                            /**< Holds the checkable property */
    bool            m_hoverEnabled;                                         /**< Holds the hoverEnabled property */
    bool            m_pressed;                                              /**< Holds the pressed property */
    bool            m_checked;                                              /**< Holds the checked property */
    bool            m_containsMouse;                                        /**< Holds the containsMouse property */
};

#endif // CHECKABLE_H

