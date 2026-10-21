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

    property string stockName: "Apple Inc."
    property string stockSymbol: "AAPL"
    property string stockPrice: "145,32"
    property bool isStockpositive: true
    property string stockChange: "2,45"
    property color stockChangeColor: isStockpositive ? "green" : "red"


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
            color: window.colors.surface
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            RowLayout {
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

                // Screen mode toggle button
                Button {
                        text: window.lightMode ? qsTr("\u263D  Dark mode")
                                               : qsTr("\u263C  Light mode")
                        Layout.alignment: Qt.AlignRight
                        Layout.row:2
                        

                        contentItem: Text {
                            text: parent.text
                            color: window.colors.text
                            font: parent.font
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            implicitWidth: window.buttonWidth
                            implicitHeight: window.buttonHeight
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
            Layout.row: 1
            Layout.column: 0
            Layout.preferredWidth: grid.width * 0.80
            Layout.fillWidth: true
            Layout.fillHeight: true


            // Graph display area
            Rectangle {
                color: window.colors.background
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        // #####################################
        // Right Column where the balance and 
        // buttons are shown
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
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: window.colors.background
                

                // Column to align all the elements in the right column
                ColumnLayout {
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // Grid Layout to Display Balance and Profit in Percent
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: grid.height * 0.3
                        
                        // Spacing to separate this rectangle from others
                        Layout.topMargin: 4
                        Layout.bottomMargin: 2
                        Layout.leftMargin: 4
                        Layout.rightMargin: 8

                        // Style
                        radius: 4
                        color: window.colors.surface

                        GridLayout {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            columns: 2
                            rows: 2

                            Label {
                                Layout.column: 0
                                Layout.topMargin: 10
                                Layout.leftMargin: 8
                                text: "Balance"
                                color: window.colors.strongText
                                font.pixelSize: 16
                                
                            }

                            Rectangle {
                                id: accountBalanceDisplay
                                Layout.column: 0
                                Layout.row: 1
                                Layout.leftMargin: 8
                                Layout.preferredWidth: rightColumn.width * 0.45
                                Layout.preferredHeight: buttonHeight
                                color: window.colors.surface

                                Text {
                                    anchors.fill: parent
                                    text: accountBalance
                                    color: window.colors.text
                                    font.pixelSize: 24
                                    font.bold: true
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                }
                                
                            }
                            Item {
                                id: profitDisplay
                                Layout.column: 1
                                Layout.row: 1
                                Layout.preferredWidth: rightColumn.width * 0.45
                                Layout.preferredHeight: 32

                                Rectangle {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    width: 80
                                    height: 32
                                    radius: 4
                                    color: Qt.rgba(
                                               profitColor.r,
                                               profitColor.g,
                                               profitColor.b,
                                               0.2
                                           )

                                    Text {
                                        anchors.fill: parent
                                        text: profitPositive ? "+" + profitString + " %" : "-" + profitString + " %"
                                        color: profitColor
                                        font.pixelSize: 16
                                        font.bold: true
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }
                        }
                    }

                    ///
                        // If you want to add another section in the right column between StockDisplay and Account Display, this is the spot
                    /// 

                    // Stock Operations Area
                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: grid.height * 0.7 // Set the height of the buttons rectangle relative to the grid height

                        Layout.topMargin: 4
                        Layout.bottomMargin: 4
                        Layout.leftMargin: 4
                        Layout.rightMargin: 8

                        // Style
                        radius: 4  // makes the corners rounded
                        color: window.colors.surface

                            // Stock Information Display
                            GridLayout{
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.left: parent.left
                                anchors.right: parent.right
                                
                                columns: 2
                                rows: 2
                                Layout.fillWidth: true
                                

                                    // Displays the name of the stock
                                    Rectangle {
                                        id: stockNameDisplay
                                        Layout.column: 0
                                        Layout.row: 0
                                        Layout.leftMargin: 8
                                        Layout.preferredWidth: rightColumn.width * 0.45
                                        Layout.preferredHeight: buttonHeight
                                        color: window.colors.surface

                                        Text {
                                            anchors.fill: parent
                                            text: stockName
                                            color: window.colors.text
                                            font.pixelSize: 16
                                            horizontalAlignment: Text.AlignLeft
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }
                                
                                    Rectangle {
                                        id: stockSymbolDisplay
                                        Layout.column: 1
                                        Layout.row: 0
                                        Layout.preferredWidth: rightColumn.width * 0.45
                                        Layout.preferredHeight: buttonHeight
                                        color: window.colors.surface

                                        Text {
                                            rightPadding: 10
                                            anchors.fill: parent
                                            text: stockSymbol
                                            color: window.colors.text
                                            font.pixelSize: 16
                                            horizontalAlignment: Text.AlignRight
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }

                                    Label{
                                        id: stockPriceLabel
                                        Layout.column: 0
                                        Layout.row: 1
                                        Layout.leftMargin: 8
                                        Layout.preferredWidth: rightColumn.width * 0.45
                                        Layout.preferredHeight: buttonHeight
                                        text: stockPrice
                                        color: window.colors.text
                                        font.bold: true
                                        font.pixelSize: 24
                                        horizontalAlignment: Text.AlignLeft
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    Rectangle {
                                        id: stockChangeDisplay
                                        Layout.column: 1
                                        Layout.row: 1
                                        Layout.leftMargin: 8
                                        Layout.alignment: Qt.AlignRight
                                        Layout.rightMargin: 10
                                        Layout.preferredWidth: 80
                                        Layout.preferredHeight: 32
                                        radius: 4
                                        color: Qt.rgba(
                                                   stockChangeColor.r,
                                                   stockChangeColor.g,
                                                   stockChangeColor.b,
                                                   0.2
                                               )

                                        Text {
                                            anchors.fill: parent
                                            text: isStockpositive
                                                  ? "+" + stockChange + " %"
                                                  : "-" + stockChange + " %"
                                            color: stockChangeColor
                                            font.pixelSize: 16
                                            font.bold: true
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }
                            }

                            // Grid Layout for the Buttons Buy, Sell, Reverse and Flat
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
                                    color: window.colors.text
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
                                    color: window.colors.text
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
                                contentItem: Text {
                                    text: "Reverse"
                                    color: window.colors.text
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
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
                                Layout.preferredHeight: buttonHeight
                                radius: 4
                                contentItem: Text {
                                    text: "Flat"
                                    color: window.colors.text
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
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