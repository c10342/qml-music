import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// fix：QML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-referenceQML QQuickRectangle: The current style does not support customization of this control (property: "background" item: QQuickRectangle(0x1891447c1a0, parent=0x0, geometry=0,0 0x4)). Please customize a non-native style (such as Basic, Fusion, Material, etc). For more information, see: https://doc.qt.io/qt-6/qtquickcontrols2-customize.html#customization-reference
import QtQuick.Controls.Basic


ApplicationWindow {
    id:mainWindow
    width: 740
    height: 580
    visible: true
    title: qsTr("Hello World")

    // onVisibilityChanged: {
    //     if (mainWindow.visibility === Window.Maximized) {
    //         console.log("窗口已最大化");
    //     } else if (mainWindow.visibility === Window.Minimized) {
    //         console.log("窗口已最小化");
    //     } else if (mainWindow.visibility === Window.FullScreen) {
    //         console.log("窗口已全屏");
    //     } else {
    //         console.log("窗口已恢复");
    //     }
    // }

    TopBar{
        id:toolBar
    }

    LeftMenu{
        id:left
        anchors.left: parent.left
        anchors.top: toolBar.bottom
        anchors.bottom: bottom.top
        onItemClick: function({qml}){
            pageViewLoader.setSource(qml)
        }
    }


    Rectangle{
        anchors.left: left.right
        anchors.right: parent.right
        anchors.bottom: bottom.top
        anchors.top: toolBar.bottom
        Loader{
            id:pageViewLoader;
            source: "RecommendPageView.qml" ;
        }
    }


    BottomView{
        id:bottom
    }
}
