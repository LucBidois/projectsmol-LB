extends Node3D

@onready var player: Player = $Player
@onready var iso_camera: IsoCamera = $IsoCamera

@export var player_scene: PackedScene


func _on_player_use_power() -> void:
	print("creating a player")
	var p = _spawn_character()
	player.is_controlled = false
	iso_camera.target = p


## We want to spawn one of the other characters here
## and add it as a child
func _spawn_character() -> Player:
	var p: Player = player_scene.instantiate()
	p.is_controlled = true
	p.position = player.position
	p.position.y += 5

	add_child(p)
	return p
