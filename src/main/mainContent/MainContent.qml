import QtQuick
import '../../components'
import QtQuick.Controls
import '../../basic'

// 右侧主内容区
Rectangle{
    id:mainContent
    anchors.left: leftMenu.right
    anchors.top: parent.top
    anchors.bottom: bottomControl.top
    anchors.right: parent.right
    color: '#13131a'
    // 连接信号槽
    Connections{
        target: GlobalConfig
        // 信号槽处理函数
        function onClickBlankArea(){
            console.log('click')
        }
    }
    Rectangle{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        color:'transparent'
        Row{
            anchors.leftMargin: 10
            anchors.left: parent.left
            height: 30
            anchors.verticalCenter: parent.verticalCenter

            Rectangle{
                height: parent.height
                width:240
                color: "transparent"
                TextField{
                    id:searchTextField
                    anchors.fill: parent
                    // 光标和文字垂直居中
                    verticalAlignment: Text.AlignVCenter
                    color: '#fff'
                    leftPadding:30
                    background: Rectangle{
                        BaseIconFont{
                            name:'search'
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            // 提高层级，防止被下面的组件遮挡
                            z:10
                            font.pixelSize: 14
                            anchors.leftMargin: 10
                        }
                        // 外部矩形
                        anchors.fill: parent
                        radius: 8
                        // 设置渐变
                        gradient: Gradient{
                            orientation: Gradient.Horizontal
                            GradientStop{color: '#21283d';position: 0}
                            GradientStop{color: '#382635';position: 1}
                        }
                        Rectangle{
                            radius: 8
                            // 内部矩形，给外部矩形永远小1像素，这样就可以实现外部矩形边框渐变
                            anchors.fill: parent
                            anchors.margins: 1
                            // 设置渐变
                            gradient: Gradient{
                                orientation: Gradient.Horizontal
                                GradientStop{color: '#1a1d29';position: 0}
                                GradientStop{color: '#241c26';position: 1}
                            }
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    propagateComposedEvents: true
                    onClicked:{
                        searchTextField.focus=true
                        searchPopup.open()
                    }
                }
            }


        }
        MinAndMax{}
    }

    ListModel{
        id:historyList
        ListElement{name:"千里之外"}
        ListElement{name:"遇到"}
        ListElement{name:"哪里都是你"}
        ListElement{name:"入戏太深"}
        ListElement{name:"The Girl"}
        ListElement{name:"素颜"}
        ListElement{name:"他说"}
        ListElement{name:"ABC"}
        ListElement{name:"其他"}
    }

    // 弹框
    Popup{
        id:searchPopup
        width: searchTextField.width
        height: 300
        y:50
        x:searchTextField.x+10
        background: Rectangle{
            anchors.fill: parent
            color: '#2d2d37'
            radius: 8
            Column{
                spacing: 10
                anchors.left: parent.left
                anchors.right: parent.right
                Row{
                    anchors.margins: 4
                    spacing: 10
                    Label{
                        color: '#ddd'
                        text: '新增'
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                historyList.append({name:'test'})
                            }
                        }
                    }
                    Label{
                        color: '#ddd'
                        text: '删除'
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                historyList.remove(1,1)
                            }
                        }
                    }
                    Label{
                        color: '#ddd'
                        text: '清空'
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                historyList.clear()
                            }
                        }
                    }
                }
                Flow{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 10
                    anchors.margins: 4
                    Repeater{
                        model: historyList
                        delegate: Rectangle{
                            id:historyItem
                            height: dataLabel.implicitHeight+10
                            border.width: 1
                            border.color: '#45454e'
                            color: '#2d2d37'
                            radius: 10
                            // 宽度根据label的宽度来，即自适应
                            // implicitWidth表示控件占据的实际大小
                            width: dataLabel.implicitWidth+20
                            Label{
                                id:dataLabel
                                text: name
                                font.pixelSize: 12
                                color: '#ddd'
                                // height: 25
                                anchors.centerIn: parent
                            }
                            MouseArea{
                                anchors.fill: parent
                                // 处理鼠标进入进出的事件
                                hoverEnabled: true
                                onEntered: {
                                    // 鼠标进入
                                    dataLabel.color='#fff'
                                    historyItem.color='#393943'
                                    // 改变鼠标的形状
                                    cursorShape=Qt.PointingHandCursor
                                }
                                onExited: {
                                    // 鼠标移出
                                    dataLabel.color='#ddd'
                                    historyItem.color='#2d2d37'
                                    // 改变鼠标的形状
                                    cursorShape=Qt.ArrowCursor
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
