
// https://doc.qt.io/qt-6.8/qtqml-javascript-imports.html

import {request} from "./request.mjs";




export function getTopicsList() {
    return request.get('/topics?page=1&limit=2&mdrender=false')
}


