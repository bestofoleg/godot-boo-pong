extends Node
class_name game_object_utils


signal pause()
signal unpause()


func do_pause() -> void:
	emit_signal("pause")
	

func do_unpause() -> void:
	emit_signal("unpause")
