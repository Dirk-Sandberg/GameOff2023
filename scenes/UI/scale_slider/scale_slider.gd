extends HSlider

const scale_ticker_to_sizes = {
	0: MonsterTypes.SIZES.SMALL,
	1: MonsterTypes.SIZES.MEDIUM,
	2: MonsterTypes.SIZES.LARGE,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("value_changed", on_changed)

func on_changed(val):
	var scale_option = scale_ticker_to_sizes[int(val)]
	GameEvents.selected_scale = GameEvents.SCALE_OPTIONS[scale_option]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
