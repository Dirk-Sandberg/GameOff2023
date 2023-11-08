extends Node2D

@export var attack_damage = 1
@export var entity: CharacterBody2D
@export var damage_shape: Area2D
@export var attack_rate = 4.0
@export var damaging_frame = 1
var attacking = false


# Called when the node enters the scene tree for the first time.
func _ready():
	attack_damage = attack_damage*entity.scale.y
	entity.get_node("AnimatedSprite2D").frame_changed.connect(on_sprite_frame_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_should_attack()

func check_should_attack():
	# if enemy is within attack range, attack
	var hittable_enemies = get_hittable_enemies()
	var should_be_attacking = false
	if hittable_enemies:
		should_be_attacking = true
		if not attacking:
			attack()

	if should_be_attacking:
		attacking = true
	else:
		if attacking:
			entity.stop_attack()
		attacking = false

func get_hittable_enemies():
	var enemies = []
	var potential_hittable_enemies = damage_shape.get_overlapping_bodies()
	for enemy in potential_hittable_enemies:
		if entity.is_in_group("enemies") and enemy.is_in_group("allies"):
			enemies.append(enemy)
		if entity.is_in_group("allies") and enemy.is_in_group("enemies"):
			enemies.append(enemy)
#
	return enemies

func attack():
	entity.get_node("SpriteAnimationPlayerComponent").attack_anim()
	await get_tree().create_timer(attack_rate).timeout
	if attacking:
		attack()

func on_sprite_frame_changed():
	var anim_player = entity.get_node("AnimatedSprite2D") as AnimatedSprite2D
	if anim_player.animation != "attack":
		return
	if anim_player.frame == damaging_frame:
		perform_damage()

func perform_damage():
	var enemies = get_hittable_enemies()
	for monster in enemies:
		monster.get_node("HealthComponent").take_damage(attack_damage)

	
