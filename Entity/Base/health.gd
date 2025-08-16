class_name Health extends Node2D

var health: float
@export var MAX_HEALTH: int = 3
@export var Hurtbox_: Hurtbox

func _ready() -> void:
	health = MAX_HEALTH

func Damage(attack: float):
	health -= attack
	
	if health <= 0.0:
		Hurtbox_.monitoring = false
		print("dead")
