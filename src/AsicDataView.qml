import QtQuick 2.4
import QtQuick.Layouts 1.1

Item {
    id: root

    height: 100
    width: 400

    function updateGraph(data) {
        deltaWaveColumn.value =     (data["delta"]    / 0xFFFFFF) * 100
        thetaWaveColumn.value =     (data["theta"]    / 0xFFFFFF) * 100
        lowAlphaWaveColumn.value =  (data["lowAlpha"] / 0xFFFFFF) * 100
        highAlphaWaveColumn.value = (data["highAlpha"]/ 0xFFFFFF) * 100
        lowBetaWaveColumn.value =   (data["lowBeta"]  / 0xFFFFFF) * 100
        highBetaWaveColumn.value =  (data["highBeta"] / 0xFFFFFF) * 100
        lowGammaWaveColumn.value =  (data["lowGamma"] / 0xFFFFFF) * 100
        midGammaWaveColumn.value =  (data["midGamma"] / 0xFFFFFF) * 100

    }

    RowLayout {
        id: rowLayer

        anchors.fill: root

        Layout.minimumWidth: 10*8
        Layout.minimumHeight: 50

        spacing: 0

        AsicDataViewColumn {
            id: deltaWaveColumn
            barColor: "red"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }
        AsicDataViewColumn {
            id: thetaWaveColumn
            barColor: "orange"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }
        AsicDataViewColumn {
            id: lowAlphaWaveColumn
            barColor: "green"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }
        AsicDataViewColumn {
            id: highAlphaWaveColumn
            barColor: "cyan"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }
        AsicDataViewColumn {
            id: lowBetaWaveColumn
            barColor: "yellow"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }
        AsicDataViewColumn {
            id: highBetaWaveColumn
            barColor: "magenta"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }

        AsicDataViewColumn {
            id: lowGammaWaveColumn
            barColor: "blue"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }

        AsicDataViewColumn {
            id: midGammaWaveColumn
            barColor: "purple"

            Layout.fillHeight: parent
            Layout.fillWidth: parent
        }

    }


}
