cmake_minimum_required(VERSION 3.16)

project(music_player VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 COMPONENTS Core5Compat REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appmusic_player
    main.cpp
    icon.rc
)

qt_add_qml_module(appmusic_player
    URI music_player
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES images/about.png images/background.png images/clear.png images/cloud.png images/cloud-white.png images/exit-small-window.png images/favorite.png images/favorite-big.png images/favorite-big-white.png images/full-screen.png images/grid.png images/history.png images/history-white.png images/loading.png images/local.png images/local-white.png images/minimize-screen.png images/music.ico images/music.png images/network-error.png images/next.png images/pause.png images/player.jpg images/play-list.png images/play-list-white.png images/power.png images/previous.png images/random.png images/recommend.png images/recommend-white.png images/repeat.png images/search.png images/single-repeat.png images/small-screen.png images/small-screen-white.png images/small-window.png images/stop.png images/video.png images/video-white.png
        QML_FILES TopBar.qml
        QML_FILES BottomView.qml
        QML_FILES MusicIconButton.qml
        QML_FILES TopBarButton.qml
        QML_FILES RoundImage.qml
        QML_FILES LeftMenu.qml
        QML_FILES RecommendPageView.qml
        QML_FILES SearchPageView.qml
        QML_FILES LocalPageView.qml
        QML_FILES HistoryPageView.qml
        QML_FILES FavoritePageView.qml
        QML_FILES js/request.mjs
        QML_FILES js/api.mjs
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmusic_player PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmusic_player
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmusic_player
    PRIVATE Qt6::Quick
)
target_link_libraries(appmusic_player
    PUBLIC Qt6::Core5Compat)
target_link_libraries(appmusic_player PRIVATE Qt6::Core)


include(GNUInstallDirs)
install(TARGETS appmusic_player
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
