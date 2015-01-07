#ifndef ABSTRACTLISTITEM_H
#define ABSTRACTLISTITEM_H

#include <QObject>
#include <QMap>
#include <QVariant>
#include <QStringList>

namespace Armax {
namespace Datamodels {

/**
 * @brief The AbstractListItem class provides the default implementation of objects to be used with the ListModel class
 * @sa ListModel
 */
class AbstractListItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isSelected READ isSelected  WRITE setIsSelected NOTIFY isSelectedChanged)

public:
    AbstractListItem(QObject* parent = 0);
    virtual ~AbstractListItem();

    /**
     * @brief Returns the data defined by the given role
     * @param role
     * @return the data defined by the given role or invalid QVariant if not found
     * @sa setData(const QVariant& value, int role)
     */
    virtual QVariant                    data                (int role)                          const = 0;
    /**
     * @brief Sets the role data to value.
     * @param role : the role data to be set
     * @param value : the role data's value to be set
     * @return true if succeeded, false otherwise
     * @sa data(const int &role) const
     */
    virtual bool                        setData             (const QVariant& value, int role)         = 0;
    /**
     * @brief Returns the roleNames.
     * @return the roleNames.
     */
    virtual QHash<int, QByteArray>      roleNames           ()                                  const = 0;
    virtual QString                     toString            ()                                  const;
            QString                     toJSON              ()                                  const;
            QVariantMap                 toMap               ()                                  const;
            bool                        fromMap             (const QVariantMap map);
            bool                        equals              (AbstractListItem * other)          const;
            bool                        operator ==         (AbstractListItem * other)          const;
            bool                        operator !=         (AbstractListItem * other)          const;
            bool                        valuesHasChanged    ()                                  const;
    /**
     * @return true if this item is selected, otherwise false.
     * @sa setIsSelected(bool newSelected)
     */
    virtual bool                        isSelected          () const { return m_isSelected; }
    virtual void                        setIsSelected       (bool newSelected);

public slots:
            void                        saved               () { m_valueChanged = false; }

signals:
            void                        dataChanged         (int role=Qt::DisplayRole);                     /**< Signal emitted when an object property changes.        */
            void                        isSelectedChanged   (bool isSelected);      /**< Signal emitted when the 'isSelected' property changes. */
private:
            bool m_isSelected;                                                      /**< Holds the 'isSelected' property                        */

protected:
            bool m_valueChanged;                                                    /**< Says is the value has changed or not (usefull for DB   */
};

}} // END namespace Armax::Datamodels

#endif // ABSTRACTLISTITEM_H
