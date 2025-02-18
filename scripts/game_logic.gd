extends Node

@export var score_table = {}
@export var pause_menu: Control
@export var game_utils: game_object_utils

func _ready() -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_cancel"):
		if pause_menu.visible:
			game_utils.do_unpause()
			_hide_pause_menu()
		else:
			game_utils.do_pause()
			_show_pause_menu()

func _process(delta: float) -> void:
	pass

	
func _show_pause_menu() -> void:
	pause_menu.visible = true

func _hide_pause_menu() -> void:
	pause_menu.visible = false
	
func _handle_goal(gate_name: String):
	var score_np: NodePath = score_table[gate_name]
	var score: score_view = get_node(score_np)
	score.change_score(1)
