extends platform_state

@export var state_machine: platform_state_machine = null
@export var moving_state: platform_state = null
@export var moving_platform: moving_platform = null

var _active = false


func enter():
	_active = true

func exit():
	_active = false
	
func _input(event: InputEvent) -> void:
	if _active:
		moving_platform.position.x = moving_platform.initial_platform_position.x
		if event.is_action(moving_platform.action_prefix + "_platform_up") or event.is_action(moving_platform.action_prefix + "_platform_down"):
			state_machine.change_state(moving_state)
