#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>
#include <QAndroidJniObject>
#include "ocrTest.h"

static bool requestAndrioPermissions(const QString &qsPermission)
{
    bool bRet = true;

    if(QtAndroid::checkPermission(qsPermission) == QtAndroid::PermissionResult::Denied)
    {
        //申请权限
        QtAndroid::requestPermissionsSync( QStringList() << qsPermission );
        bRet = QtAndroid::checkPermission(qsPermission) != QtAndroid::PermissionResult::Denied;
    }


    return  bRet;
}


//int maxAB(int a,int b) {
//    QAndroidJniObject activity = QtAndroid::androidActivity();
//    if (activity.isValid())
//    {
//        jint value = QAndroidJniObject::callStaticMethod<jint>("com/MyJavaClass/MyJavaClass",
//                                                               "maxAB",
//                                                               "(II)I",
//                                                               a,
//                                                               b);

//        return value;
//    }

//}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


   // qDebug()<<"10 and 5 max is == "<<maxAB(10,5);

    //存储权限
    if(!requestAndrioPermissions("android.permission.WRITE_EXTERNAL_STORAGE"))
    {
        return -1;
    }

    if(!requestAndrioPermissions("android.permission.READ_EXTERNAL_STORAGE"))
    {
        return -1;
    }


    ocrTest w;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
