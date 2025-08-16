class_name Hurtbox extends Area2D

@export var health_: Health

func Damage(attack: float) -> void:
	
	if health_:
		health_.Damage(attack)
