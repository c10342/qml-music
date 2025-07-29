import QtQuick
import '../../components'

Row{
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right
    anchors.rightMargin:10
    spacing: 10
    BaseIconFont{
        name:'minimize'
        anchors.verticalCenter: parent.verticalCenter
        onClick: {
            window.showMinimized()
        }
    }
    BaseIconFont{
        name:'maximize'
        visible: window.visibility!==Window.Maximized
        anchors.verticalCenter: parent.verticalCenter
        onClick: {
            window.showMaximized()
        }
    }
    BaseIconFont{
        name:'restore'
        visible: window.visibility===Window.Maximized
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 18
        onClick: {
            window.showNormal()
        }
    }
    BaseIconFont{
        name:'close'
        font.pixelSize: 24
        anchors.verticalCenter: parent.verticalCenter
        onClick: {
            Qt.quit()
        }
    }

}
