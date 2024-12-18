extends Camera3D

@export var vertical_sensitivity = 0.05
@export var horizontal_sensitivity = 0.05

var mouse_rotation = Vector3.ZERO

var is_paused = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	
	if is_paused:
		return
	
	if event is InputEventMouseMotion:		

		mouse_rotation.y -= event.relative.x * horizontal_sensitivity
		mouse_rotation.x -= event.relative.y * vertical_sensitivity
		
		rotation = mouse_rotation
		
	if event is InputEventJoypadMotion:
		var y_input_direction = (-Input.get_action_strength("look_right") +Input.get_action_strength("look_left")) * horizontal_sensitivity
		var x_input_direction = (-Input.get_action_strength("look_down")+ Input.get_action_strength("look_up") ) *  vertical_sensitivity
	
		rotation +=  Vector3(x_input_direction, y_input_direction, 0)

func _unhandled_input(_event):

			
	if Input.is_action_just_pressed("pause"):
		if not is_paused:
			is_paused = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Engine.time_scale = 0
		else:
			is_paused = false
			Engine.time_scale = 1
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
