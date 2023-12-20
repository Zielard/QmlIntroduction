#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "../include/ChartData.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine("qrc:/src/qml/main.qml");

    engine.rootContext()->setContextProperty("dataFromCpp", new ChartData());

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
