import QtQuick 2.4

Item {
    id: root
    width: 320
    height: 320

    property color lineColour1: "red"

    //TODO: add boolean draw options

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
    }

    function addElement(data) {
        var tempVal = data / 0xFFFF; // float between 0 and 1
        dataModel.append({"value" : tempVal})

        if(dataModel.count > dataModel.maxSize) {
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
        property int maxSize: 128
    }

    function update() {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        renderTarget: Canvas.Image
        antialiasing: true

        function drawBackground(ctx) {
            ctx.save()
            ctx.fillStyle = "black"
            ctx.fillRect(0, 0, canvas.width, canvas.height)
            ctx.restore()
        }

        function drawData(ctx) {
            ctx.save()
            ctx.globalAlpha = 0.7
            ctx.lineWidth = 4
            var w = canvas.width / dataModel.maxSize
            var end = dataModel.count

            //TODO: write more efficient draw algorithm
            ctx.strokeStyle = lineColour1

            ctx.beginPath()
            for (var i = 0; i < end; i++) {
                var data = dataModel.get(i);

                var x = (i * w);
                var y = (1-data.value) * canvas.height;

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
