#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qfontdatabase.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // if (QFontDatabase::addApplicationFont(QLatin1String(":/CloudMusic/resources/iconFont/iconfont.ttf")) == -1){
    //      qWarning() << "Failed to load fontello.ttf";
    // }



    const QUrl url(QStringLiteral("qrc:/CloudMusic/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
