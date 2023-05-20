import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
//import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Material 2.0
//import Qt.labs.calendar 1.0



Calendar {
    id: calendar
    width: parent.width
    height: parent.height
    frameVisible: true
    weekNumbersVisible: false
    navigationBarVisible: true
    focus: true
    visible: window.show

    property var startDate: undefined
    property var stopDate: undefined

    property var styleNavBarColor: "green"
    property var defaultTextColor: "red"
    property var sameMonthDateTextColor: "green"
    property var selectedDateTextColor: "white"
    property var selectedDateBgColor: "black"
    property var defaultDateBgColor: "green"
    property int radius: 45

    style: CalendarStyle {
        id: calendarStyle
        gridVisible: true
        gridColor: "black"
        dayOfWeekDelegate: Rectangle {
            color: calendar.styleNavBarColor
            implicitHeight: 20
            Label {
                text: control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                color: "black"
                anchors.centerIn: parent
            }
        }
        navigationBar: Rectangle {
            height: 40
            color: styleNavBarColor

            Rectangle {
                color: styleNavBarColor
                height: 1
                width: parent.width
            }

            Rectangle {
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: styleNavBarColor
            }

            Label {
                id: dateText
                text: styleData.title
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
//                font.pixelSize: TextSingleton.implicitHeight * 1.25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: previousMonth.right
                anchors.leftMargin: 0
                anchors.right: nextMonth.left
                anchors.rightMargin: 20
                color: calendar.defaultTextColor
            }
            Button {
                id: previousMonth
                width: parent.height
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                onClicked: control.showPreviousMonth()
                iconSource: "assets/left.png"
            }

            Button {
                id: nextMonth
                width: parent.height
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                iconSource: "assets/right.png"
                onClicked: control.showNextMonth()
            }
        }

        dayDelegate: Rectangle {
            id: dayDelegateItem
            readonly property color defaultTextColor: calendar.defaultTextColor
            readonly property color sameMonthDateTextColor: calendar.sameMonthDateTextColor
            readonly property color selectedDateColor: "blue"
            readonly property color selectedDateTextColor: calendar.selectedDateTextColor
            readonly property color differentMonthDateTextColor: "red"
            readonly property color invalidDatecolor: "yellow"
            readonly property color selectedDateBgColor: calendar.selectedDateBgColor
            readonly property color defaultDateBgColor: calendar.defaultDateBgColor
            readonly property int radius: calendar.radius
            property var dateOnFocus: styleData.date.getDate()
            property var currentDate: styleData.date.getDate()

            color: "black"

            Rectangle{
                id:fl
                anchors.fill: parent
                radius: dayDelegateItem.radius
                color: {
                    return styleData.date !== undefined && styleData.selected ? calendar.defaultDateBgColor : calendar.selectedDateBgColor
                }
//                border.color: "black"
//                border.width: 1
            }

            MouseArea{
                anchors.fill: parent
                propagateComposedEvents: true
                drag.target: mirrorCalendar

            }

            Label {
                id: dayDelegateText
                text: styleData.date.getDate()
                anchors.centerIn: parent
                color: calendar.defaultTextColor
            }
        }
    }
}

