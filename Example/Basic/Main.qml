import QtQuick
import QtQuick.Window
import IdInputEdit
import PwdInputEdit

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    IdInputItem {  // 根据 qmldir 中的名称
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    PwdInputEdit {  // 假设 PwdInputEdit 的组件名
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
