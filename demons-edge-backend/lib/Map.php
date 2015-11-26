<?php

/**
 */
namespace Lib;

class Room {
    public $x;
    public $y;
    public $width;
    public $height;

    public function __construct($x, $y, $width, $height) {
        $this->x = $x;
        $this->y = $y;
        $this->width = $width;
        $this->height = $height;
    }

    public function intersects($room) {
        if (($this->x <= $room->x + $room->width + 1 && $this->x + $this->width + 1 >= $room->x) &&
            ($this->y <= $room->y + $room->height + 1 && $this->y + $this->height + 1 >= $room->y)) {
            return true;
        }
    }

    public function inside($map) {
        return ($this->x + $this->width < $map->width) && ($this->y + $this->height < $map->height);
    }

    public function findNearestRoom($rooms) {
        $near = 66666666;
        $nearRoom = null;

        foreach ($rooms as $troom) {
            $tx = $troom->x + $troom->width / 2;
            $ty = $troom->y + $troom->height / 2;
            $rx = $room->x + $room->width / 2;
            $ry = $room->y + $room->height / 2;
            $d = sqrt(($tx - $rx) * ($tx - $rx) + ($ty - $ry) * ($ty - $ry));

            if ($d < $near) {
                $near = $d;
                $nearRoom = $troom;
            }
        }

        return $troom;
    }
}

class Map {
    public $rooms;
    public $width;
    public $height;

    public function __construct($width, $height) {
        $this->rooms = array();
        $this->width = $width;
        $this->height = $height;
    }

    public function generate($nRooms) {
        $this->generateRooms($nRooms);
        //$this->generateCorridors($nRooms);
    }

    public function generateRooms($nRooms) {
        // Create main rooms
        for ($i = 0; $i < $nRooms; ++$i) {
            $ok = true;
            $room = new Room(rand(0, $this->width),
                    rand(0, $this->height),
                    rand(8, 16),
                    rand(8, 16));

            // Check boundaries
            if (!$room->inside($this)) $ok = false;

            foreach ($this->rooms as $tRoom) {
                if ($room->intersects($tRoom)) {
                    $ok = false;
                    break;
                }
            }

            // Go
            if ($ok) {
                $this->rooms[] = $room;
            } else {
                --$i;
            }
        }
    }

