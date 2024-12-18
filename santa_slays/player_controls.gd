extends RigidBody3D

@export var turn_speed = 10



func _process(_delta: float) -> void:
	update_movement_inputs()

func update_movement_inputs() -> void:
	var input_direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	linear_velocity.x += input_direction * turn_speed * get_process_delta_time()
