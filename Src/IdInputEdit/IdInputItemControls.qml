import QtQuick

Item {
    id: root
    width: 200
    height: 40

    // 属性接口
    property alias componentWidth: root.width
    property alias componentHeight: root.height
    property alias imageSource: avatarImage.source
    property alias inputText: textInput.text
    property var dropdownList: []

    // 获取输入框内容
    function getInputText() {
        return textInput.text
    }

    // 设置下拉框内容列表
    function setDropdownList(list) {
        dropdownList = list
    }

    Row {
        anchors.fill: parent
        spacing: 10

        Image {
            id: avatarImage
            width: parent.width * 0.1
            height: parent.height
            source: "avatar.png"
        }

        TextInput {
            id: textInput
            width: parent.width * 0.7
            height: parent.height
        }

        Rectangle {
            id: dropdown
            width: parent.width * 0.1
            height: parent.height
            border.color: "gray"
        }
    }
}
