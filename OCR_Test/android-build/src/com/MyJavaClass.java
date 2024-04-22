package com.MyJavaClass;
import org.qtproject.qt5.android.bindings.QtActivity;

public class MyJavaClass{
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
    }

}
