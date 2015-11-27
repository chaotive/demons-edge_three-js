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
            if ($this == $troom) continue;

            $tx = $troom->x + $troom->width / 2;
            $ty = $troom->y + $troom->height / 2;
            $rx = $this->x + $this->width / 2;
            $ry = $this->y + $this->height / 2;
            $d = sqrt(($tx - $rx) * ($tx - $rx) + ($ty - $ry) * ($ty - $ry));

            if ($d < $near) {
                $near = $d;
                $nearRoom = $troom;
            }
        }

        return $nearRoom;
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
        $this->generateCorridors($nRooms);
    }

    public function getJSON() {
        $json = array();

        // Meta
        $json["width"] = $this->width;
        $json["height"] = $this->height;

        // Floors & walls & ceilings
        $json["floors"] = array();
        $json["walls"] = array();

        foreach ($this->rooms as $room) {
            for ($x = 0; $x < $room->width; ++$x) {
                for ($y = 0; $y < $room->height; ++$y) {
                    $dx = $room->x + $x;
                    $dy = $room->y + $y;
                    $data = array("x" => $dx, "y" => $dy);

                    if ($dy == $room->y || $dy == $room->y + $room->height - 1 ||
                            $dx == $room->x || $dx == $room->x + $room->width - 1) {
                        $json["walls"][] = $data;
                    } else {
                        $json["floors"][] = $data;
                    }
                }
            }
        }

        return $json;
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
        /* $room = $this->rooms[0];
        $near = $room->findNearestRoom($this->rooms);
        $corridor = new Room();
        $corridor->x = $room->x < $near->x ? $room->x : $near->x;
        $corridor->y = $room->y < $near->y ? $room->y : $near->y; */
    }
}
