import QtQuick

Window {
    id:window
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")
    // 设置无边框窗口，Qt.FramelessWindowHint设置无边框，Qt.Window保留任务栏图标
    flags: Qt.FramelessWindowHint | Qt.Window

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
            window.x += delta.x;
            window.y += delta.y;
        }
    }

    // 左侧菜单栏
    Rectangle{
        id:leftRect
        width:255
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        color: '#1a1a21'
    }

    // 右侧主内容区
    Rectangle{
        id:rightRect
        anchors.left: leftRect.right
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        anchors.right: parent.right
        color: '#13131a'
    }

    // 底部区域
    Rectangle{
        id:bottomRect
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: '#2d2d37'
    }
}
