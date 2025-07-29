import QtQuick
import '../basic'

Window {
    id:baseWindow
    visible: true
    // 设置无边框窗口，Qt.FramelessWindowHint设置无边框，Qt.Window保留任务栏图标
    flags: Qt.FramelessWindowHint | Qt.Window
    // 加载字体图标
    FontLoader{
        source: "/CloudMusic/resources/iconFont/iconfont.ttf"
    }
    // 窗口拖拽
    MouseArea{
        anchors.fill: parent
        // 记录鼠标按下的坐标点
        property point clickPosition: "0,0"
        onPressed: function(event){
            // 鼠标按下事件
            clickPosition = Qt.point(event.x,event.y)
        }
        onPositionChanged: function(event){
            // 鼠标按下后移动事件
            let delta = Qt.point(event.x - clickPosition.x, event.y - clickPosition.y)
            baseWindow.x += delta.x;
            baseWindow.y += delta.y;
        }

        onClicked: {
            // 触发信号槽
            GlobalConfig.clickBlankArea()
        }
    }
}
