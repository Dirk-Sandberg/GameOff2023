extends Camera2D

@export var tilemap: TileMap

#	if not tilemap:
#		return
#
#	var map_rect = tilemap.get_used_rect()
#	var tile_size = tilemap.cell_quadrant_size
#	var world_size_in_pixels = map_rect.size * tile_size * tilemap.scale.x
#	var erik_lazy_offset = tile_size*3.75
#	var erik_lazy_offset_2 = tile_size*1.5
#	limit_left = -tile_size * 2.75
#	limit_top -= erik_lazy_offset_2
#	limit_right = world_size_in_pixels.x - erik_lazy_offset
#	limit_bottom = world_size_in_pixels.y - tile_size*2
#
# Called when the node enters the scene tree for the first time.
func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.cell_quadrant_size
	var world_size_in_pixels = map_rect.size * tile_size
	limit_right = world_size_in_pixels.x
	limit_left = 0
	print("tile_size", tile_size)
	# Maybe use maprect.end?
	print("TEST ", limit_right)
#	limit_left = tilemap.text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x = get_global_mouse_position().x
	if position.x < get_screen_center_position().x - get_viewport_rect().size.x/2.0:
		position.x = get_screen_center_position().x - get_viewport_rect().size.x/2.0
	if position.x > get_screen_center_position().x + get_viewport_rect().size.x/2.0:
		position.x = get_screen_center_position().x + get_viewport_rect().size.x/2.0
