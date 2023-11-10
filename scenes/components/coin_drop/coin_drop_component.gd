extends Node2D

@export var coin_scene: PackedScene
@export var health_component: Node
@export var entity: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	health_component.died.connect(on_died)

func on_died():
	var coin = coin_scene.instantiate()
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	entities_layer.add_child(coin)
	coin.global_position = entity.global_position

