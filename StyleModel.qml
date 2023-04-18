pragma Singleton
import QtQuick 2.0
import QtQuick.Controls.Material 2.12

ListModel {
    id: model
    ListElement {
        styleId: 1;
        text: "Style Default";
        color: "black";
        styleNavBarColor: "white"
        defaultTextColor: "black"
        sameMonthDateTextColor: "black"
        selectedDateTextColor: "black"
        selectedDateBgColor: "silver"
        defaultDateBgColor: "green"
        radius: 45
    }

    ListElement {
        styleId: 2;
        text: "Style Fresh";
        color: "#800080";
        styleNavBarColor: "orange"
        defaultTextColor: "orange"
        sameMonthDateTextColor: "#FFFF00"
        selectedDateTextColor: "#FFFF00"
        selectedDateBgColor: "white"
        defaultDateBgColor: "red"
        radius: 35
    }

    ListElement {
        styleId: 3;
        text: "Style Free";
        color: "#0000FF";
        styleNavBarColor: "yellow"
        defaultTextColor: "blue"
        sameMonthDateTextColor: "#FF00FF"
        selectedDateTextColor: "#FF00FF"
        selectedDateBgColor: "white"
        defaultDateBgColor: "green"
        radius: 25
    }

    ListElement {
        styleId: 4;
        text: "Style Balkan";
        color: "#FFFF00";
        styleNavBarColor: "blue"
        defaultTextColor: "yellow"
        sameMonthDateTextColor: "#00FFFF"
        selectedDateTextColor: "#00FFFF"
        selectedDateBgColor: "white"
        defaultDateBgColor: "green"
        radius: 15
    }

    ListElement {
        styleId: 5;
        text: "Style Sofia";
        color: "#FF0000";
        styleNavBarColor: "black"
        defaultTextColor: "red"
        sameMonthDateTextColor: "#FFFF55"
        selectedDateTextColor: "#FFFF55"
        selectedDateBgColor: "white"
        defaultDateBgColor: "green"
        radius: 5
    }

    ListElement {
        styleId: 5;
        text: "Style Clear";
        color: "#FF0000";
        styleNavBarColor: "orange"
        defaultTextColor: "blak"
        sameMonthDateTextColor: "#FFFF55"
        selectedDateTextColor: "#FFFF55"
        selectedDateBgColor: "white"
        defaultDateBgColor: "green"
        radius: 0
    }

}
