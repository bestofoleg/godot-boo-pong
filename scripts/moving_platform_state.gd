extends platform_state

@export var state_machine: platform_state_machine
@export var root_platform: moving_platform
@export var idle_state: platform_state
var current_velocity: Vector2 = Vector2.ZERO
var direction = Vector2.ZERO

var _active = false


func enter():
	_active = true

func exit():
	_active = false
	
func _input(event: InputEvent) -> void:
	if event.is_action(root_platform.action_prefix + "_platform_down"):
		direction = Vector2.DOWN
	if event.is_action(root_platform.action_prefix + "_platform_up"):
		direction = Vector2.UP

	var action_name_down = root_platform.action_prefix + "_platform_down"
	var action_name_up = root_platform.action_prefix + "_platform_up"

	if event.is_action_released(action_name_up) or event.is_action_released(action_name_down):
		direction = Vector2.ZERO
		
	current_velocity = direction * root_platform.speed


func update(delta):
	if _active:
		root_platform.position += current_velocity * delta * root_platform.speed
		root_platform.position.x = root_platform.initial_platform_position.x
		if direction == Vector2.ZERO:
			state_machine.change_state(idle_state)
