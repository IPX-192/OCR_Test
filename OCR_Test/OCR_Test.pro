QT += quick core qml androidextras network
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        ocrTest.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


#TEMPLATE = lib  # for the Desktop (Lin/Win/Mac) this is a "lib"

#android {
#    TEMPLATE = app  # for Android this is an "app"
#}


  CONFIG(debug, debug|release){

    INCLUDEPATH +=  $$PWD/./lib/libOpencv/include
    INCLUDEPATH +=  $$PWD/./libD/leptonica/include
    INCLUDEPATH +=  $$PWD/./libD/tesseract/include


    #tesstwo
    INCLUDEPATH +=  $$PWD/./libD/com_googlecode_leptonica_android/src/src
    INCLUDEPATH +=  $$PWD/./libD/com_googlecode_tesseract_android/src/api
    INCLUDEPATH +=  $$PWD/./libD/com_googlecode_tesseract_android/src/ccutil
    INCLUDEPATH +=  $$PWD/./libD/com_googlecode_tesseract_android/src/ccstruct

    INCLUDEPATH +=  $$PWD/./libD/libjpeg
    INCLUDEPATH +=  $$PWD/./libD/libpng


    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\libOpencv\lib\android\armeabi-v7a -lopencv_java4
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\leptonica\lib -lleptonica
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract\lib -ltesseract
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract\lib -lcommon_training

    #LIBS +=    -LD:\ocr_test\libD\tesstwo -ljpgt
    #LIBS +=    -LD:\ocr_test\libD\tesstwo -llept
    #LIBS +=    -LD:\ocr_test\libD\tesstwo -lpngt
    #LIBS +=    -LD:\ocr_test\libD\tesstwo -ltess


  } else {



    INCLUDEPATH +=  $$PWD/./lib/libOpencv/include
    INCLUDEPATH +=  $$PWD/./lib/leptonica/include
    INCLUDEPATH +=  $$PWD/./lib/tesseract/include


    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\libOpencv\lib\android\armeabi-v7a -lopencv_java4
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\leptonica\lib -lleptonica
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\tesseract\lib -ltesseract
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\tesseract\lib -lcommon_training
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\tesseract\lib -ljpeg
  }









#tesstwo


DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/src/com/MyJavaClass.java


contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android

    CONFIG(debug, debug|release){
        ANDROID_EXTRA_LIBS = \
            D:/git/OCR_Test/OCR_Test/lib/libOpencv/lib/android/armeabi-v7a/libopencv_java4.so \
            D:/git/OCR_Test/OCR_Test/libD/leptonica/lib/libleptonica.so \
            $$PWD/libD/tesseract/lib/libtesseract.so
    }

    else {
        ANDROID_EXTRA_LIBS = \
            D:/git/OCR_Test/OCR_Test/lib/libOpencv/lib/android/armeabi-v7a/libopencv_java4.so \
            D:/git/OCR_Test/OCR_Test/lib/leptonica/lib/libleptonica.so \
            D:/git/OCR_Test/OCR_Test/lib/tesseract/lib/libjpeg.so

    }

}

HEADERS += \
    ocrTest.h
