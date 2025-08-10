import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// fix：QML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-referenceQML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-reference
import QtQuick.Controls.Basic


Rectangle{
    height: 60
    color: '#00aaaa'
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom

    RowLayout{
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.fill: parent
        MusicIconButton{
            iconSource: 'images/previous'
            toolTip: '上一首'
        }
        MusicIconButton{
            iconSource: 'images/stop'
            toolTip: '暂停/播放'
        }
        MusicIconButton{
            iconSource: 'images/next'
            toolTip: '下一曲'
        }
        Rectangle{
            Layout.fillWidth: true
            Rectangle{
                height: name.implicitHeight
                width: parent.width
                color: '#00000000'
                anchors.bottom: slider.top
                anchors.bottomMargin: 6
                Text {
                    id:name
                    anchors.left: parent.left
                    text: '你好'
                    color: '#fff'
                }
                Text {
                    anchors.right: parent.right
                    text: '00:00/05:30'
                    color: '#fff'
                }
            }
            Slider{
                id:slider
                width: parent.width
                background: Rectangle{
                    // 整个进度条
                    height: 4
                    radius: 2
                    width: parent.width
                    color: '#e9f4ff'
                    id:sliderInner
                    Rectangle{
                        // 已经拖拽的部分
                        width: sliderInner.width*slider.visualPosition
                        height: sliderInner.height
                        color: '#73a7ab'
                        radius: 2
                    }
                }
                // 拖拽的滑块
                handle: Rectangle{
                    color: '#f0f0f0'
                    border.color: '#73a7ab'
                    border.width: 0.5
                    width: 10
                    height: 10
                    radius: 5
                    x:(sliderInner.width-width)*slider.visualPosition
                    y: (sliderInner.height-height)/2
                }
            }
        }
        MusicIconButton{
            iconSource: 'images/favorite'
            toolTip: '我喜欢'
        }
        MusicIconButton{
            iconSource: 'images/repeat'
            toolTip: '重复播放'
        }
    }
}
