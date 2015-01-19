#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "../bci/mindwavecontroller.h"
#include "../bci/mindwavesignalprocessor.h"
#include "../bci/arduinointerface.h"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    qmlRegisterType<MindWaveController>("com.Warwick.MindWave", 0, 1, "MindWaveController");
    qmlRegisterType<MindWaveSignalProcessor>("com.Warwick.MindWave", 0, 1, "MindWaveSignalProcessor");
    qmlRegisterType<ArduinoInterface>("com.Warwick.MindWave", 0, 1, "ArduinoInterface");


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
