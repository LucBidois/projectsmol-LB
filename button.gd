extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _pressed() -> void:
	# send  signal to act as power being pressed
	Input.action_press("ui_accept")
	Input.action_release("ui_accept")
	
