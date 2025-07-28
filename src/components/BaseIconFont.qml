import QtQuick

Text {
    id:baseIconFont
    required property string name
    signal click;
    text: ""
    font.family: 'iconFont'
    font.pixelSize: 20
    color: "#fff"
    onNameChanged: {
        let iconMap = {
            close:"\ue61d",
            minimize:'\ue70d',
            restore:'\ue7bf',
            maximize:'\ue697'
        }
        let value = iconMap[name]
        baseIconFont.text = value
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(baseIconFont.click){
                baseIconFont.click()
            }
        }
    }
}
