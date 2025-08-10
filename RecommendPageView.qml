import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtQuick.Controls.Basic

// Api首字母必须大写，否则报错
import "./js/api.mjs" as Api

Item {
    Column {
        Text {
            text: '推荐内容'
        }
        Button {
            text: 'click'
            onClicked: {
                Api.getTopicsList().then(res => {
                                             console.log(res.data.success)
                                         })
            }
        }
    }
}
