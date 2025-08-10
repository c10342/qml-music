import QtQuick

// https://blog.csdn.net/weixin_42125125/article/details/143958195
import Qt5Compat.GraphicalEffects

// 实现圆角图片

Item {
    property string imageSrc: "./images/player.jpg"
    property int borderRadius: 5

    Image {
        id:image
        source: imageSrc
        anchors.centerIn: parent
        // 平滑处理图片
        smooth: true
        // 默认要隐藏起来
        visible: false
        width: parent.width
        height:parent.height
        fillMode: Image.PreserveAspectCrop
        // 抗锯齿
        antialiasing: true
    }

    Rectangle{
        id:mask
        color: 'black'
        anchors.fill: parent
        radius: borderRadius
        // 默认要隐藏起来
        visible: false
        smooth: true
        antialiasing: true
    }

    OpacityMask{
        anchors.fill: image
        source: image
        maskSource: mask
        visible: true
        antialiasing: true
    }
}
