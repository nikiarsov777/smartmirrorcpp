import QtQuick 2.0
import QtWebEngine 1.8
import QtQuick.Controls 2.0

Rectangle {
    property var offset: 10
    property var url: ""
    property bool fullScreen: false
    property var mediarX: 0
    property var mediarY: 0
    property var mediarW: 0
    property var mediarH: 0

    id: mediar
    width: 450
    height: 350
    x: 100
    y: 200
    z:10
    color: "silver"

    visible: false

    Rectangle {
        //            anchors.fill: parent
        WebEngineView {
            id: webViewID
            width: mediar.width
            height: mediar.height - offset
            y: parent.y + offset
            backgroundColor: "black"
            settings.playbackRequiresUserGesture: false
            url: mediar.url
//            Component.onCompleted: {
//                webViewID.url = ""
//            }
        }
    }
    MouseArea{
        //            anchors.fill: parent
        width: parent.width
        height: 80
        propagateComposedEvents: true
        drag.target: mediar
        onDoubleClicked: resizeMedia();
    }

    function resizeMedia() {
        if (!mediar.fullScreen) {
            mediar.mediarX = mediar.x
            mediar.mediarY = mediar.y
            mediar.mediarW = mediar.width
            mediar.mediarH = mediar.height
            mediar.x = 0
            mediar.y = 0
            mediar.width=window.width
            mediar.height=window.height
            mediar.fullScreen = true
        } else {
            mediar.x = mediar.mediarX
            mediar.y = mediar.mediarY
            mediar.width=mediar.mediarW
            mediar.height=mediar.mediarH
            mediar.fullScreen = false
        }
    }
}
