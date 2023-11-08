extends Node2D
class_name HealthBar

@export var is_ally: bool = false
var hp_bar: ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_ally:
		hp_bar = $AllyHealth
		$EnemyHealth.visible = false
	else:
		hp_bar = $EnemyHealth
		$AllyHealth.visible = false
	set_percent(100)

func set_percent(pct):
	hp_bar.value = max(pct, 0.0)
