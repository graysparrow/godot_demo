extends Node2D

var speed:float = 500
var screenSize:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		var distance = velocity.normalized() * speed * delta
		position += distance
		position = position.clamp(Vector2.ZERO, screenSize)
		var canvasPos = get_global_transform() * position
		var screenPos = get_viewport().get_screen_transform() * get_global_transform_with_canvas() * position
		print_rich("velocity [color=red][b]{velocity}[/b][/color], position [color=green][b]{position}[/b][/color], canvasPos [color=purple][b]{canvasPos}[/b][/color], screenPos [color=yellow][b]{screenPos}[/b][/color]".format({
			"velocity":velocity,
			"position":position,
			"canvasPos":canvasPos,
			"screenPos":screenPos,
		}))
