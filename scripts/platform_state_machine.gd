extends Node
class_name platform_state_machine

var current_state: Node = null
@export var initial_state: platform_state = null


func init_machine() -> void:
	var template = "StateMachine {stm_n} is Init"
	print(template.format({"stm_n": name}))
	current_state = initial_state
	current_state.enter()


func change_state(new_state: platform_state):
	var old_state = current_state
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
	var template = "StateMachine {stm_n} change state {from} to {to}"
	if old_state:
		print(template.format({"stm_n": name, "from": old_state.name, "to": current_state.name}))
	else:
		print(template.format({"stm_n": name, "from": "null", "to": current_state.name}))

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
