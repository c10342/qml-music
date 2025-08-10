import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id:rootItem
    property string iconSource: ''
    property bool isCheckable: false
    property bool isChecked: false
    property string toolTip: ''
    width: 32
    height: 32
    signal click;
    ToolButton{
        id:self
        icon.source: iconSource
        width: rootItem.width
        height: rootItem.height
        icon.color: self.down||(rootItem.isChecked&&self.checked)?'#00000000':'#eee'

        background: Rectangle{
            // 按钮是否被按下
            color: self.down||(rootItem.isChecked&&self.checked)?'#eee':'#00000000'
        }
        // 鼠标悬停上去的提示
        ToolTip.text: rootItem.toolTip
        ToolTip.visible: self.hovered
        onClicked: {
            if(rootItem.click){
                rootItem.click()
            }
        }
    }
}
