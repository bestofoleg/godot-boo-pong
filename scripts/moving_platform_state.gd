extends platform_state

@export var state_machine: platform_state_machine = null
@export var platform: platform = null
@export var idle_state: platform_state = null
var current_velocity: Vector2 = Vector2.ZERO

func enter():
	pass

func exit():
	pass
	
func _input(event: InputEvent) -> void:
	var direction = Vector2.ZERO
	
	if event.is_action(platform.action_prefix + "_platform_down"):
		direction.y += 1
	if event.is_action(platform.action_prefix + "_platform_up"):
		direction.y -= 1
	if event.is_action_released(platform.action_prefix + "_platform_down") or event.is_action_released(platform.action_prefix + "_platform_up"):
		direction = Vector2.ZERO
	
	current_velocity = direction * platform.speed
	
	if direction == Vector2.ZERO:
		state_machine.change_state(idle_state)
	
	platform.position.x = platform.initial_platform_position.x

func update(delta):
	platform.position += current_velocity * delta * platform.speed
