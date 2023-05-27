#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQuickItem>
//#include "mytcpserver.h"


//class MessageBoard : public QObject
//{
//    Q_OBJECT
//public:
//    Q_INVOKABLE bool postMessage(const QString &msg) {
//        return true;
//    }

//    Q_INVOKABLE QString getMessage() {
//        QString photoDirectoryFileDialog = "file:/home/niki/Pictures/Пазарджик/";
//        return photoDirectoryFileDialog;
//    }

//public slots:
//    void refresh() {
//    }
//};

int main(int argc, char *argv[])
{

//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
//    MyTcpServer server;

    QQmlApplicationEngine engine;

    app.setOrganizationName("arsoft");
    app.setOrganizationDomain("arsoft");

    qmlRegisterSingletonType(QUrl("qrc:/Style.qml"), "CStyle", 1, 0, "CStyle");
    qmlRegisterSingletonType(QUrl("qrc:/StyleModel.qml"), "StyleModel", 1, 0, "StyleModel");
    qmlRegisterSingletonType(QUrl("qrc:/PositionModel.qml"), "PositionModel", 1, 0, "PositionModel");
    qmlRegisterSingletonType(QUrl("qrc:/Calendar.qml"), "Calendar", 1, 0, "Calendar");
    qmlRegisterType(QUrl("qrc:/Media.qml"), "Media", 1, 0, "Media");
//    qmlRegisterType(QUrl("qrc:/PictImage.qml"), "PictImage", 1, 0, "PictImage");
    qmlRegisterType(QUrl("qrc:/CButton.qml"), "CButton", 1, 0, "CButton");
//    qmlRegisterType(QUrl("qrc:/LoginPage.qml"), "MLoginPage", 1, 0, "MLoginPage");
    qmlRegisterType(QUrl("qrc:/ConfigMenu.qml"), "ConfigMenu", 1, 0, "ConfigMenu");
//    qmlRegisterType(QUrl("qrc:/utils"), "Utils", 1, 0, "Utils");
//    qmlRegisterType(QUrl("qrc:/components"), "Components", 1, 0, "Components");

//    qmlRegisterModule("utils",  1, 0);


    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    //        MessageBoard messageBoard;
//    engine.setProperty("photoDirectoryFileDialog", QUrl("file:/home/niki/Pictures/Пазарджик/"));

    QQmlComponent component(&engine, url);
    QObject *object = component.create();
//    engine.load(url);

    QObject *window = object->findChild<QObject*>("folderModel");
    if (window)
        window->setProperty("folder", "file:/home/niki/Pictures/Пазарджик/");
//    else
//        qDebug("===========");



    return app.exec();
}
