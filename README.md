QtArmax
=======
QtArmax is an addons project for Qt5.
It's is splitted in two parts :
* libraries
* QML plugins

### Libraries
The libraries part provides native C++/Qt addons for Qt5 and tooling functions.
* **QtArmaxCore** provides some very usefull classes to handle datamodels (ListModel, Fifo ...)
* **QtArmaxDB** will provides an abstraction for SQLite databases and tooling methods
* **QtArmaxGUI** will provides natives C++/Qt widgets

### QML plugins
The QML plugins provided by QtArmax are mainly designed for embedded systems.

* **com.armax.controls** which provides graphicals controls (buttons, checkbox, radio buttons ...)
* **com.armax.datamodels** which is a _link_ between the QtArmaxCore datamodels part for the QML side.
* **com.armax.dialogs** will provide dialogs for QML applications (popup, alert message, informations, file browser ...)

### Build - Installation
The basic build and installation process is as below :
```
cd src
qmake -recursive
make
make install
```
By default 
* Headers will be installed in `/usr/include/QtArmax-<version>`
* Libs will be installed in `/usr/lib/QtArmax-<version>`
* QML plugins will be installed in Qt's plugins path

To change the QML plugins installation path, run `qmake "QML_PLUGINS_PREFIX=<plugins/dir/installation/path>"`

If you want to install libraries/headers in Qt's path , run `qmake "CONFIG+=INSTALL_IN_QT"`