    public function generateCorridors($nRooms) {
        /* for ($i = 0; $i < $nRooms; $i++) {
            $room = $this->rooms[$i];

            for ($j = $i + 1; $j < $nRooms; $j++) {
                $room2 = $room->findNearestVertical();

            }
        } */
        $room2 = $room->findNearestVertical($this->rooms);
        $corridor = new Room($room->x + $room->width / 2, $room->y + $room->height / 2, 3, 10);
        $this->rooms[] = $corridor;
    }
}
/*
            // Check inside map
            if (!(room.x + room.w <= Game.MAXX) || !(room.y + room.h <= Game.MAXY)) {
                ok = false;
            }
        
            // Check intersections
            for (j = 0; j < rooms.length; ++j) {
                var check = rooms[j];
        
                if ((room.x <= check.x + check.w && room.x + room.w >= check.x) &&
                        (room.y <= check.y + check.h && room.y + room.h >= check.y)) {
                            //console.log(check, room);
                            ok = false;
                        }
            }
        
            // Attach
            if (ok) {
                rooms.push(room);
            } else {
                --i;
            }
        }
    }
}


/*
var colors = ["#FF0000", "#CC99CC", "#00FF00", "#00CCCC", "#AAFFFF", "#0000FF", "#7700EE", "#0077AA"]; 

function init() {
    Crafty.init(Game.MAXX * Game.tile, Game.MAXY * Game.tile, 'game');
    Crafty.background('#004');
}

function generateMap(nRooms) {
    var rooms = [], ok, i, j;

    // Create main rooms
    for (i = 0; i < nRooms; ++i) {
        ok = true;
        var room = { x: Math.round(Math.random() * Game.MAXX),
                     y: Math.round(Math.random() * Game.MAXY),
                     w: Math.round(Math.random() * 8) + 8,
                     h: Math.round(Math.random() * 8) + 8 }

        // Check inside map
        if (!(room.x + room.w <= Game.MAXX) || !(room.y + room.h <= Game.MAXY)) {
            ok = false;
        }

        // Check intersections
        for (j = 0; j < rooms.length; ++j) {
            var check = rooms[j];

            if ((room.x <= check.x + check.w && room.x + room.w >= check.x) &&
                (room.y <= check.y + check.h && room.y + room.h >= check.y)) {
                //console.log(check, room);
                ok = false;
            }
        }

        // Attach
        if (ok) {
            rooms.push(room);
        } else {
            --i;
        }
    }

    // Create corridors
    // Vertical
    var min = 9999;
    var minroom = -1;

    for (i = 1; i < nRooms; ++i) {
        if ((rooms[0].x >= rooms[i].x && rooms[0].x <= rooms[i].x + rooms[i].w) || 
            (rooms[i].x >= rooms[0].x && rooms[i].x <= rooms[0].x + rooms[0].w)) {
            var diff = Math.abs(rooms[0].y + (rooms[0].h / 2) - (rooms[i].y + (rooms[i].h / 2)));

            if (diff < min) {
                min = diff;
                minroom = i;
            }
        }
    }

    if (minroom > -1) {
        var minh = Math.max(rooms[minroom].x, rooms[0].x);
        var maxh = Math.min(rooms[minroom].x + rooms[minroom].h, rooms[0].x + rooms[0].h);
        var hor = minh + Math.round(Math.random() * (maxh - minh));
        var corridor = { x: hor, y: 0, w: 0, h: 0 }

        if (rooms[0].y < rooms[minroom].y) { //
            corridor.y = rooms[0].y + rooms[0].h + 1;
            corridor.h = rooms[minroom].y - (rooms[0].y + rooms[0].h) - 2;
        } else {
            corridor.y = rooms[minroom].y + rooms[minroom].h + 1;
            corridor.h = rooms[0].y - (rooms[minroom].y + rooms[minroom].h) - 2;
        }

        rooms.push(corridor);
    }

    // Horizontal
    /* var min = 9999;
    var minroom = -1;

    for (i = 1; i < nRooms; ++i) {
        if ((rooms[0].y >= rooms[i].y && rooms[0].y <= rooms[i].y + rooms[i].h) || 
            (rooms[i].y >= rooms[0].y && rooms[i].y <= rooms[0].y + rooms[0].h)) {
            var diff = Math.abs(rooms[0].x + (rooms[0].x / 2) - (rooms[i].x + (rooms[i].w / 2)));

            if (diff < min) {
                min = diff;
                minroom = i;
            }
        }
    }

    if (minroom > -1) {
        var minv = Math.max(rooms[minroom].y, rooms[0].y);
        var maxv = Math.min(rooms[minroom].y + rooms[minroom].w, rooms[0].y + rooms[0].w);
        var ver = minv + Math.round(Math.random() * (maxv - minv));
        var corridor = { x: 0, y: ver, w: 0, h: 0 }

        if (rooms[0].x < rooms[minroom].x) {
            corridor.x = rooms[0].x + rooms[0].w + 1;
            corridor.w = rooms[minroom].x - (rooms[0].x + rooms[0].w) - 2;
        } else {
            corridor.x = rooms[minroom].x + rooms[minroom].w + 1;
            corridor.w = rooms[0].x - (rooms[minroom].x + rooms[minroom].w) - 2;
        }

        rooms.push(corridor);
    } ///

    return rooms;
}

function renderMap() {
    var i, x, y;

    for (i = 0; i < Game.map.length; ++i) {
        var room = Game.map[i];

        for (x = room.x; x <= room.x + room.w; ++x) {
            for (y = room.y; y <= room.y + room.h; ++y) {
                Crafty.e("2D, Canvas, Color")
                      .attr({ x: x * Game.tile, y: y * Game.tile, w: Game.tile - 2, h: Game.tile - 2 })
                      .color(i > 6 ? '#FFFFFF' : colors[i]);
            }
        }
    }
}


 */