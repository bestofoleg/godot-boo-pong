extends CharacterBody2D
class_name platform

@export var speed: float = 30
@export var state_machine: platform_state_machine = null
@export var action_prefix: String = "p1"

var initial_platform_position: Vector2 = Vector2.ZERO
var _is_paused = false


func pause() -> void:
	_is_paused = true
	
func unpause() -> void:
	_is_paused = false

func _ready() -> void:
	initial_platform_position = position
	
func _process(delta: float) -> void:
	if !_is_paused:
		state_machine._process(delta)
	
	
func _physics_process(delta) -> void:
	if !_is_paused:
		velocity.x = 0
		move_and_collide(velocity)
	#move_and_slide()
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#if collision:
			
