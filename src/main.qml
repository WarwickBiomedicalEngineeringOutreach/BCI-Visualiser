import QtQuick 2.4
import QtQuick.Controls 1.3

//import "ControllerView.qml"


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ControllerView {
        id: view1;

        anchors.fill: parent
    }


}
