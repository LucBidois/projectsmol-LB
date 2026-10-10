extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_button_activate() -> void:
	_open()


func _open() -> void:
	animation_player.play("open")


func _close() -> void:
	animation_player.play_backwards("open")


func _on_button_deactivate() -> void:
	_close()
