extends platform_state
class_name npc_platform_state_look


@export var state_machine: platform_state_machine
@export var root_platform: moving_platform
@export var idle_state: platform_state
@export var target_ball: ball 

var direction = Vector2.ZERO

var _active = false


func enter():
    _active = true

func exit():
    _active = false

func update(delta: float) -> void:
    if root_platform.position.y > target_ball.position.y:
        direction = Vector2.UP
    elif root_platform.position.y < target_ball.position.y:
        direction = Vector2.DOWN

    var current_velocity = direction * root_platform.speed
    
    root_platform.position += current_velocity * delta * root_platform.speed
    root_platform.position.x = root_platform.initial_platform_position.x
