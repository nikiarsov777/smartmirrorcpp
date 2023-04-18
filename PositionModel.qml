pragma Singleton
import QtQuick 2.0
import QtQuick.Controls.Material 2.12

ListModel {
    property var xEnd: 300
    property var yEnd: 300
    property var w: 450
    property var h: 450
    id: positionModel
    dynamicRoles: true
    Component.onCompleted: {
        var colors = getData();
        append(colors);
//        for (var i=0; i < colors.length; i++) {
//            append(colors[i]);
//        }
    }
//        ListElement {
//            styleId: 1;
//            text: "Left Top Corner";
//            x: 0
//            y: 0
//        }

//        ListElement {
//            styleId: 2;
//            text: "Right Top Corner";
//            x: 100
//            y: 0
//        }

    //    ListElement {
    //        styleId: 3;
    //        text: "Left Bottom Corner";
    //        x: positionModel.w
    //        y: 0
    //    }

    //    ListElement {
    //        styleId: 4;
    //        text: "Right Bottom Corner";
    //        x: positionModel.w
    //        y: positionModel.h
    //    }

    //    ListElement {
    //        styleId: 5;
    //        text: "Free Position";
    //        x: positionModel.w/2
    //        y: positionModel.h/2
    //    }

    //    ListElement {
    //        styleId: 5;
    //        text: "Optimal Position";
    //        x: positionModel.w/4
    //        y: positionModel.h/4
    //    }

//    function getData() {
//        var jsonString = "[\n         {\n        \"styleId\": 1,\n        \"text\": \"Left Top Corner\",\n        \"x\": 0,\n        \"y\": 0\n    },\n    {\n        \"styleId\": 1,\n        \"text\": \"Right Top Corner\",\n        \"x\": 100,\n        \"y\": 100\n    }\n  ]\n"
//        var JsonObject= JSON.parse(jsonString);
//        return JsonObject;
//    }
}
