import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "Theme"


ApplicationWindow {
    id: window
    width: 1600
    height: 900
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Trading Simulator")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property QtObject colors: lightMode ? lightColors : darkColors

    property int navBarHeight: 64
    property int buttonHeight: 40
    property int buttonWidth: 100
    property string accountBalance: "50.000,00"

    property string profitString: "0,00"
    property bool profitPositive: true
    property color profitColor: profitPositive ? "green" : "red"


    LightColors {
        id: lightColors
    }

    DarkColors {
        id: darkColors
    }

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: width < 400 ? 1 : 2
        rows: 2
        rowSpacing: 0
        columnSpacing: 0

        //
        // Navigation Bar at the top of the application
        //

        Rectangle {
            id: navBar
            color: window.colors.surface
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            RowLayout {
                id: navRow
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.verticalCenter: parent.verticalCenter

                TextField {
                    id: searchField
                    placeholderText: "Aktien-Kürzel eingeben (z.B. AAPL)..."
                    Layout.row: 0
                    Layout.leftMargin: 16
                    Layout.preferredWidth: 250
                    Layout.preferredHeight: 40
                    Layout.alignment: Qt.AlignVCenter
                    font.pixelSize: 14
                    color: window.colors.text
                    placeholderTextColor: window.colors.placeholder

                    background: Rectangle {
                        radius: 4
                        color: window.colors.background
                        border.color: searchField.activeFocus ? window.colors.accent : window.colors.border
                        border.width: 1
                    }

                    onAccepted: {
                        console.log("Search for: " + searchField.text)
                    }
                }

                // Pushes the screen mode button to the right edge of the navbar
                Item {
                    Layout.row: 1
                    Layout.fillWidth: true
                }

                Button {
                        id: screenModeButton
                        text: window.lightMode ? qsTr("\u263D  Dark mode")
                                               : qsTr("\u263C  Light mode")
                        Layout.alignment: Qt.AlignRight
                        Layout.row:2
                        

                        contentItem: Text {
                            text: screenModeButton.text
                            color: window.colors.text
                            font: screenModeButton.font
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            implicitWidth: buttonWidth
                            implicitHeight: buttonHeight
                            radius: 4
                            color: window.colors.surface
                            border.color: window.colors.border
                            border.width: 1
                        }

                        onClicked: window.lightMode = !window.lightMode
                    }

            }
        }

        // #####################################
        // Left Column where the graphs are shown 
        // #####################################

        ColumnLayout {

            id: leftColumn
            Layout.row: 1
            Layout.column: 0
            Layout.preferredWidth: grid.width * 0.80
            Layout.fillWidth: true
            Layout.fillHeight: true


            Rectangle {
                id: graphDisplay
                color: window.colors.background
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        // #####################################
        // Right Column where the balance and 
        //buttons are shown
        // #####################################

        ColumnLayout {
            id: rightColumn
            Layout.row: 1
            Layout.column: 1
            Layout.preferredWidth: grid.width * 0.2
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0


            Rectangle {
                id: backgroundRectangle_right
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: window.colors.background
                

                // Column to align all the elements in the right column
                ColumnLayout {
                    id: rightColumnLayout
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // Grid Layout to Display Balance and Profit in Percent
                    Rectangle {
                        id: balanceAndProfitRectangle
                        Layout.fillWidth: true
                        Layout.preferredHeight: grid.height * 0.4
                        
                        // Spacing to separate this rectangle from others
                        Layout.topMargin: 4
                        Layout.bottomMargin: 2
                        Layout.leftMargin: 4
                        Layout.rightMargin: 8

                        // Style
                        radius: 4
                        color: window.colors.surface

                        GridLayout {
                            id: balanceAndProfitGrid
                            columns: 2
                            rows: 2

                            Label {
                                Layout.column: 0
                                id: balanceLabel
                                Layout.topMargin: 10
                                Layout.leftMargin: 8
                                text: "Balance"
                                color: window.colors.strongText
                                font.pixelSize: 16
                                
                            }

                            Rectangle {
                                id: accountBalanceDisplay
                                Layout.column: 1
                                Layout.row: 1
                                Layout.leftMargin: 8
                                Text{
                                    anchors.left: parent.left
                                    text: accountBalance
                                    color: window.colors.strongText
                                    font.pixelSize: 26
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                
                            }
                            Rectangle{
                                id : profitDisplay
                                Layout.column: 1
                                Layout.row: 1
                                color: profitColor
                                radius: 4
                                opacity: 0.2

                                Text{
                                    text: profitPositive ? "+" + profitString + " %" : "-" + profitString + " %"
                                    color: profitColor
                                }
                                
                            }
                        }
                    }

                    // Grid Layout for the Buttons Buy, Sell, Reverse and Flat
                    Rectangle{
                        id: buttonsRectangle
                        Layout.fillWidth: true
                        Layout.preferredHeight: grid.height * 0.6

                        Layout.topMargin: 4
                        Layout.bottomMargin: 4
                        Layout.leftMargin: 4
                        Layout.rightMargin: 8

                        // Style
                        radius: 4  // makes the corners rounded
                        color: window.colors.surface

                            GridLayout {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            id: buttonsGrid
                            columns: 2
                            rows: 2

                            RoundButton {
                                id: buyButton
                                Layout.preferredWidth: buttonWidth
                                Layout.preferredHeight: buttonHeight
                                Layout.row: 0
                                text: "Buy"
                                radius: 4
                                background: Rectangle {
                                    radius: buyButton.radius
                                    color: window.colors.greenAccent
                                    opacity: buyButton.down ? 0.75 : 1
                                    scale: buyButton.down ? 0.96 : 1
                                    Behavior on opacity { NumberAnimation { duration: 100 } }
                                    Behavior on scale { NumberAnimation { duration: 100 } }
                                }
                                contentItem: Text {
                                    text: "Buy"
                                    color: "white"
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: console.log("Buy clicked")
                            }
                            RoundButton {
                                id: sellButton
                                Layout.preferredWidth: buttonWidth
                                Layout.preferredHeight: buttonHeight
                                Layout.row: 0
                                Layout.column: 1
                                text: "Sell"
                                radius: 4
                                background: Rectangle {
                                    radius: sellButton.radius
                                    color: window.colors.redAccent
                                    opacity: sellButton.down ? 0.75 : 1
                                    scale: sellButton.down ? 0.96 : 1
                                    Behavior on opacity { NumberAnimation { duration: 100 } }
                                    Behavior on scale { NumberAnimation { duration: 100 } }
                                }
                                contentItem: Text {
                                    text: "Sell"
                                    color: "white"
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: console.log("Sell clicked")
                            }
                            RoundButton {
                                id: reverseButton
                                Layout.preferredWidth: buttonWidth
                                Layout.row: 1
                                Layout.column: 0
                                text: "Reverse"
                                Layout.preferredHeight: buttonHeight
                                radius: 4
                                background: Rectangle {
                                    radius: reverseButton.radius
                                    color: window.colors.accent
                                    opacity: reverseButton.down ? 0.75 : 1
                                    scale: reverseButton.down ? 0.96 : 1
                                    Behavior on opacity { NumberAnimation { duration: 100 } }
                                    Behavior on scale { NumberAnimation { duration: 100 } }
                                }
                                onClicked: console.log("Reverse clicked")
                            }
                            RoundButton {
                                id: flatButton
                                Layout.preferredWidth: buttonWidth
                                Layout.row: 1
                                Layout.column: 1
                                text: "Flat"
                                Layout.preferredHeight: buttonHeight
                                radius: 4
                                background: Rectangle {
                                    radius: flatButton.radius
                                    color: window.colors.accent
                                    opacity: flatButton.down ? 0.75 : 1
                                    scale: flatButton.down ? 0.96 : 1
                                    Behavior on opacity { NumberAnimation { duration: 100 } }
                                    Behavior on scale { NumberAnimation { duration: 100 } }
                                }
                                onClicked: console.log("Flat clicked")
                            }
                        }
                    }
                }
            }
        }
    }
}

