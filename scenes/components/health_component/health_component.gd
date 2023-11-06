extends Node

@export var health = 3
@export var entity: CharacterBody2D
@export var damage_number: PackedScene
@export var health_bar: HealthBar
var max_health

# Called when the node enters the scene tree for the first time.
func _ready():
	max_health = health
#
#func on_anim_finished(anim_name):
#	if anim_name == "die":
#		print("I DIED")

func take_damage(dmg):
	health -= dmg
	spawn_dmg_indicator(dmg)
	health_bar.set_percent(health/max_health)
	if health <= 0:
		entity.get_node("SpriteAnimationPlayerComponent").die_anim()
		await entity.get_node("AnimatedSprite2D").animation_finished
		entity.queue_free()

func spawn_dmg_indicator(dmg):
	var damage_number_instance = damage_number.instantiate()
	add_child(damage_number_instance)
	damage_number_instance.global_position = entity.global_position + Vector2.UP*10
	damage_number_instance.set_text(str(dmg))
