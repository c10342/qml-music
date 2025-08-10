import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// fix：QML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-referenceQML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-reference
import QtQuick.Controls.Basic

ToolBar{
    id:toolBar
    // 记录点击小窗口播放前的窗口大小
    property int winWidth: mainWindow.width
    property int winHeight: mainWindow.height
    property bool isSmallScreen: false
    // Component.onCompleted: {
    //     mainWindow.visibilityChanged.connect(checkWindowState)
    // }
    // function checkWindowState() {
    //     if (mainWindow.visibility === Window.Maximized) {
    //         console.log("窗口已最大化");
    //     } else if (mainWindow.visibility === Window.Minimized) {
    //         console.log("窗口已最小化");
    //     } else if (mainWindow.visibility === Window.FullScreen) {
    //         console.log("窗口已全屏");
    //     } else {
    //         console.log("窗口已恢复");
    //     }
    // }
    background: Rectangle{
        color: '#00aaaa'
    }
    width: parent.width
    RowLayout{
        width: parent.width
        TopBarButton{
            iconSource: 'images/music.png'
            toolTip: 'music'
        }
        TopBarButton{
            iconSource: 'images/about.png'
            toolTip: '关于'
            onClick: {
                Qt.openUrlExternally('https://www.baidu.com/')
            }
        }
        TopBarButton{
            iconSource: 'images/small-window.png'
            toolTip: '小窗播放'
            visible: !isSmallScreen
            onClick: {
                toolBar.winWidth = mainWindow.width
                toolBar.winHeight = mainWindow.height
                toolBar.isSmallScreen = true
                setWinSize(330,650)
            }
        }
        TopBarButton{
            iconSource: 'images/exit-small-window.png'
            toolTip: '退出小窗播放'
            visible: isSmallScreen
            onClick: {
                toolBar.isSmallScreen = false
                setWinSize()
            }
        }
        Item {
            // 自动填充剩余的空间
            Layout.fillWidth: true
            height: 32
            Text {
                anchors.centerIn: parent
                text: 'music player'
                font.pixelSize: 14
            }
        }
        TopBarButton{
            iconSource: 'images/minimize-screen.png'
            toolTip: '最小化'
            onClick: {
                mainWindow.showMinimized()
            }
        }
        TopBarButton{
            iconSource: 'images/small-screen.png'
            toolTip: '还原'
            visible: mainWindow.visibility===Window.Maximized
            onClick: {
                mainWindow.showNormal()
            }
        }
        TopBarButton{
            iconSource: 'images/full-screen.png'
            toolTip: '全屏'
            visible: mainWindow.visibility!==Window.Maximized
            onClick: {
                mainWindow.showMaximized()
            }
        }
        TopBarButton{
            iconSource: 'images/power.png'
            toolTip: '退出'
            onClick: {
                Qt.quit()
            }
        }
    }

    function setWinSize(width=toolBar.winWidth,height=toolBar.winHeight){
        mainWindow.width=width
        mainWindow.height=height
        mainWindow.x = (Screen.desktopAvailableWidth-mainWindow.width)/2
        mainWindow.y = (Screen.desktopAvailableHeight-mainWindow.height)/2
    }
}
