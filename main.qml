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
//    property var newUrl: "https://www.youtube.com/embed/n3K_iu2acE0?autoplay=1"


    Rectangle {
        id: mainLayout
        anchors.fill: parent
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
//            id: media
//            Settings {
//                property string state: "default"
//                property alias mediaX: media.x
//                property alias mediaY: media.y
//            }
//        }


        Loader {
            id:media
            width: 420
            height: 240
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

//        HttpRequest.getImage("http://smirror.test/api/images", str, "GET", imageCalendar)
//        i++
//    }

}

