extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%PickupArea.mouse_entered.connect(on_mouse_entered)

func on_mouse_entered():
	GameEvents.pick_up_coin()
	queue_free()

