extends Node


var MONSTER_SCENES
@export var broccoli_scene: PackedScene
@export var cabbage_scene: PackedScene
@export var carrot_scene: PackedScene
@export var corn_scene: PackedScene
@export var cauliflower_scene: PackedScene
@export var green_onion_scene: PackedScene
@export var onion_scene: PackedScene
@export var potato_scene: PackedScene
@export var raddish_scene: PackedScene

func _ready():
	print("IM READY")
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
