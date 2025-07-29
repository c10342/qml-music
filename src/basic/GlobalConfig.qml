pragma Singleton // 要在 QML 中定义单例，首先要在文件顶部添加
import QtQuick 2.15

QtObject {
    // 声明一个信号
    signal clickBlankArea() // 窗口空白区域点击
}
