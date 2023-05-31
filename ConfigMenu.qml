import QtQuick 2.12
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.0
import CStyle 1.0
import StyleModel 1.0
import PositionModel 1.0
import Qt.labs.folderlistmodel 2.2
import Qt.labs.settings 1.1
import "qrc:HttpRequests.js" as HttpRequest

Rectangle {
    id: menuRect
    width: 200
    height: 300
    color: "black"
    visible: false
    x: window.screen.width - 20 - menuForm.width

    property var isMenuGot: false
    Button {
        id: menuButton
        width: 20
        height: 20
        z: 999
        x: parent.width - 20
        style: ButtonStyle {
            background: Rectangle {
                color: "black"
                Text {
                    id: st_text
                    font.pointSize: 12
                    font.bold: false
                    color: "white"
                    text: "|||"
                    anchors.centerIn: parent
                }
            }
        }
        onClicked: {
            menuForm.visible = !menuForm.shown
            menuForm.shown = !menuForm.shown
        }
    }

    Rectangle {
        property bool shown: false
        id: menuForm
        visible: false
        anchors.fill: parent
//        width: 200
//        height: 250
        z: 1000
        x: window.screen.width - 20 - menuForm.width
        color: "black"
        border.color: "lightGrey"
        Column {
            anchors.fill: parent
            spacing: 16
            leftPadding: 10
            Column {
                spacing: 4
                Text {
                    color:"white"
                    text: "Style"
                }
                ComboBox {
                    id: combo
                    editable: false
                    model: StyleModel
                    width: 180
                    onAccepted: {
                        if (find(currentText) === -1) {
                            model.append({text: editText})
                            currentIndex = find(editText)
                        }
                    }
                    // onCurrentIndexChanged: mainLayout.color = currentText
                    onCurrentIndexChanged: {
                        var themItem = CStyle.getTheme(combo.currentIndex)
                        //mainLayout.color = themItem.color
                        mCalendar.styleNavBarColor = themItem.styleNavBarColor
                        mCalendar.defaultTextColor = themItem.defaultTextColor
                        mCalendar.sameMonthDateTextColor = themItem.sameMonthDateTextColor
                        mCalendar.selectedDateTextColor = themItem.selectedDateTextColor
                        mCalendar.selectedDateBgColor = themItem.selectedDateBgColor
                        mCalendar.defaultDateBgColor = themItem.defaultDateBgColor
                        mirrorCalendar.radius = themItem.text
                    }
                }
            }

            Column {
                spacing: 4
                Text {
                    color:"white"
                    text: "Positions"
                }
                ComboBox {
                    id: comboPosition
                    property var xEnd: 300
                    property var yEnd: 300
                    property var w: 450
                    property var h: 450
                    width: 180
                    editable: false
                    onCurrentIndexChanged: {
                        mirrorCalendar.x = comboPosition.model[comboPosition.currentIndex].calendarX
                        mirrorCalendar.y = comboPosition.model[comboPosition.currentIndex].calendarY
                        roundSlider.value = comboPosition.model[comboPosition.currentIndex].radius
                        rectMedia.x = comboPosition.model[comboPosition.currentIndex].mediaX
                        rectMedia.y = comboPosition.model[comboPosition.currentIndex].mediaY
                    }
                }

                Component.onCompleted: {
//                    let str= "width=" + window.screen.width + "&height=" + window.screen.height
//                    let calendarProperties = "&calendarW=" + mirrorCalendar.width + "&calendarH=" + mirrorCalendar.height + "&calendarX=" + mirrorCalendar.x + "&calendarY=" + mirrorCalendar.y
//                    let mediaProperties = "&mediaW=" + media.width + "&mediaH=" + media.height

//                    str += calendarProperties + mediaProperties
//                    str +=  '&type=style'
//                    HttpRequest.getOption("http://www.mirror.tceptt.com/api/clients/settings", str, "GET", comboPosition)
                }
            }

            Column {
                spacing: 4
                Text {
                    color:"white"
                    text: "Rounding"
                }
                Slider {
                    id: roundSlider
                    minimumValue: 0
                    maximumValue: 45
                    value: mCalendar.radius
                    stepSize: 1
                    width: menuForm.width - 20
                    Text {
                        id: roundText
                        anchors.centerIn: parent
                        text: roundSlider.value
                        color: "red"
                    }
                    updateValueWhileDragging: true
                    onValueChanged: {
                        mCalendar.radius = value
                        mirrorCalendar.radius = value
                    }
                }
            }
            Row {
              spacing: 4
              Button {
                  text: "Close"
                  width: menuRect.width * 0.9
                  height: 25
                  onClicked: {
                      menuForm.visible = !menuForm.shown
                      menuForm.shown = !menuForm.shown
                  }
              }
              //test@test.bg
            }
        }
    }
    Timer {
        id: timerMenu
        repeat: true
        running: true
        interval: 5000
        onTriggered: setConfigMenu()
    }
    function setConfigMenu() {
        let str= "width=" + window.screen.width + "&height=" + window.screen.height
        let calendarProperties = "&calendarW=" + mirrorCalendar.width + "&calendarH=" + mirrorCalendar.height + "&calendarX=" + mirrorCalendar.x + "&calendarY=" + mirrorCalendar.y
        let mediaProperties = "&mediaW=" + rectMedia.width + "&mediaH=" + rectMedia.height

        str += calendarProperties + mediaProperties
        str +=  '&type=style'
        if (window.token !== "" && !isMenuGot) {

            HttpRequest.getOption("http://www.mirror.tceptt.com/api/clients/settings", str, "GET", comboPosition)
            isMenuGot = true
        }
    }
}


