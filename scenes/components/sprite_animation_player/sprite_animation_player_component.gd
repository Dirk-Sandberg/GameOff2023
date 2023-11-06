extends Node

@export var anim_player: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func attack_anim():
	anim_player.play("attack")
	await anim_player.animation_finished
	anim_player.play("default")

func die_anim():
	anim_player.play("die")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
