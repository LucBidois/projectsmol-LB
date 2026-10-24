class_name Player
extends CharacterBody3D

const MAX_ROTATION_ANGLE = 90.0
const PUSH_MAGNITUDE = 5

@export var character: CharacterResource

@export var speed = 5.0
@export var jump_velocity = 4.5
@export var rotation_speed = 0.1

# Need a resource argument for the type of character we are spawning

var powers_to_string = { 1: "pull", 2: "push" }
# var powers = { 1: self.pull, 2: self.push }
var current_power = 0

var is_controlled = true

const MINIMUM_JUMP_POWER = 1

signal use_power

# func _unhandled_input(event: InputEvent) -> void:
# 	if not is_controlled:
# 		return

# 	if event is InputEventMouseButton:
# 		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
# 	elif event.is_action_pressed("ui_cancel"):
# 		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_controlled:
		# Handle jump.
		
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_velocity * max(character.jump_power, MINIMUM_JUMP_POWER)

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

	if Input.is_action_just_pressed("power"):
		_spawn_character(null)


func get_light_power_source(power: int) -> void:
	print("Getting light power " + str(powers_to_string[power]))
	current_power = power


func remove_light_power_source(power: int) -> void:
	print("Removing light power " + str(powers_to_string[power]))
	print("current power: %d" % current_power)

# emit force in front of player object
# any objects caught in the collision area should be pushed backwards
# func push():
# 	if not front_ray.is_colliding():
# 		return

# 	var collider = front_ray.get_collider()
# 	print("applying push to %s" % collider.to_string())

# 	if collider is RigidBody3D:
# 		var obj = collider as RigidBody3D
# 		var forward = -global_transform.basis.z
# 		obj.apply_central_impulse(forward * PUSH_MAGNITUDE)

# func pull():
# 	# pulls objects in front of player object towards the player
# 	# any objects caught in the collision area should be moved towards the player object
# 	if not front_ray.is_colliding():
# 		return

# 	var collider = front_ray.get_collider()
# 	print("applying pull to %s" % collider.to_string())

# 	if collider is RigidBody3D:
# 		var obj = collider as RigidBody3D
# 		var backward = global_transform.basis.z
# 		obj.apply_central_impulse(backward * PUSH_MAGNITUDE)


func _spawn_character(_character):
	# should emit a signal to create another player at a certain position
	use_power.emit()
	# main scene should instantiate the copy
