extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _pressed() -> void:
	
	if self.name == "Jump":
		Input.action_press("ui_accept")
		Input.action_release("ui_accept")
	
	if self.name == "Power":
		Input.action_press("power")
		Input.action_release("power")
	
