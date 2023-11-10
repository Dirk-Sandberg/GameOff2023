extends CanvasLayer

@onready var coin_counter = %CoinCounter

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("coin_pickup", on_coin_pickup)

func on_coin_pickup():
	coin_counter.text = str(GameEvents.coins)

