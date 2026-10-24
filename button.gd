extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _pressed() -> void:
	Input.action_press("ui_accept")
	# send  signal to act as power being pressed
	print("easy")
