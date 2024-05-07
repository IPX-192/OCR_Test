#include <QDebug>
#include <QQmlApplicationEngine>
#include <opencv2/opencv.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/core.hpp>
#include <string>
#include <QFile>
#include <QPixmap>


#include <baseapi.h>
#include <allheaders.h>


#include <QtAndroidExtras>
#include <QAndroidJniObject>
#include "ocrTest.h"

ocrTest::ocrTest()
{


    std::string imPath = "/sdcard//1//3.jpeg";

    cv::Mat im ;
    im = cv::imread(imPath, cv::IMREAD_COLOR);

    // 将图像转换为灰度图
    cv::Mat gray;
    cv::cvtColor(im, gray, cv::COLOR_BGR2GRAY);

    tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();

    qDebug()<<"api address " << &api;

    std::string dataPath = "/sdcard//1//tessdata//";

    int a =  api->Init(dataPath.c_str(),"chi_sim",tesseract::OEM_LSTM_ONLY);    //中文识别 chi_sim +英文识别 eng

    qDebug()<<"asfffffffffffsafas   "<< QString::number(a);

    api->SetPageSegMode(tesseract::PSM_AUTO);



   // api->SetImage(gray.data, gray.cols, gray.rows, 1, gray.cols);


    qDebug() << "--------" << im.cols << "  " << im.rows << "  "<< im.depth()  << "  " << im.step;

    // api->SetImage(im.data, im.cols, im.rows, 3, im.step);


    //
    Pix *image = pixRead("/sdcard/1/3.jpeg");
    if(image == nullptr)
    {
        qDebug() << "Failed to pix read";
        //  return;
    }



     api->SetImage(image);



    char *outText;
    outText = api->GetUTF8Text();

    QString str = QString::fromLocal8Bit(outText);


    qDebug() << "UTF-8 文本：" << (outText != nullptr ? outText : "wo cao");

    if (outText != nullptr) {
        // 如果获取到了有效的 UTF-8 文本，进行转换
        QString str = QString::fromUtf8(outText);

        // 输出转换后的 QString
        qDebug() << "转换后的 QString：" << str;
    } else {
        // 如果获取到的 UTF-8 文本为空或者无效，输出相应信息
        qDebug() << "无效的 UTF-8 文本，转换失败。";
    }

    delete[] outText;

    api->End();
    delete api;



}
