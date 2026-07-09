import QtQuick

Canvas {
    id: corner
    
    property string color: "#ff0000"
    property string type: "left"     
    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        ctx.fillStyle = corner.color;
        ctx.beginPath();

        if (type === "left") {
            ctx.moveTo(0, 0);
            ctx.lineTo(width, 0);
            ctx.lineTo(width, height);
            
            ctx.arc(0, height, width,1, -Math.PI / 3.5, true);
            
        } else {
            ctx.moveTo(0, height);
            ctx.lineTo(0, 0);
            ctx.lineTo(width, 0);
            
            ctx.arc(width, height, width, -Math.PI / 3.5, Math.PI, true);
        }

        ctx.closePath();
        ctx.fill();
    }

    onColorChanged: requestPaint()
    onHeightChanged: requestPaint()
}
