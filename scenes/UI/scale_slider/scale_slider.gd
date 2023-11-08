extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("value_changed", on_changed)

func on_changed(val):
	GameEvents.selected_scale = val
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
