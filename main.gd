extends Node3D

# connect to the player signal

@onready var player = $Player

@export var player_scene: PackedScene

func _on_test_player_use_power() -> void:
	print("creating a player")
	# instantiate them about above the player
	var p: Player = player_scene.instantiate()
	p.get_node("Camera3D").queue_free()
	p.is_controlled = false
	p.position = player.position
	p.position.y += 5

	add_child(p)
