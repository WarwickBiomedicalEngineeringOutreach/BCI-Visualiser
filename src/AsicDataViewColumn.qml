import QtQuick 2.4

Item {
    id: dataColumnRoot
    width: 50
    height: 100

    property int value : 50
    property color barColor : "green"

    Rectangle {
        id: dataVisualisationColumn
        width: parent.width
        height: dataColumnRoot.value/100 * dataColumnRoot.height
        anchors.bottom: parent.bottom
        color: barColor
    }

}
