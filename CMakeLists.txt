cmake_minimum_required(VERSION 3.16)

project(CloudMusic VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appCloudMusic
    main.cpp
)

qt_add_qml_module(appCloudMusic
    URI CloudMusic
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES src/main/leftMenu/LeftMenu.qml
    QML_FILES src/main/bottomControl/BottomControl.qml
    QML_FILES src/main/mainContent/MainContent.qml
    QML_FILES src/components/BaseWindow.qml
    RESOURCES resources/iconFont/iconfont.ttf
    QML_FILES src/components/BaseIconFont.qml
    QML_FILES src/main/mainContent/MinAndMax.qml
    QML_FILES src/basic/GlobalConfig.qml
    RESOURCES src/basic/qmldir
    QML_FILES src/main/mainContent/TopHeader.qml
    QML_FILES src/main/mainContent/stackPages/Settings.qml
    QML_FILES src/main/mainContent/stackPages/CloudMusicCherryPick.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCloudMusic PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCloudMusic
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCloudMusic
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appCloudMusic
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
