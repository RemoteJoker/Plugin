cmake_minimum_required(VERSION 3.16)

project(IdInputEdit VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_library(IdInputEdit SHARED)
qt_add_qml_module(IdInputEdit
    URI IdInputEdit
    VERSION 1.0
    QML_FILES IdInputItemControls.qml
    SOURCES idinputitem.cpp idinputitem.h
)

set_target_properties(IdInputEdit PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(IdInputEdit
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(IdInputEdit
    PRIVATE Qt6::Quick)

target_include_directories(IdInputEdit PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

