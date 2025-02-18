extends CharacterBody2D
class_name ball

@export var initial_force: Vector2 = Vector2.ZERO
@export var velocity_bonus: float = 1.05
@export var velocity_vector_length_limit: float = 1500

var is_wait_for_initial_impulse: bool = true

const _random_velocity_bonus_range: Vector2 = Vector2(-5, 5)
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()


var _is_paused = false


func pause() -> void:
	_is_paused = true
	
func unpause() -> void:
	_is_paused = false


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if !_is_paused:
		if is_wait_for_initial_impulse and Input.is_anything_pressed():
			is_wait_for_initial_impulse = false
			velocity = initial_force
		var collision = move_and_collide(velocity * delta)
		if collision:
			var normal = collision.get_normal()
			var bonus = 1
			if (velocity.length() < velocity_vector_length_limit):
				bonus = velocity_bonus
			var new_velocity = -velocity.reflect(normal)*bonus
			velocity = new_velocity
		
