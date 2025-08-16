extends CharacterBody2D

const SPEED: float = 100.0
const DODGE_SPEED: float = 180.0
const DODGE_DURATION: float = 0.4

var can_dodge: bool = true
var dodge_roll_dir: Vector2 = Vector2.ZERO
var dodge_roll_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if dodge_roll_timer > 0.0:
		Dodge_logic(delta)
	else:
		Movement(delta)
	
	move_and_slide()

func Movement(delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	velocity = lerp(velocity, input_vector * SPEED, 22.0 * delta)
	
	if Input.is_action_just_pressed("Dodge") and can_dodge:
		can_dodge = false
		
		if input_vector != Vector2.ZERO:
			Dodge_roll(input_vector)

func Dodge_roll(direction: Vector2) -> void:
	dodge_roll_dir = direction
	dodge_roll_timer = DODGE_DURATION

func Dodge_logic(delta: float) -> void:
	var elapsed_percent = 1.0 - (dodge_roll_timer / DODGE_DURATION)
	var current_speed = lerp(DODGE_SPEED, DODGE_SPEED * 0.5, elapsed_percent)
	
	velocity = dodge_roll_dir * current_speed
	
	dodge_roll_timer -= delta
	
	if dodge_roll_timer <= 0.0:
		dodge_roll_dir = Vector2.ZERO
		can_dodge = true
