extends Node

@export var score_table = {}
@export var pause_menu: Control
@export var game_utils: game_object_utils
@export var platforms: Array[NodePath]
@export var right_platform: moving_platform 

func _ready() -> void:
	for p in platforms:
		var platform: moving_platform = get_node(p)
		platform.state_machine.init_machine()
	var game_mode = GlobalValues.game_mode
	print("=== Game Mode: %s ===" % game_mode)
	if game_mode == "game_for_one":
		right_platform.state_machine.change_state(right_platform.npc_state)


func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_cancel"):
		if pause_menu.visible:
			game_utils.do_unpause()
			_hide_pause_menu()
		else:
			game_utils.do_pause()
			_show_pause_menu()

	
func _show_pause_menu() -> void:
	pause_menu.visible = true


func _hide_pause_menu() -> void:
	pause_menu.visible = false
	
	
func _handle_goal(gate_name: String):
	var score_np: NodePath = score_table[gate_name]
	var score: score_view = get_node(score_np)
	score.change_score(1)
