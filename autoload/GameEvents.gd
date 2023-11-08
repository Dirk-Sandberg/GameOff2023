extends Node
signal start_training_unit(monster_type, scale)
signal stop_training_unit(monster_panel: MonsterPanel)
signal show_information(information)
signal hide_information
signal spawn_monster(monster_type, monster_scale)

enum SPAWN_LOCATIONS {
	LEFT,
	RIGHT
}
var spawn_location = SPAWN_LOCATIONS.LEFT

var selected_scale = 1 # 0, 1, or 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
