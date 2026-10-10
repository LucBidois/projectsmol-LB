extends AnimatableBody3D

# onreadys here

# if a physics body enters the area3d child,
# print something
# remember to connect with signals
# will need to be wired up to a door or gate object in the same scene
signal activate


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("body entered")
	print(body.to_string())
	activate.emit()
