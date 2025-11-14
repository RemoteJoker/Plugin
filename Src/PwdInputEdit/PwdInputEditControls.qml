import QtQuick

Item {
    id: root
    width: 200
    height: 40

    property string salt: ""  // 盐值
    property string realInput: ""  // 真实输入值
    property string displayText: ""  // 显示文本（*号）

    // 设置盐值
    function setSalt(newSalt) {
        salt = newSalt
    }

    // 获取登录密码（哈希加盐后的密码）
    function getLoginPassword() {
        return hashPassword(realInput, salt)
    }

    // 哈希加盐算法
    function hashPassword(password, salt) {
        // 简单的哈希算法示例，实际项目中应该使用更安全的算法
        var combined = password + salt
        var hash = 0
        for (var i = 0; i < combined.length; i++) {
            var charCode = combined.charCodeAt(i)  // 修改变量名
            hash = ((hash << 5) - hash) + charCode
            hash = hash & hash // Convert to 32bit integer
        }
        return hash.toString()
    }

    // 处理输入
    function handleInput(text) {
        realInput += text
        displayText += "*"
        passwordInput.text = displayText
    }

    // 处理删除
    function handleBackspace() {
        if (realInput.length > 0) {
            realInput = realInput.slice(0, -1)
            displayText = displayText.slice(0, -1)
            passwordInput.text = displayText
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "lightgray"
        border.color: "gray"
        border.width: 1

        TextInput {
            id: passwordInput
            anchors.fill: parent
            anchors.margins: 5
            echoMode: TextInput.Password  // 自动显示为*号
            font.pixelSize: 14

            // 按键事件处理
            Keys.onPressed: function(event) {
                if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9) {
                    handleInput(event.text)
                    event.accepted = true
                } else if (event.key >= Qt.Key_A && event.key <= Qt.Key_Z) {
                    handleInput(event.text)
                    event.accepted = true
                } else if (event.key === Qt.Key_Backspace) {
                    handleBackspace()
                    event.accepted = true
                } else {
                    event.accepted = true  // 屏蔽其他按键
                }
            }
        }
    }
}
