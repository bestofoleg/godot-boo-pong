extends Node
class_name platform_state_machine

var current_state: Node = null
@export var initial_state: platform_state = null

func _ready():
	if get_child_count() > 0:
		current_state = initial_state
		current_state.enter()

func change_state(new_state: platform_state):
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func _process(delta):
	if current_state:
		current_state.update(delta)
