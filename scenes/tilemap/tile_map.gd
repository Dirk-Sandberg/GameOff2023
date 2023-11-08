extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("spawn_monster", on_spawn_monster)
	
func on_spawn_monster(monster_type, monster_scale):
	print("TILEMAP SPAWN MONSTER!", monster_type, monster_scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
