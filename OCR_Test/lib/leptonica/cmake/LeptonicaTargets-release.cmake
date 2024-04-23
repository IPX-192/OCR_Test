#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "leptonica" for configuration "Release"
set_property(TARGET leptonica APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(leptonica PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "D:\\opt\\libjpeg-turbo\\lib32\\libjpeg.so;D:/Android/android-ndk-r19c-windows-x86_64/android-ndk-r19c/toolchains/llvm/prebuilt/windows-x86_64/sysroot/usr/lib/arm-linux-androideabi/libz.a;m"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libleptonica.so"
  IMPORTED_SONAME_RELEASE "libleptonica.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS leptonica )
list(APPEND _IMPORT_CHECK_FILES_FOR_leptonica "${_IMPORT_PREFIX}/lib/libleptonica.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
