extends CharacterBody2D

@export var _move_speed: float = 180

@export var _friction: float = 0.8
@export var _acceleration: float = 0.4

func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()


func _move() -> void:
  
  # Input keys configured in GODOT itself in the path: Project > Project Settings > Input Map
  # Video example: https://www.youtube.com/watch?v=0vqLOteIWS0
	
  var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
	
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
	velocity = _direction.normalized() * _move_speed
