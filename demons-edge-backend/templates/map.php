<!DOCTYPE html>
<html>
    <head>
        <style>
        </style>
        <meta charset="UTF-8">
        <title>zqh</title>
    </head>

    <body>
        <h3>Map</h3>
        <div id="game"></div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crafty/0.7.0/crafty-min.js"></script>

        <script>
        var tile = 8;
        var map = <?php echo json_encode($map) ?>;
        Crafty.init(map.width * tile, map.height * tile, 'game');
        Crafty.background('#004');

        for (i = 0; i < map.rooms.length; ++i) {
            var room = map.rooms[i];

            for (x = room.x; x <= room.x + room.width; ++x) {
                for (y = room.y; y <= room.y + room.height; ++y) {
                    var col = (i == 0 ? "#ff0000" : "#666666");
                    if (y == room.y || y == room.y + room.height) col = "#FFFFFF";
                    if (x == room.x || x == room.x + room.width) col = "#FFFFFF";

                    Crafty.e("2D, Canvas, Color")
                          .attr({ x: x * tile, y: y * tile, w: tile - 1, h: tile - 1 })
                          .color(col);
                }
            }
        }
        </script>
    </body>
</html>

