extends AnimatedSprite2D

var Running: String = ""
var RunPressed: int = 0

@onready var direction: Node = $Direction

func _physics_process(_delta: float) -> void:
	var mouse: Vector2 = get_local_mouse_position()
	var a: int = snapped(mouse.angle(), PI/4) / (PI/4)
	a = wrapi(int(a), 0, 8)
	
	
	if Input.get_vector("Left", "Right", "Up", "Down").normalized() != Vector2.ZERO:
		Running = "Run"
	else:
		Running = ""
	
	var frame_: int = frame
	
	play(direction.get_direction(a) + Running)
	
	if frame != frame_:
		frame = frame_
