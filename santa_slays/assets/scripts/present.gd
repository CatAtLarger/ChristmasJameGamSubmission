extends RigidBody3D
class_name Present

@export var speed: float = 50.0
@export var lifetime: float = 3.0

var direction: Vector3 = Vector3.ZERO

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	var velocity = direction * speed * delta
	move_and_collide(velocity)

func set_direction(new_direction: Vector3):
	direction = new_direction
