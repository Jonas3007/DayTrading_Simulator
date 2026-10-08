#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "services/MarketDataService.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MarketDataService marketDataService;
    marketDataService.getAPIData();

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DayTrader", "Main");

    return QGuiApplication::exec();
}
