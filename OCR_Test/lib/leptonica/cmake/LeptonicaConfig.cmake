# ===================================================================================
#  The Leptonica CMake configuration file
#
#             ** File generated automatically, do not modify **
#
#  Usage from an external project:
#    In your CMakeLists.txt, add these lines:
#
#    find_package(Leptonica REQUIRED)
#    include_directories(${Leptonica_INCLUDE_DIRS})
#    target_link_libraries(MY_TARGET_NAME ${Leptonica_LIBRARIES})
#
#    This file will define the following variables:
#      - Leptonica_LIBRARIES             : The list of all imported targets for OpenCV modules.
#      - Leptonica_INCLUDE_DIRS          : The Leptonica include directories.
#      - Leptonica_VERSION               : The version of this Leptonica build: "1.74.3"
#      - Leptonica_VERSION_MAJOR         : Major version part of Leptonica_VERSION: "1"
#      - Leptonica_VERSION_MINOR         : Minor version part of Leptonica_VERSION: "74"
#      - Leptonica_VERSION_PATCH         : Patch version part of Leptonica_VERSION: "3"
#
# ===================================================================================

include(${CMAKE_CURRENT_LIST_DIR}/LeptonicaTargets.cmake)

# ======================================================
#  Version variables:
# ======================================================

SET(Leptonica_VERSION           1.74.3)
SET(Leptonica_VERSION_MAJOR     1)
SET(Leptonica_VERSION_MINOR     74)
SET(Leptonica_VERSION_PATCH     3)

# ======================================================
# Include directories to add to the user project:
# ======================================================

# Provide the include directories to the caller
set(Leptonica_INCLUDE_DIRS C:/Program Files (x86)/leptonica/include;C:/Program Files (x86)/leptonica/include/leptonica)

# ====================================================================
# Link libraries:
# ====================================================================

set(Leptonica_LIBRARIES leptonica)
