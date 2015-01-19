TEMPLATE = app

QT += qml quick widgets serialport

CONFIG += c++11

HEADERS += \
        ../bci/mindwavecontroller.h \
        ../bci/mindwavesignalprocessor.h \
        ../bci/arduinointerface.h

SOURCES += \
         ./main.cpp \
        ../bci/mindwavecontroller.cpp \
        ../bci/mindwavesignalprocessor.cpp \
        ../bci/arduinointerface.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
