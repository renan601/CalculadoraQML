#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "logic/calculate.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    calculate test;
    test.calculate_str = "";

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/CalculadoraRenan/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("Calc", &test);

    return app.exec();
}




