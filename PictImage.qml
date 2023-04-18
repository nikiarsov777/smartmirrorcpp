import QtQuick 2.0

Image {
    id: imgCal
    property bool fullScreen: false
    property var pictX: 0
    property var pictY: 0
    property var pictZ: 0
    property var pictW: 0
    property var pictH: 0
    z:1

//                source: photoDirectoryFileDialog + "/batak1.jpg"
    source: "http://smirror.test/images/default/0_shili_kamik.jpg"
    smooth:  true
    //                                fillMode: Image.PreserveAspectFit
    width: mirrorCalendar.width
    height: 240
    MouseArea
    {
        width: parent.width
        height: parent.height
        propagateComposedEvents: true
        onDoubleClicked: resizeCalendarPict()
        drag.target: mirrorCalendar
    }


//                MouseArea
//                {
////                    anchors.fill: parent
////                    width: mirrorCalendar.width
////                    height: mirrorCalendar.height
////                    propagateComposedEvents: true
////                    onDoubleClicked: resizeCalendarPict()
//                    //                    onClicked:
//                    //                    {
//                    //                        //                        console.log(folderModel.get(folderModel.count-1, "fileName"))
//                    //                        //                        console.log ("fsdfsdf: " + i + " --- " + photoDirectoryFileDialog + "/" + folderModel.get (i, folderModel.fileName))
//                    //                        imgCal.source = photoDirectoryFileDialog + "/" + folderModel.get (i, "fileName")
//                    //                        i++
//                    //                    }
//                }
//                Component.onCompleted: {

//                    //                        changePict()
//                }

    function resizeCalendarPict() {
        if (!imgCal.fullScreen) {
            imgCal.pictX = mirrorCalendar.x
            imgCal.pictY = mirrorCalendar.y
            imgCal.pictZ = mirrorCalendar.z
            imgCal.pictW = imgCal.width
            imgCal.pictH = imgCal.height
            mirrorCalendar.x = window.x
            mirrorCalendar.y = window.y
            mirrorCalendar.z = 5
            imgCal.width=window.width
            imgCal.height=window.height
            imgCal.fullScreen = true
        } else {
            mirrorCalendar.x = imgCal.pictX
            mirrorCalendar.y = imgCal.pictY
            mirrorCalendar.z = 10
            imgCal.width=imgCal.pictW
            imgCal.height=imgCal.pictH
            imgCal.fullScreen = false
        }
    }
}
