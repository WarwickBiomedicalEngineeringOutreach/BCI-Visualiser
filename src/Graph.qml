import QtQuick 2.4

Item {
    id: graphView
    width: 320
    height: 320

    property color lineColour1: "red"
    property color lineColour2: "orange"
    property color lineColour3: "green"
    property color lineColour4: "cyan"
    property color lineColour5: "yellow"
    property color lineColour6: "magenta"
    property color lineColour7: "blue"
    property color lineColour8: "purple"

    //TODO: add boolean draw options

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
    }

    function addElement(data) {
        dataModel.append({
                             "delta"    : data["delta"],
                             "theta"    : data["theta"],
                             "lowAlpha" : data["lowAlpha"],
                             "highAlpha": data["highAlpha"],
                             "lowBeta"  : data["lowBeta"],
                             "highBeta" : data["highBeta"],
                             "lowGamma" : data["lowGamma"],
                             "midGamma" : data["midGamma"]
                         })
        if(dataModel.count > 65) {
            dataModel.remove(0);
        }

        update()
    }

    function clearData() {
        dataModel.clear();
        update();
    }

    ListModel {
        id: dataModel
    }

    function update() {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        renderTarget: Canvas.Image
        antialiasing: true

        property int pixelSkip: 1+Math.floor(dataModel.count/400) //seems to be a good balence for drawing performance

        function drawBackground(ctx) { //TODO: Fix Background graph drawing
            ctx.save()
            ctx.fillStyle = "black"
            ctx.fillRect(0, 0, canvas.width, canvas.height)
            ctx.restore()
        }

        function drawData(ctx) {
            ctx.save()
            ctx.globalAlpha = 0.7
            ctx.lineWidth = 4
            var w = canvas.width / 65
            var end = dataModel.count

            //TODO: write more efficient draw algorithm

            ctx.strokeStyle = lineColour1
            ctx.beginPath()
            for (var i = 0; i < end; i += pixelSkip) {
                var data = dataModel.get(i);

                var x = (i * w);
                var y = (1-(data.delta/0x800000))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.strokeStyle = lineColour2
            ctx.beginPath()
            for (i = 0; i < end; i += pixelSkip) {
                data = dataModel.get(i);

                x = (i * w);
                y = (1-(data.theta/0x800000))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.strokeStyle = lineColour3
            ctx.beginPath()
            for (i = 0; i < end; i += pixelSkip) {
                data = dataModel.get(i);

                x = (i * w);
                y = (1-(data.lowAplha/0xFFFFFF))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.strokeStyle = lineColour4
            ctx.beginPath()
            for (i = 0; i < end; i += pixelSkip) {
                data = dataModel.get(i);

                x = (i * w);
                y = (1-(data.highAplha/0xFFFFFF))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.strokeStyle = lineColour5
            ctx.beginPath()
            for (i = 0; i < end; i += pixelSkip) {
                data = dataModel.get(i);

                x = (i * w);
                y = (1-(data.lowBeta/0xFFFFFF))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.strokeStyle = lineColour6
            ctx.beginPath()
            for (i = 0; i < end; i += pixelSkip) {
                data = dataModel.get(i);

                x = (i * w);
                y = (1-(data.highBeta/0xFFFFFF))*canvas.height;

                if (i == 0) {
                    ctx.moveTo(x, y)
                } else {
                    ctx.lineTo(x + w / 2, y)
                }
            }
            ctx.stroke()

            ctx.restore()
        }

        onCanvasSizeChanged: {
            requestPaint()
        }

        onPaint: {
            var ctx = canvas.getContext("2d")

            ctx.globalCompositeOperation = "source-over"
            ctx.lineWidth = 1

            drawBackground(ctx)

            drawData(ctx)
        }
    }
}
