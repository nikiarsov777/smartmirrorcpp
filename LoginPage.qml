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
    id: loginPage
    color: "transparent"
    x: window.screen.width/2 - loginPage.width/2
    y: window.screen.height/2 - loginPage.height
    width: 640
    height: 480
    signal registerClicked()
    z: 1000

    border.color: "#595959"
    border.width: 2
      Column {
        anchors.centerIn: parent
        spacing: 16
        Column {
          spacing: 4
          Label {
              id: messageText
              text: ""
          }

          Text{
              color: "white"
              text: "Email"
          }
          TextField {
              id: email
              width: loginPage.width*0.8
              height: 40
          }
        }
        Column {
          spacing: 4
          Text {
              color: "white"
              text: "Password"
          }
          TextField {
              id: password
              width: loginPage.width*0.8
              height: 40
              echoMode: TextInput.Password
          }
        }
        Row {
            width: 10
            height: 20
        }

        Row {
          spacing: 60
          anchors.horizontalCenter: parent.horizontalCenter
          Button {
              text: "Login"
              width: loginPage.width*0.8
              height: password.height
              onClicked: {
                  var str = "email=" + email.text + "&password=" + password.text
                  HttpRequest.login("http://www.mirror.tceptt.com/api/login", str, "POST", loginPage)
                  //                        window.show=true
              }
          }
//          Button { text: "Guest"; onClicked: console.log("guest") }
        }
      }
}



