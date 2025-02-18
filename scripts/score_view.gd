extends Node
class_name score_view

@export var label: Label
var _score: int = 0

func _ready() -> void:
	label.text = str(_score)

func change_score(score_offset: int):
	_score += score_offset
	label.text = str(_score)
