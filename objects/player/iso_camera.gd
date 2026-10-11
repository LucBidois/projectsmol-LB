class_name IsoCamera
extends Node3D
## Isometric camera, angled at a 'true' isometric projection of ~35.26 degrees on the x axis.
##
## Angled at 45 degrees on the y axis.

## Target node for the isometric camera to follow
@export var target: Player
@export var speed_factor: float = 5

## The physical distance the camera is away from the target.
##
## Increase if the camera is clipping with geometry
@export var camera_distance: float = 20

const OFFSET_DIR := Vector3(1, 1, 1)


func _process(delta: float) -> void:
	var target_position := target.position + OFFSET_DIR * camera_distance
	global_position = lerp(global_position, target_position, speed_factor * delta)
