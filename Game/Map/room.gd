extends Node2D

@export var turned_off: bool = false
@export_range(0, 6) var sprite: int = 0

@onready var floor: Sprite2D = $floor
@onready var walls: Sprite2D = $walls
@onready var frontwalls: Sprite2D = $frontwalls
@onready var collision_rectangle: DonutCollisionRectangle = $StaticBody2D/DonutCollisionRectangle2D

func _ready() -> void:
	floor.frame_coords = Vector2(sprite, 0)

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if turned_off:
		return
	
	walls.show()
	frontwalls.show()
	collision_rectangle.call_deferred("set_disabled", false)

func Cleared():
	walls.hide()
	frontwalls.hide()
	collision_rectangle.call_deferred("set_disabled", true)
