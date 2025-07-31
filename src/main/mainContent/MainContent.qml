import QtQuick
import QtQuick.Controls
import '../../basic'
import './stackPages'

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
            // console.log('click')
        }
    }

    TopHeader{
        id:topHeader
    }

    StackView{
        id:stackView
        anchors.top: topHeader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        // initialItem: CloudMusicCherryPick{}
        initialItem: Settings{}
    }


    // CheckBox {
    //     anchors.centerIn: parent
    //     text: "接受用户协议"
    //     checked: true
    //     onToggled: {
    //         if (checked) console.log("协议已接受");
    //         else console.log("协议已拒绝");
    //     }
    // }
}
