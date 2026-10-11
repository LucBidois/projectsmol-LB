extends Node3D

@export var player: Player
@export var speed_factor: float = 5

@onready var camera3d: Camera3D = $Camera3D
const OFFSET := Vector3(1, 1, 1)

# isometric angle, works out to 32 degrees
const ANGLE := atan(1.0 / sqrt(2.0))

# on ready, have the camera look at the player and be in the isometric position

# in process, update the camera position to follow the player


func _process(delta: float) -> void:
	var target := player.position + OFFSET
	position = lerp(position, target, speed_factor * delta) + OFFSET
