/****************************************************************************
  **
  ** Copyright (C) 2015 The Qt Company Ltd.
  ** Contact: http://www.qt.io/licensing/
  **
  ** This file is part of the examples of the Qt Toolkit.
  **
  ** $QT_BEGIN_LICENSE:BSD$
  ** You may use this file under the terms of the BSD license as follows:
  **
  ** "Redistribution and use in source and binary forms, with or without
  ** modification, are permitted provided that the following conditions are
  ** met:
  **   * Redistributions of source code must retain the above copyright
  **     notice, this list of conditions and the following disclaimer.
  **   * Redistributions in binary form must reproduce the above copyright
  **     notice, this list of conditions and the following disclaimer in
  **     the documentation and/or other materials provided with the
  **     distribution.
  **   * Neither the name of The Qt Company Ltd nor the names of its
  **     contributors may be used to endorse or promote products derived
  **     from this software without specific prior written permission.
  **
  **
  ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
  **
  ** $QT_END_LICENSE$
  **
  ****************************************************************************/

import QtQuick 2.0
import "components"
import WeatherInfo 1.0

Rectangle {
    id: weatherWindow
    width: 660
    height: 640
    color: "black"
    state: "loading"

    states: [
        State {
            name: "loading"
            PropertyChanges { target: main; opacity: 0 }
            PropertyChanges { target: wait; opacity: 1 }
        },
        State {
            name: "ready"
            PropertyChanges { target: main; opacity: 1 }
            PropertyChanges { target: wait; opacity: 0 }
        }
    ]
    AppModel {
        id: model
        onReadyChanged: {
            if (model.ready)
                weatherWindow.state = "ready"
            else
                weatherWindow.state = "loading"
        }
    }
    Item {
        id: wait
        anchors.fill: parent

        Text {
            text: "Loading weather data..."
            anchors.centerIn: parent
            font.pointSize: 18
            color: "white"
        }
    }

    Item {
        id: main
        anchors.fill: parent

        Column {
            spacing: 6

            anchors {
                fill: parent
                topMargin: 6; bottomMargin: 6; leftMargin: 6; rightMargin: 6
            }

            Rectangle {
                width: parent.width
                height: 25
                color: "black"

                Text {
                    text: (model.hasValidCity ? model.city : "Unknown location") + (model.useGps ? " (GPS)" : "")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    //                      onClicked: {
                    //                          if (model.useGps) {
                    //                              model.useGps = false
                    //                              model.city = "Brisbane"
                    //                          } else {
                    //                              switch (model.city) {
                    //                              case "Brisbane":
                    //                                  model.city = "Oslo"
                    //                                  break
                    //                              case "Oslo":
                    //                                  model.city = "Helsinki"
                    //                                  break
                    //                              case "Helsinki":
                    //                                  model.city = "New York"
                    //                                  break
                    //                              case "New York":
                    //                                  model.useGps = true
                    //                                  break
                    //                              }
                    //                          }
                    //                      }
                }
            }

            BigForecastIcon {
                id: current

                width: main.width -12
                height: 2 * (main.height - 25 - 12) / 3

                weatherIcon: (model.hasValidWeather
                              ? model.weather.weatherIcon
                              : "01d")
                topText: (model.hasValidWeather
                          ? model.weather.temperature
                          : "??")
                bottomText: (model.hasValidWeather
                             ? model.weather.weatherDescription
                             : "No weather data")

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        model.refreshWeather()
                    }
                }
            }

            //              Row {
            //                  id: iconRow
            //                  spacing: 6

            //                  width: main.width - 12
            //                  height: (main.height - 25 - 24) / 3

            //                  property real iconWidth: iconRow.width / 4 - 10
            //                  property real iconHeight: iconRow.height

            ////                  ForecastIcon {
            ////                      id: forecast1
            ////                      width: iconRow.iconWidth
            ////                      height: iconRow.iconHeight

            ////                      topText: (model.hasValidWeather ?
            ////                                model.forecast[0].dayOfWeek : "??")
            ////                      bottomText: (model.hasValidWeather ?
            ////                                   model.forecast[0].temperature : "??/??")
            ////                      weatherIcon: (model.hasValidWeather ?
            ////                                model.forecast[0].weatherIcon : "01d")
            ////                  }
            ////                  ForecastIcon {
            ////                      id: forecast2
            ////                      width: iconRow.iconWidth
            ////                      height: iconRow.iconHeight

            ////                      topText: (model.hasValidWeather ?
            ////                                model.forecast[1].dayOfWeek : "??")
            ////                      bottomText: (model.hasValidWeather ?
            ////                                   model.forecast[1].temperature : "??/??")
            ////                      weatherIcon: (model.hasValidWeather ?
            ////                                model.forecast[1].weatherIcon : "01d")
            ////                  }
            ////                  ForecastIcon {
            ////                      id: forecast3
            ////                      width: iconRow.iconWidth
            ////                      height: iconRow.iconHeight

            ////                      topText: (model.hasValidWeather ?
            ////                                model.forecast[2].dayOfWeek : "??")
            ////                      bottomText: (model.hasValidWeather ?
            ////                                   model.forecast[2].temperature : "??/??")
            ////                      weatherIcon: (model.hasValidWeather ?
            ////                                model.forecast[2].weatherIcon : "01d")
            ////                  }
            ////                  ForecastIcon {
            ////                      id: forecast4
            ////                      width: iconRow.iconWidth
            ////                      height: iconRow.iconHeight

            ////                      topText: (model.hasValidWeather ?
            ////                                model.forecast[3].dayOfWeek : "??")
            ////                      bottomText: (model.hasValidWeather ?
            ////                                   model.forecast[3].temperature : "??/??")
            ////                      weatherIcon: (model.hasValidWeather ?
            ////                                model.forecast[3].weatherIcon : "01d")
            ////                  }

            //              }
        }
    }
}


