extends Node
class_name scene_management


@export var game_scene_path: String
@export var game_utils: game_object_utils
@export var menu_root: Control

func _start_game(mode: String):
	GlobalValues.game_mode = mode
	var game_scene = load(game_scene_path)
	get_tree().change_scene_to_packed(game_scene)


func _on_start_game_button_pressed() -> void:
	_start_game("game_for_two")
	
	
func _on_start_game_for_one_button_pressed() -> void:
	_start_game("game_for_one")

	
func _quit_game() -> void:
	get_tree().quit()


func _on_continue_game_button_pressed() -> void:
	game_utils.do_unpause()
	menu_root.visible = false
