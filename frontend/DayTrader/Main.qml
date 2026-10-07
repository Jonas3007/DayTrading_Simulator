import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic


ApplicationWindow {
    id: window
    width: 1600
    height: 900
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Trading Simulator")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: width < 400 ? 1 : 2
        rows: 2
        rowSpacing: 0
        columnSpacing: 0

        Rectangle {
            id: navBar
            color: window.lightMode ? window.light : window.dark
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.preferredHeight: 64
        }

        ColumnLayout {
            id: leftColumn 
            Layout.row: 1
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id: graphDisplay
                color: window.lightMode ? window.reallyLight : window.reallyDark
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        // Rectangle {
        //     id: mainPanel
        //     color: window.lightMode ? window.reallyLight : window.reallyDark
        //     Layout.row: 1
        //     Layout.column: 0
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }

        ColumnLayout {
            id: rightColumn
            Layout.row: 1
            Layout.column: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Rectangle {
                id: rectangle1
                color: window.lightMode ? window.light : window.dark
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}




 // Button {
                //     id: button1
                //     text: window.lightMode ? qsTr("\u263D  Dark mode")
                //                            : qsTr("\u263C  Light mode")
                //     Layout.bottomMargin: 16
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                //
                //     contentItem: Text {
                //         text: button1.text
                //         color: window.lightMode ? window.light : window.dark
                //         font: button1.font
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //     }
                //
                //     background: Rectangle {
                //         implicitWidth: 120
                //         implicitHeight: 36
                //         radius: 8
                //         color: window.lightMode ? window.dark : window.light
                //     }
                //
                //     onClicked: window.lightMode = !window.lightMode
                // }