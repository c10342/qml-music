import QtQuick
import "./src/main/leftMenu"
import "./src/main/bottomControl"
import "./src/main/mainContent"
import "./src/components"

BaseWindow {
    id:window
    width: 1000
    height: 600


    // 左侧菜单栏
    LeftMenu{
        id:leftMenu
    }

    // 右侧主内容区
    MainContent{
        id:mainContent
    }

    // 底部区域
    BottomControl{
        id:bottomControl
    }
}
