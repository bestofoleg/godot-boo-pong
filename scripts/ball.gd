extends CharacterBody2D
class_name ball

@export var initial_force: Vector2 = Vector2.ZERO
@export var velocity_bonus: float = 1.05
@export var velocity_vector_length_limit: float = 1500

var wait_for_impulse_from_player = "p1"

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
		if wait_for_impulse_from_player != null and Input.is_anything_pressed():
			var is_down_pressed = Input.is_action_pressed(wait_for_impulse_from_player+"_platform_down")
			var is_up_pressed = Input.is_action_pressed(wait_for_impulse_from_player+"_platform_up")
			if  is_down_pressed or is_up_pressed:
				wait_for_impulse_from_player = null
				velocity = initial_force
		var collision = move_and_collide(velocity * delta)
		if collision:
			var normal = collision.get_normal()
			var bonus = 1
			if (velocity.length() < velocity_vector_length_limit):
				bonus = velocity_bonus
			var reflection_vector = velocity.reflect(normal)
			
			var degs = rad_to_deg(Vector2.UP.angle_to(reflection_vector))
			var degs180 = fmod(degs, 180)
			
			if abs(degs180) > 135:
				reflection_vector.y = -0.4 * reflection_vector.length()
				reflection_vector.x = 1.4 * reflection_vector.length()
			elif abs(degs180) < 45:
				reflection_vector.y = 0.4 * reflection_vector.length()
				reflection_vector.x = 1.4 * reflection_vector.length()
				
			var new_velocity = -reflection_vector*bonus
			velocity = new_velocity
		
