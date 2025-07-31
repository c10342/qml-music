import QtQuick 2.15
import QtQuick.Controls

Item {
    // anchors.fill: parent
    Column{
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 10
        anchors.centerIn: parent
        Text {
            text: '音乐'
            color: 'white'
            font.pixelSize: 20
        }

        Button{
            text: '设置页'
            onClicked: {
                stackView.push('Settings.qml')
            }
        }
    }
}
