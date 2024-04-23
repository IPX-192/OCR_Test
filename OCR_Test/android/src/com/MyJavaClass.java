package com.MyJavaClass;
import org.qtproject.qt5.android.bindings.QtActivity;

public class MyJavaClass {
    public static int maxAB(int a,int b)
    {
        try
        {
            if(a >b)
                return a;
            else
                return b;
        }
        catch (Exception ex)
        {
            System.out.println("maxAB-failed!");
        }

    return 0;
    }


///*设置背光模式*/
//public static void settingBrightnessMode(Context context,int mode)
//{
//    try
//    {
//        Settings.System.putInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,mode);
//    }
//    catch (Exception ex)
//    {
//        System.out.println("settingBrightnessMode-failed!");
//    }
//}
///*设置背光亮度*/
//public static void settingBrightness(Context context,int brightness)
//{
//    try
//    {
//        settingBrightnessMode(context,Settings.System.SCREEN_BRIGHTNESS_MODE_MANUAL);
//        Settings.System.putInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS,brightness);
//        System.out.println("settingBrightness-Success!");
//    }
//    catch (Exception ex)
//    {
//        System.out.println("settingBrightness-failed!");
//    }
//}

}
