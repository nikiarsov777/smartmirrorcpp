pragma Singleton
import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import StyleModel 1.0

Item {
    id: root

    property var theme:      Material.theme
    property var primary:    Material.primary
    property var accent:     Material.accent
    property var background: Material.background
    property var foreground: Material.foreground

    readonly property var primaryColor:      Material.color(primary)
    readonly property var accentColor:       Material.color(accent)
    readonly property var backgroundColor:   Material.color(background)
    readonly property var foregroundColor:   Material.color(foreground)

    function getMyColor(index){
        return root.colorNames[root.colors[index]]
    }
    function getTheme(index){
        return StyleModel.get(index)
    }
    Rectangle{

    }
}

