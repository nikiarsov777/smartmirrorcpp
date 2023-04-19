#include "mytcpserver.h"
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQuickItem>
#include <QFile>
#include <QDir>
#include <QDebug>
//#include <QMessageBox>

class MessageBoard : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE bool postMessage(const QString &msg) {
        return true;
    }

    Q_INVOKABLE QString getMessage() {
        QString photoDirectoryFileDialog = "file:/home/niki/Pictures/Пазарджик/";
        return photoDirectoryFileDialog;
    }

public slots:
    void refresh() {
    }
};

MyTcpServer::MyTcpServer(QObject *parent) :
    QObject(parent)
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QQmlApplicationEngine engine;

//    qmlRegisterSingletonType(QUrl("qrc:/Style.qml"), "Style", 1, 0, "Style");
//    qmlRegisterSingletonType(QUrl("qrc:/ProxyStyles.qml"), "ProxyStyles", 1, 0, "ProxyStyles");
//    qmlRegisterSingletonType(QUrl("qrc:/Calendar.qml"), "Calendar", 1, 0, "Calendar");
//    qmlRegisterType(QUrl("qrc:/Media.qml"), "Media", 1, 0, "Media");


    //    const QUrl url(QStringLiteral("qrc:/main.qml"));
    url = QStringLiteral("main.qml");

    //    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
    //                     &app, [url](QObject *obj, const QUrl &objUrl) {
    //        if (!obj && url == objUrl)
    //            QCoreApplication::exit(-1);
    //    }, Qt::QueuedConnection);


    //        MessageBoard messageBoard;
        engine.setProperty("photoDirectoryFileDialog", QUrl("file:/home/niki/Pictures/Пазарджик/"));

        QQmlComponent component(&engine, url);
//        QObject *object = component.create();
        engine.load(url);

    //    QObject *window = object->findChild<QObject*>("folderModel");
    //    if (window)
    //        window->setProperty("folder", "file:/home/niki/Pictures/Пазарджик/");
    //    else
    //        qDebug("===========");

    server = new QTcpServer(this);

    // whenever a user connects, it will emit signal
    connect(server, SIGNAL(newConnection()),
            this, SLOT(newConnection()));

    if(!server->listen(QHostAddress::Any, 9999))
    {
        qDebug() << "Server could not start";
    }
    else
    {
        qDebug() << "Server started!";
    }
}

void MyTcpServer::newConnection()
{
    // need to grab the socket
    QString line;
    QTcpSocket *socket = server->nextPendingConnection();

    QFile file(url.toString());
    if(!file.open(QIODevice::ReadOnly)) {
//        QMessageBox::information(0, "error", file.errorString());
        qDebug() << QDir::currentPath();
    }

    QTextStream in(&file);

    while(!in.atEnd()) {
        line += in.readLine() + "\r\n";
    }

    file.close();

    QByteArray ba = line.toLatin1();


    char *s(ba.data());
    socket->write(s);
    socket->flush();

    socket->waitForBytesWritten(5000);

    socket->close();
}
