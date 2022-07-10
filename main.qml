import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    title: "My Application"
    minimumWidth: 640
    minimumHeight: 480
    visible: true

    function sendToBufferNumber(c) {
        const id_op = [controlplus, controlminus, controlmultiply, controldivide, controlequals]
        for (const i of id_op){
            i.enabled = true;
        }

        Calc.addToBuffer(c)
    }

    function sendToBufferOperation(c) {
        const id_op = [controlplus, controlminus, controlmultiply, controldivide, controlequals]
        for (const i of id_op){
            i.enabled = false;
        }

        Calc.addToBuffer(c)
    }

    function getResult() {
        const id_op = [controlplus, controlminus, controlmultiply, controldivide, controlequals]
        for (const i of id_op){
            i.enabled = false;
        }

        Calc.get_result()
    }

    GridLayout {
        columns: 2
        anchors.right: parent.right
        columnSpacing: parent.width/50
        rowSpacing: parent.height/40
        width: parent.width/2
        height: parent.height/4

        Button {
            id: controlplus
            text: "+"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferOperation('+')
            enabled: false
            opacity: enabled ? 1 : 0.4

            contentItem: Text {
                text: controlplus.text
                font.pixelSize: 50
                color: controlplus.down ? "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }
        Button {
            id: controlminus
            text: "-"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferOperation('-')
            enabled: false
            opacity: enabled ? 1 : 0.4

            contentItem: Text {
                text: controlminus.text
                font.pixelSize: 50
                color: controlminus.down ? "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Button {
            id: controlmultiply
            text: "*"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferOperation('*')
            enabled: false
            opacity: enabled ? 1 : 0.4

            contentItem: Text {
                text: controlmultiply.text
                font.pixelSize: 50
                color: controlmultiply.down ? "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Button {
            id: controldivide
            text: "/"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferOperation('/')
            enabled: false
            opacity: enabled ? 1 : 0.4

            contentItem: Text {
                text: controldivide.text
                font.pixelSize: 50
                color: controldivide.down ? "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    RowLayout {
        id: controlequals
        anchors.right: parent.right
        width: parent.width/2
        height: parent.height/8
        y: parent.height/4 + parent.height/40
        enabled: false
        opacity: enabled ? 1 : 0.4

        Button {
            text: "="
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: getResult()
        }
    }


    GridLayout {
        columns: 3
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        columnSpacing: parent.width/50
        rowSpacing: parent.height/40
        width: parent.width/2
        height: parent.height/2

        Button {
            text: "1"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('1')
        }
        Button {
            text: "2"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('2')
        }
        Button {
            text: "3"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('3')
        }
        Button {
            text: "4"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('4')
        }
        Button {
            text: "5"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('5')
        }
        Button {
            text: "6"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('6')
        }
        Button {
            text: "7"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('7')
        }
        Button {
            text: "8"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('8')
        }
        Button {
            text: "9"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('9')
        }
        Button {
            text: "AC"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: Calc.clean()
        }
        Button {
            text: "0"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: sendToBufferNumber('0')
        }
        Button {
            id: controldecimal
            text: "."
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                sendToBufferNumber('.')
            }
            opacity: enabled ? 1 : 0.4
        }
    }
}
