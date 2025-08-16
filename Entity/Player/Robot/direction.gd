extends Node

var current_direction: String = "South"

@onready var look_at: Marker2D = $"../../LookAt"
@onready var animated_sprite: AnimatedSprite2D = $".."

func get_direction(number) -> String:
	match number:
		0:
			current_direction = "RightFront"
			look_at.show_behind_parent = false
			animated_sprite.flip_h = false
		1:
			current_direction = "RightFront"
			look_at.show_behind_parent = false
			animated_sprite.flip_h = false
		2:
			current_direction = "Front"
			look_at.show_behind_parent = false
			animated_sprite.flip_h = true
		3:
			current_direction = "RightFront"
			look_at.show_behind_parent = false
			animated_sprite.flip_h = true
		4:
			current_direction = "RightFront"
			look_at.show_behind_parent = false
			animated_sprite.flip_h = true
		5:
			current_direction = "RightBack"
			look_at.show_behind_parent = true
			animated_sprite.flip_h = true
		6:
			current_direction = "Back"
			look_at.show_behind_parent = true
			animated_sprite.flip_h = false
		7:
			current_direction = "RightBack"
			look_at.show_behind_parent = true
			animated_sprite.flip_h = false
	
	return current_direction
