extends Area2D

@export var gate_name: String
@export var ball_spawn_point: Node2D 

signal goal(gate_name: String)

func _on_body_entered(body: Node2D) -> void:
	if body is ball:
		var ball_body: ball = body
		emit_signal("goal", gate_name)
		ball_body.velocity = Vector2.ZERO
		ball_body.position = ball_spawn_point.position
		ball_body.is_wait_for_initial_impulse = true
		
