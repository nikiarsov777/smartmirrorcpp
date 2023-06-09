import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.1
import QtQuick.Controls.Material 2.0
import CStyle 1.0
import StyleModel 1.0
import PositionModel 1.0
import Qt.labs.folderlistmodel 2.2
import Qt.labs.settings 1.1
import Media 1.0
import "qrc:HttpRequests.js" as HttpRequest
import ConfigMenu 1.0

//import WeatherInfo 1.0
//import "WeatherInfo.qml"


ApplicationWindow {
    id: window
//    objectName: window
    visible: true
    visibility: "FullScreen"
    width: 640
    height: 480
    title: qsTr("Calendar")
    color: "black"

    //    property var photoDirectoryFileDialog: "file:/home/niki/Pictures/Пазарджик/"
    property alias photoDirectoryFileDialog: folderModel.folder
    //    property var photoDirectoryFileDialog: ""
    property var i: 0
    property var show: false
    property var token: ""
    property var userId: ""
    property var mediaUrl: ""
    property alias loaderMedia: media.sourceComponent
    property int mediaX: 0
    property int mediaY: 0
//    property var newUrl: "https://www.youtube.com/embed/n3K_iu2acE0?autoplay=1"




    Rectangle {
        id: mainLayout
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        color: "black"
        LoginPage {
            id:login
            width: 400
            height: 300
            color: blue
        }

        //Menu
        ConfigMenu {
            id: menu
        }


//        MouseArea {
//            id: mouseAreaCalendar
//            anchors.fill: mirrorCalendar

//        }

//        Media {
//            id: mediaB
//            Settings {
//                property string state: "default"
//                property alias mediaX: media.x
//                property alias mediaY: media.y
//            }
//        }


        Rectangle{
            width: 600
            height: 400
            id:rectMedia
            visible: window.show
            Loader {
                id:media
                anchors.fill: parent
            }
            Settings {
                property alias mediaX: rectMedia.x
                property alias mediaY: rectMedia.y
            }
        }


        Column {
            id: rectClock
            visible: window.show

            Clock {
                id:clockItem
                width: 200
                height: 230
            }
            WeatherInfo {
                id: rectWeather
                width: 240
                height: 240

            }
            Settings {
                property alias mediaX: rectClock.x
                property alias mediaY: rectClock.y
            }
        }

        ListView
        {
            FolderListModel
            {
                //                property alias photoDirectoryFileDialog: window.photoDirectoryFileDialog
                //                property var photoDirectoryFileDialog: "file:/home/niki/Pictures/Пазарджик/"
                id: folderModel
                folder: ""
//                objectName: "folderModel"
                nameFilters: ["*.jpg"]
            }

            Component
            {
                id: fileDelegate
                Text { text: "" }
            }

            model:    folderModel
            delegate: fileDelegate
        }

        Column{
            property var radius: 0
            id:mirrorCalendar
            width: 420
            visible: window.show

            Settings {
//                property string state: "default"
                property alias calendarX: mirrorCalendar.x
                property alias calendarY: mirrorCalendar.y
                property alias radius: mirrorCalendar.radius
            }
//            Timer {
//                id: timer
//                repeat: true
//                running: true
//                interval: 5000
//                onTriggered: changePict()
//            }

            //PictImage
//            PictImage {
//                id:imageCalendar
//                width: 420
//                height: 240
//            }


            Loader {
                id:imageCalendar
                width: 420
                height: 240
            }

            Calendar {
                id: mCalendar
                width: 420
                height: 420
                radius: mirrorCalendar.radius

                //Drag.active: mouseAreaCalendar.drag.active
            }
        }
    }
    //    function changePict() {
    //        if(folderModel.get (i, "fileName") === undefined) {
    //            i=0
    //        }

    //        imageCalendar.source = photoDirectoryFileDialog + folderModel.get (i, "fileName")
    //        i++
    //    }


//    function changePict() {
//        let str = "count=" + i

//        HttpRequest.getImage("http://www.mirror.tceptt.com/api/images", str, "GET", imageCalendar)
//        i++
//    }



}

