extends Camera2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x = get_global_mouse_position().x
	if position.x < get_screen_center_position().x - get_viewport_rect().size.x/2.0:
		position.x = get_screen_center_position().x - get_viewport_rect().size.x/2.0
	if position.x > get_screen_center_position().x + get_viewport_rect().size.x/2.0:
		position.x = get_screen_center_position().x + get_viewport_rect().size.x/2.0
