extends Control
class_name MonsterPanel

@export var monster_type: MonsterTypes.TYPES
@export var click_functionality: MonsterTypes.CLICK_FUNCTIONALITIES
#@export var click_functionality: MonsterTypes.
@export_multiline var description = "This is a test description"

@export var broccoli_icon: Texture2D
@export var cabbage_icon: Texture2D
@export var carrot_icon: Texture2D
@export var corn_icon: Texture2D
@export var cauliflower_icon: Texture2D
@export var green_onion_icon: Texture2D
@export var onion_icon: Texture2D
@export var potato_icon: Texture2D
@export var raddish_icon: Texture2D




var monster_sprites
var monster_textures
var function




# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.button_up.connect(on_button_up)
	$Button.connect("mouse_entered", _on_mouse_entered)
	$Button.connect("mouse_exited", _on_mouse_exited)

	monster_textures = {
		MonsterTypes.TYPES.BROCCOLI: broccoli_icon,
		MonsterTypes.TYPES.CABBAGE: cabbage_icon,
		MonsterTypes.TYPES.CARROT: carrot_icon,
		MonsterTypes.TYPES.CORN: corn_icon,
		MonsterTypes.TYPES.CAULIFLOWER: cauliflower_icon,
		MonsterTypes.TYPES.GREEN_ONION: green_onion_icon,
		MonsterTypes.TYPES.ONION: onion_icon,
		MonsterTypes.TYPES.POTATO: potato_icon,
		MonsterTypes.TYPES.RADDISH: raddish_icon,
	}
	set_monster_type(monster_type)

func set_monster_type(m):
	$Monster.texture = monster_textures[m]
	monster_type = m

func set_click_functionality(foo):
	click_functionality = foo

func on_button_up():
	if click_functionality == MonsterTypes.CLICK_FUNCTIONALITIES.TRAIN:
		GameEvents.emit_signal("start_training_unit", monster_type, GameEvents.selected_scale)
	else:
		GameEvents.emit_signal("stop_training_unit", self)

func _on_mouse_entered():
	if click_functionality == MonsterTypes.CLICK_FUNCTIONALITIES.TRAIN:
		GameEvents.emit_signal("show_information", description)
	else:
		GameEvents.emit_signal("show_information", "Cancel training this unit.")
		

func _on_mouse_exited():
	GameEvents.emit_signal("hide_information")
