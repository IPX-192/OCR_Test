/*
 * This file is auto-generated.  DO NOT MODIFY.
 */
package org.kde.necessitas.ministro;
public interface IMinistro extends android.os.IInterface
{
  /** Default implementation for IMinistro. */
  public static class Default implements org.kde.necessitas.ministro.IMinistro
  {
    /**
     * Check/download required libs to run the application
     * 
     * param callback  - interface used by Minsitro service to notify the client when the loader is ready
     * param parameters
     *            parameters fields:
     *                 * Key Name                   Key type         Explanations
     *                   "sources"                  StringArray      Sources list from where Ministro will download the libs. Make sure you are using ONLY secure locations.
     *                   "repository"               String           Overwrites the default Ministro repository. Possible values: default, stable, testing and unstable
     *                   "required.modules"         StringArray      Required modules by your application
     *                   "application.title"        String           Application name, used to show more informations to user
     *                   "qt.provider"              String           Qt libs provider, currently only "necessitas" is supported.
     *                   "minimum.ministro.api"     Integer          Minimum Ministro API level, used to check if Ministro service compatible with your application. Current API Level is 3 !
     *                   "minimum.qt.version"       Integer          Minimim Qt version (e.g. 0x040800, which means Qt 4.8.0, check http://qt-project.org/doc/qt-4.8/qtglobal.html#QT_VERSION)!
     */
    @Override public void requestLoader(org.kde.necessitas.ministro.IMinistroCallback callback, android.os.Bundle parameters) throws android.os.RemoteException
    {
    }
    @Override
    public android.os.IBinder asBinder() {
      return null;
    }
  }
  /** Local-side IPC implementation stub class. */
  public static abstract class Stub extends android.os.Binder implements org.kde.necessitas.ministro.IMinistro
  {
    /** Construct the stub at attach it to the interface. */
    public Stub()
    {
      this.attachInterface(this, DESCRIPTOR);
    }
    /**
     * Cast an IBinder object into an org.kde.necessitas.ministro.IMinistro interface,
     * generating a proxy if needed.
     */
    public static org.kde.necessitas.ministro.IMinistro asInterface(android.os.IBinder obj)
    {
      if ((obj==null)) {
        return null;
      }
      android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
      if (((iin!=null)&&(iin instanceof org.kde.necessitas.ministro.IMinistro))) {
        return ((org.kde.necessitas.ministro.IMinistro)iin);
      }
      return new org.kde.necessitas.ministro.IMinistro.Stub.Proxy(obj);
    }
    @Override public android.os.IBinder asBinder()
    {
      return this;
    }
    @Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
    {
      java.lang.String descriptor = DESCRIPTOR;
      if (code >= android.os.IBinder.FIRST_CALL_TRANSACTION && code <= android.os.IBinder.LAST_CALL_TRANSACTION) {
        data.enforceInterface(descriptor);
      }
      switch (code)
      {
        case INTERFACE_TRANSACTION:
        {
          reply.writeString(descriptor);
          return true;
        }
      }
      switch (code)
      {
        case TRANSACTION_requestLoader:
        {
          org.kde.necessitas.ministro.IMinistroCallback _arg0;
          _arg0 = org.kde.necessitas.ministro.IMinistroCallback.Stub.asInterface(data.readStrongBinder());
          android.os.Bundle _arg1;
          _arg1 = _Parcel.readTypedObject(data, android.os.Bundle.CREATOR);
          this.requestLoader(_arg0, _arg1);
          reply.writeNoException();
          break;
        }
        default:
        {
          return super.onTransact(code, data, reply, flags);
        }
      }
      return true;
    }
    private static class Proxy implements org.kde.necessitas.ministro.IMinistro
    {
      private android.os.IBinder mRemote;
      Proxy(android.os.IBinder remote)
      {
        mRemote = remote;
      }
      @Override public android.os.IBinder asBinder()
      {
        return mRemote;
      }
      public java.lang.String getInterfaceDescriptor()
      {
        return DESCRIPTOR;
      }
      /**
       * Check/download required libs to run the application
       * 
       * param callback  - interface used by Minsitro service to notify the client when the loader is ready
       * param parameters
       *            parameters fields:
       *                 * Key Name                   Key type         Explanations
       *                   "sources"                  StringArray      Sources list from where Ministro will download the libs. Make sure you are using ONLY secure locations.
       *                   "repository"               String           Overwrites the default Ministro repository. Possible values: default, stable, testing and unstable
       *                   "required.modules"         StringArray      Required modules by your application
       *                   "application.title"        String           Application name, used to show more informations to user
       *                   "qt.provider"              String           Qt libs provider, currently only "necessitas" is supported.
       *                   "minimum.ministro.api"     Integer          Minimum Ministro API level, used to check if Ministro service compatible with your application. Current API Level is 3 !
       *                   "minimum.qt.version"       Integer          Minimim Qt version (e.g. 0x040800, which means Qt 4.8.0, check http://qt-project.org/doc/qt-4.8/qtglobal.html#QT_VERSION)!
       */
      @Override public void requestLoader(org.kde.necessitas.ministro.IMinistroCallback callback, android.os.Bundle parameters) throws android.os.RemoteException
      {
        android.os.Parcel _data = android.os.Parcel.obtain();
        android.os.Parcel _reply = android.os.Parcel.obtain();
        try {
          _data.writeInterfaceToken(DESCRIPTOR);
          _data.writeStrongInterface(callback);
          _Parcel.writeTypedObject(_data, parameters, 0);
          boolean _status = mRemote.transact(Stub.TRANSACTION_requestLoader, _data, _reply, 0);
          _reply.readException();
        }
        finally {
          _reply.recycle();
          _data.recycle();
        }
      }
    }
    static final int TRANSACTION_requestLoader = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
  }
  public static final java.lang.String DESCRIPTOR = "org.kde.necessitas.ministro.IMinistro";
  /**
   * Check/download required libs to run the application
   * 
   * param callback  - interface used by Minsitro service to notify the client when the loader is ready
   * param parameters
   *            parameters fields:
   *                 * Key Name                   Key type         Explanations
   *                   "sources"                  StringArray      Sources list from where Ministro will download the libs. Make sure you are using ONLY secure locations.
   *                   "repository"               String           Overwrites the default Ministro repository. Possible values: default, stable, testing and unstable
   *                   "required.modules"         StringArray      Required modules by your application
   *                   "application.title"        String           Application name, used to show more informations to user
   *                   "qt.provider"              String           Qt libs provider, currently only "necessitas" is supported.
   *                   "minimum.ministro.api"     Integer          Minimum Ministro API level, used to check if Ministro service compatible with your application. Current API Level is 3 !
   *                   "minimum.qt.version"       Integer          Minimim Qt version (e.g. 0x040800, which means Qt 4.8.0, check http://qt-project.org/doc/qt-4.8/qtglobal.html#QT_VERSION)!
   */
  public void requestLoader(org.kde.necessitas.ministro.IMinistroCallback callback, android.os.Bundle parameters) throws android.os.RemoteException;
  /** @hide */
  static class _Parcel {
    static private <T> T readTypedObject(
        android.os.Parcel parcel,
        android.os.Parcelable.Creator<T> c) {
      if (parcel.readInt() != 0) {
          return c.createFromParcel(parcel);
      } else {
          return null;
      }
    }
    static private <T extends android.os.Parcelable> void writeTypedObject(
        android.os.Parcel parcel, T value, int parcelableFlags) {
      if (value != null) {
        parcel.writeInt(1);
        value.writeToParcel(parcel, parcelableFlags);
      } else {
        parcel.writeInt(0);
      }
    }
  }
}
