extends Node2D

@export var broccoli_scene: PackedScene
@export var cabbage_scene: PackedScene
@export var carrot_scene: PackedScene
@export var corn_scene: PackedScene
@export var cauliflower_scene: PackedScene
@export var green_onion_scene: PackedScene
@export var onion_scene: PackedScene
@export var potato_scene: PackedScene
@export var raddish_scene: PackedScene

var MONSTER_SCENES
# Called when the node enters the scene tree for the first time.
func _ready():
	MONSTER_SCENES = {
	MonsterTypes.TYPES.BROCCOLI: broccoli_scene,
	MonsterTypes.TYPES.CABBAGE: cabbage_scene,
	MonsterTypes.TYPES.CARROT: carrot_scene,
	MonsterTypes.TYPES.CORN: corn_scene,
	MonsterTypes.TYPES.CAULIFLOWER: cauliflower_scene,
	MonsterTypes.TYPES.GREEN_ONION: green_onion_scene,
	MonsterTypes.TYPES.ONION: onion_scene,
	MonsterTypes.TYPES.POTATO: potato_scene,
	MonsterTypes.TYPES.RADDISH: raddish_scene
}
	GameEvents.connect("spawn_monster", on_spawn_monster)

func on_spawn_monster(monster_type, monster_scale):
	var monster_scene = MONSTER_SCENES[monster_type]
	var monster = monster_scene.instantiate()
	add_child(monster)
	if GameEvents.spawn_location == GameEvents.SPAWN_LOCATIONS.LEFT:
		monster.global_position = $Left.global_position
	else:
		monster.global_position = $Right.global_position

