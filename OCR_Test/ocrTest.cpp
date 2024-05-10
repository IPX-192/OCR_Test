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
#include <vector>


#include <QtAndroidExtras>
#include <QAndroidJniObject>
#include <QRegularExpression>
#include "ocrTest.h"

using namespace cv;
using namespace std;

ocrTest::ocrTest()
{


    std::string imPath = "/sdcard//1//3.jpg";

    cv::Mat im ;
    im = cv::imread(imPath, cv::IMREAD_COLOR);

    // 将图像转换为灰度图
    cv::Mat gray;
    cv::cvtColor(im, gray, cv::COLOR_BGR2GRAY);


    // 创建人脸检测器
    cv::CascadeClassifier faceCascade;
      return;
    faceCascade.load("/sdcard/1/haarcascade_frontalface_default.xml"); // 加载Haar级联分类器


    if (faceCascade.empty()) {

        qDebug()<<"Failed to load cascade classifier!";
        return;
    }

    else {

        qDebug()<<"Failed to load cascade classifier1111111111111!";
    }
    return;


    // 检测人脸
    std::vector<Rect> faces;
    faceCascade.detectMultiScale(gray, faces, 1.1, 2, 0 | CASCADE_SCALE_IMAGE, Size(30, 30));


    return;

    // 如果检测到人脸
    if (!faces.empty()) {
        // 提取第一个人脸
        Rect faceRect = faces[0];

        // 在原图上画出人脸矩形
        rectangle(im, faceRect, Scalar(255, 0, 0), 2);

        // 裁剪人脸
        Mat faceROI = im(faceRect);

        // 将OpenCV图像转换为Qt图像
        QImage img = QImage(faceROI.data, faceROI.cols, faceROI.rows, faceROI.step, QImage::Format_RGB888).rgbSwapped();

        qDebug()<<"sssssssssssssssssssssssss"<<img.size();

    }


    return;

    tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();

    qDebug()<<"api address " << &api;

    std::string dataPath = "/sdcard//1//tessdata//";

    int a =  api->Init(dataPath.c_str(),"chi_sim",tesseract::OEM_LSTM_ONLY);    //中文识别 chi_sim +英文识别 eng

    qDebug()<<"asfffffffffffsafas   "<< QString::number(a);

    api->SetPageSegMode(tesseract::PSM_AUTO);



    api->SetImage(gray.data, gray.cols, gray.rows, 1, gray.cols);


    qDebug() << "--------" << im.cols << "  " << im.rows << "  "<< im.depth()  << "  " << im.step;

    //api->SetImage(im.data, im.cols, im.rows, 3, im.step);


    //
    Pix *image = pixRead("/sdcard/1/3.jpeg");
    if(image == nullptr)
    {
        qDebug() << "Failed to pix read";
        //  return;
    }



    // api->SetImage(image);



    char *outText;
    outText = api->GetUTF8Text();

    QString str = QString::fromLocal8Bit(outText);


    qDebug() << "UTF-8 文本：" << (outText != nullptr ? outText : "wo cao");

    if (outText != nullptr) {
        // 如果获取到了有效的 UTF-8 文本，进行转换
        QString str = QString::fromUtf8(outText);

        // 输出转换后的 QString
        qDebug() << "转换后的 QString：" << str <<"length" <<str.length();
    } else {
        // 如果获取到的 UTF-8 文本为空或者无效，输出相应信息
        qDebug() << "无效的 UTF-8 文本，转换失败。";
    }

    str.remove(" ");

    QRegularExpression re("\\b\\d{17}(\\d|X)\\b"); // 身份证号的正则表达式

    QRegularExpressionMatch match = re.match(str);

    if (match.hasMatch()) {
        QString idNumber = match.captured(0);
        qDebug() << "提取的身份证号为：" << idNumber;
    } else {
        qDebug() << "未找到身份证号";
    }

    delete[] outText;

    api->End();
    delete api;



}
