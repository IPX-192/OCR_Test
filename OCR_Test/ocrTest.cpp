#include <QDebug>
#include <QQmlApplicationEngine>
#include <leptonica/allheaders.h>
#include <opencv2/opencv.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/core.hpp>
#include <string>
#include <QFile>
#include <QPixmap>
#include <tesseract/baseapi.h>

//#include <baseapi.h>
//#include <allheaders.h>
#include "tesseract/genericvector.h"


#include <QtAndroidExtras>
#include <QAndroidJniObject>
#include "ocrTest.h"

ocrTest::ocrTest()
{


    std::string imPath = "/sdcard//1//test.jpg";


    cv::Mat im ;
    im = cv::imread(imPath, cv::IMREAD_COLOR);

    // 将图像转换为灰度图
    cv::Mat gray;
    cv::cvtColor(im, gray, cv::COLOR_BGR2GRAY);

    tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();

    qDebug()<<"api address " << &api;

    std::string dataPath = "/sdcard//1//tessdata//";

    int a =  api->Init(dataPath.c_str(),"chi_sim",tesseract::OEM_DEFAULT);    //中文识别 chi_sim +英文识别 eng

    qDebug()<<"asfffffffffffsafas   "<< QString::number(a);

    api->SetPageSegMode(tesseract::PSM_AUTO);



    api->SetImage(gray.data, gray.cols, gray.rows, 1, gray.cols);


    qDebug() << "--------" << im.cols << "  " << im.rows << "  "<< im.depth()  << "  " << im.step;

    // api->SetImage(im.data, im.cols, im.rows, 3, im.step);


    //


    QString filePath = "/sdcard//1//test.jpg";

    QPixmap pixmap;

    if (QFile(filePath).exists()) {
        pixmap.load(filePath);
        qDebug() << "pix read success";
    } else {
        qDebug() << "pix read fail";
    }

    Pix *image = pixRead("/sdcard//1//test.jpg");
    if(image == nullptr)
    {
        qDebug() << "Failed to pix read";
        //  return;
    }



    // api->SetImage(pixmap.toImage());



    char *outText;
    outText = api->GetUTF8Text();

    QString str = QString::fromLocal8Bit(outText);

    qDebug()<<"asfasfasf"<< str;

    //delete[] outText;

    api->End();
    delete api;



}
