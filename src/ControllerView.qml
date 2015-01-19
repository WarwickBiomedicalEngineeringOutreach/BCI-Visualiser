import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

import com.Warwick.MindWave 0.1

Rectangle {
    id: controllerView
    width: 600
    height: 800
    color: "black"

    MindWaveController {
        id: controller0;

        onAsicEegDataChanged: {
            graph.addElement(asicEegData)
            asicDataView.updateGraph(asicEegData)
        }

        onRaw16BitDataChanged: controller0SignalProcessor.addRaw16bitData(raw16BitData)

        //TODO: fix unrecognized symbols in QtCreator
        //        onSerialConnectionSuccess: {
        //            portNameInputButton.text = "Connected";
        //        }

        //        onSerialConnectionFailed: {
        //            portNameInputButton.text = "Connect"
        //            portNameInputButton.enabled = true;
        //        }
    }

    MindWaveSignalProcessor {
        id: controller0SignalProcessor

        onBci16BitDataLatestChanged: {
            rawDataGraph.addElement(value)
        }
    }


    RowLayout {
        id: rowLayer
        anchors.fill: parent
        ColumnLayout {
            id: infoLayer
            anchors.top: parent.top
            anchors.left: parent.left
            RowLayout {
                id: portNameBox

                TextInput {
                    id:portNameInput
                    color: "white"
                    text: "/dev/tty.MindWaveMobile-DevA"
                }
                Button {
                    id:portNameInputButton
                    text: "Connect"

                    onClicked: {
                        portNameInputButton.text = "Connecting...";
                        portNameInputButton.enabled = false;
                        controller0.portName = portNameInput.text;
                    }
                }

            }

            Text{
                color: "white"
                text: "Controller 0";
            }

            Text{
                color: "white"
                text: "Battery Level " + controller0.batteryData;
            }

            Text{
                color: "white"
                text: "Signal Strength " + controller0.signalData;
            }

            Text{
                color: "white"
                text: "Meditation Level " + controller0.meditationData;
            }

            Text{
                color: "white"
                text: "Attention Level " + controller0.attentionData;
            }

            Text{
                color: "white"
                text: "Raw 8-Bit Data " + controller0.raw8BitData;
            }

            Text{
                color: "white"
                text: "Raw 16-Bit Data " + controller0.raw16BitData;
            }

            Text{
                color: "white"
                text: "Heart Rate Data " + controller0.heartRateData;
            }

            Text{
                color: "white"
                text: "RR Interval Data " + controller0.rrIntervalData;
            }

            Text{
                color: "white"
                text: "ASIC Delta DATA : \n" + controller0.asicEegData["delta"]
            }

        }

        ColumnLayout {
            Layout.fillHeight: parent
            Layout.fillWidth: parent
            Graph {
                id: graph
                Layout.fillWidth: parent
                Layout.fillHeight: parent
            }

            AsicDataView {
                id: asicDataView

                Layout.fillWidth: parent
                Layout.fillHeight: parent

            }

            RawDataGraph {
                id: rawDataGraph
                Layout.fillHeight: parent
                Layout.fillWidth: parent
            }
        }

    }


}
