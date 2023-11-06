extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.animation_finished.connect(on_anim_finished)
	pass # Replace with function body.

func set_text(t):
	$Label.text = t

func on_anim_finished(_anim_name):
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
