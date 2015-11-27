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
        return ($this->x + $this->width < $map->getWidth()) && ($this->y + $this->height < $map->getHeight());
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
    private $rooms;
    private $width;
    private $height;
    private $json;

    public function __construct($width, $height) {
        $this->rooms = array();
        $this->width = $width;
        $this->height = $height;
    }

    public function getWidth() {
        return $this->width;
    }

    public function getHeight() {
        return $this->height;
    }

    public function getJSON() {
        return $this->json;
    }

    public function generate($nRooms) {
        $this->json = array();

        // Meta
        $this->json["width"] = $this->width;
        $this->json["height"] = $this->height;

        // Rooms and corridors
        $this->generateRooms($nRooms);
        $this->generateCorridors($nRooms);

        //Objects...monsters...?
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

        // Floors & walls & ceilings
        $this->json["floors"] = array();
        $this->json["walls"] = array();

        foreach ($this->rooms as $room) {
            for ($x = 0; $x < $room->width; ++$x) {
                for ($y = 0; $y < $room->height; ++$y) {
                    $dx = $room->x + $x;
                    $dy = $room->y + $y;
                    $data = array("x" => $dx, "y" => $dy);
                    $this->json["floors"][] = $data;
                    /*
                    if ($dy == $room->y || $dy == $room->y + $room->height - 1 ||
                            $dx == $room->x || $dx == $room->x + $room->width - 1) {
                                $this->json["walls"][] = $data;
                            } else {
                                $this->json["floors"][] = $data;
                            }
                            */
                }
            }
        }
    }

    public function generateCorridors($nRooms) {
        for ($i = 0; $i < $nRooms; $i++) {
            $roomA = $this->rooms[$i];
            $roomB = $roomA->findNearestRoom($this->rooms);

            $pointA = array(rand($roomA->x + 1, $roomA->x + $roomA->width - 1),
                            rand($roomA->y + 1, $roomA->y + $roomA->height - 1));
            $pointB = array(rand($roomB->x + 1, $roomB->x + $roomB->width - 1),
                            rand($roomB->y + 1, $roomB->y + $roomB->height - 1));

            while (($pointB[0] != $pointA[0]) || ($pointB[1] != $pointA[1])) {
                if ($pointB[0] != $pointA[0]) {
                    if ($pointB[0] > $pointA[0]) $pointB[0]--;
                    else $pointB[0]++;
                } else if ($pointB[1] != $pointA[1]) {
                    if ($pointB[1] > $pointA[1]) $pointB[1]--;
                    else $pointB[1]++;
                }

                $this->json["floors"][] = array("x" => $pointB[0], "y" => $pointB[1]);
            }
        }
    }
}
