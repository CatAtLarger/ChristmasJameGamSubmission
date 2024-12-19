extends RigidBody3D

#for movement
@export var turn_speed = 20


#for shooting
@export var present_scene: PackedScene
@export var fire_rate: float = 0.2
var last_shot_time = 0



func _input(_event: InputEvent) -> void:
	# for movement
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		var input_direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		linear_velocity.x += input_direction * turn_speed * get_process_delta_time()
		
	# for shooting
	if Input.is_action_pressed("shoot_present") and (Time.get_ticks_msec() - last_shot_time > fire_rate * 1000):
		shoot()
		last_shot_time = Time.get_ticks_msec()


func shoot():
	var present = present_scene.instantiate()
	present.global_transform = $Camera3D.global_transform
	
	var present_direction = $Camera3D.global_transform.basis.z.normalized() * -1
	#present.set_direction(present_direction)


	get_parent().get_node("Presents").add_child(present)
	
