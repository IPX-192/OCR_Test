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



    INCLUDEPATH +=  $$PWD/./lib/libOpencv/include
    INCLUDEPATH +=  $$PWD/./libD/tesseract4android/include
    INCLUDEPATH +=  $$PWD/./libD/tesseract4android/include/tesseract
    INCLUDEPATH +=  $$PWD/./libD/tesseract4android/include/leptonica/src/src
    INCLUDEPATH +=  $$PWD/./libD/tesseract4android/include/libjpeg/src
    INCLUDEPATH +=  $$PWD/./libD/tesseract4android/include/libpng/src



    LIBS +=    -LD:\git\OCR_Test\OCR_Test\lib\libOpencv\lib\android\armeabi-v7a -lopencv_java4
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract4android\armeabi-v7a -ltesseract
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract4android\armeabi-v7a -ljpeg
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract4android\armeabi-v7a -lleptonica
    LIBS +=    -LD:\git\OCR_Test\OCR_Test\libD\tesseract4android\armeabi-v7a -lpngx


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


    ANDROID_EXTRA_LIBS = \
        D:/git/OCR_Test/OCR_Test/libD/tesseract4android/armeabi-v7a/libjpeg.so \
        D:/git/OCR_Test/OCR_Test/libD/tesseract4android/armeabi-v7a/libleptonica.so \
        D:/git/OCR_Test/OCR_Test/libD/tesseract4android/armeabi-v7a/libpngx.so \
        D:/git/OCR_Test/OCR_Test/libD/tesseract4android/armeabi-v7a/libtesseract.so \
        $$PWD/lib/libOpencv/lib/android/armeabi-v7a/libopencv_java4.so

}

HEADERS += \
    ocrTest.h
