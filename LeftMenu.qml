import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// fix：QML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-referenceQML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-reference
import QtQuick.Controls.Basic

Rectangle {
    id: _leftMenu
    signal itemClick(var data)
    width: 160
    color: '#aa00aaaa'
    ColumnLayout {
        anchors.fill: parent
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            RoundImage {
                anchors.centerIn: parent
                height: 100
                width: 100
                borderRadius: 100
            }
        }
        ListView {
            id: menuListView
            clip: true
            boundsMovement: Flickable.StopAtBounds
            boundsBehavior: Flickable.DragAndOvershootBounds
            Layout.fillWidth: true
            Layout.fillHeight: true
            // 高亮
            highlight: Rectangle {
                color: '#aa73a7ab'
            }
            // 取消高亮过度动画
            highlightMoveDuration: 0
            model: ListModel {
                ListElement {
                    name: '推荐内容'
                    icon: 'recommend-white'
                    qml: 'RecommendPageView.qml'
                }
                ListElement {
                    name: '搜索音乐'
                    icon: 'cloud-white'
                    qml: 'SearchPageView.qml'
                }
                ListElement {
                    name: '本地音乐'
                    icon: 'local-white'
                    qml: 'LocalPageView.qml'
                }
                ListElement {
                    name: '播放历史'
                    icon: 'history-white'
                    qml: 'HistoryPageView.qml'
                }
                ListElement {
                    name: '我喜欢的'
                    icon: 'favorite-big-white'
                    qml: 'FavoritePageView.qml'
                }
                ListElement {
                    name: '专辑歌单'
                    icon: 'favorite-big-white'
                    qml: ''
                }
            }
            delegate: Rectangle {
                height: 50
                width: parent.width
                color: '#aa00aaaa'
                Row {
                    spacing: 15
                    anchors.centerIn: parent
                    Image {
                        source: `./images/${icon}.png`
                        width: 20
                        height: 20
                    }
                    Text {
                        text: name
                        font.pixelSize: 12
                        color: '#fff'
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        color = '#aa73a7ab'
                    }
                    onExited: {
                        color = '#aa00aaaa'
                    }
                    onClicked: {
                        menuListView.currentIndex = index
                        if (_leftMenu.itemClick) {
                            _leftMenu.itemClick({
                                                    "qml": qml
                                                })
                        }
                    }
                }
            }
        }
    }
}
