extends Node3D

signal activate
signal deactivate

@export var depression_depth: float = 1

@onready var animatable_body_3d: AnimatableBody3D = $AnimatableBody3D
@onready var area_3d: Area3D = $Area3D
@onready var initial_y: float = animatable_body_3d.position.y

const ANIMATION_DURATION: float = 2.0


# update to only activate when the first body enters
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == animatable_body_3d:
		return

	engage_button()
	activate.emit()


# update to only deactivate when there are no bodies left to trigger the button
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == animatable_body_3d:
		return

	disengage_button()
	deactivate.emit()


# debugging
# func _physics_process(delta: float) -> void:
# 	print(area_3d.get_overlapping_bodies())


func engage_button() -> void:
	print("engaged")
	var tween = create_tween()
	tween.tween_property(animatable_body_3d, "position:y", initial_y - depression_depth, ANIMATION_DURATION) \
			.set_trans(Tween.TRANS_SPRING) \
			.set_ease(Tween.EASE_OUT)


func disengage_button() -> void:
	print("disengaged")
	var tween = create_tween()
	tween.tween_property(animatable_body_3d, "position:y", initial_y, ANIMATION_DURATION) \
			.set_trans(Tween.TRANS_SPRING) \
			.set_ease(Tween.EASE_OUT)
