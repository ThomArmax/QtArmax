#ifndef CONTROLS_PLUGIN_H
#define CONTROLS_PLUGIN_H

#include <QQmlExtensionPlugin>

class ControlsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
    void initializeEngine(QQmlEngine *engine, const char *uri);

private:
    QString fileLocation() const;
    bool isLoadedFromResource() const;
};

#endif // CONTROLS_PLUGIN_H

