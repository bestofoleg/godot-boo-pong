extends platform_state

@export var state_machine: platform_state_machine = null
@export var moving_state: platform_state = null
@export var platform: platform = null


func enter():
	pass

func exit():
	pass
	
func _input(event: InputEvent) -> void:
	platform.position.x = platform.initial_platform_position.x
	if event.is_action(platform.action_prefix + "_platform_up") or event.is_action(platform.action_prefix + "_platform_down"):
		state_machine.change_state(moving_state)
