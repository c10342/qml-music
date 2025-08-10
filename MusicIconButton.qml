import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item{
    id:rootItem
    property string iconSource: ''
    property bool isCheckable: false
    property bool isChecked: false
    property string toolTip: ''
    Layout.preferredWidth: 30
    Layout.preferredHeight: 30
    Button{
        id:self
        icon.source: rootItem.iconSource
        icon.width: 22
        icon.height: 22
        icon.color: self.down||(rootItem.isChecked&&self.checked)?'#fff':'#e2f0f8'

        background: Rectangle{
            // 按钮是否被按下
            color: self.down||(rootItem.isChecked&&self.checked)?'#497563':'#20e9f4ff'
            radius: 3
        }
        // 鼠标悬停上去的提示
        ToolTip.text: rootItem.toolTip
        ToolTip.visible: self.hovered

        checkable: rootItem.isCheckable
        checked: rootItem.isChecked

        width: rootItem.width
        height: rootItem.height
    }
}


