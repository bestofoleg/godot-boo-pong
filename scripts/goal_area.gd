extends Area2D

@export var gate_name: String
@export var ball_spawn_point: Node2D 
@export var platform_direction: int

signal goal(gate_name: String)

func _on_body_entered(body: Node2D) -> void:
	if body is ball:
		var ball_body: ball = body
		emit_signal("goal", gate_name)
		ball_body.velocity = Vector2.ZERO
		ball_body.position = ball_spawn_point.position
		ball_body.wait_for_impulse_from_player = gate_name
		ball_body.initial_force = sign(platform_direction)*abs(ball_body.initial_force)
		
