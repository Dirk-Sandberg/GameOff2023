extends Node
signal start_training_unit(monster_type, scale)
signal stop_training_unit(monster_panel: MonsterPanel)
signal show_information(information)
signal hide_information
signal spawn_monster(monster_type, monster_scale)
signal coin_pickup

var coins = 0

enum SPAWN_LOCATIONS {
	LEFT,
	RIGHT
}
var spawn_location = SPAWN_LOCATIONS.LEFT


var SCALE_OPTIONS = {
	MonsterTypes.SIZES.SMALL: 0.5,
	MonsterTypes.SIZES.MEDIUM: 1.0,
	MonsterTypes.SIZES.LARGE: 2.0,
	MonsterTypes.SIZES.MEGA: 4.0
}
var selected_scale = SCALE_OPTIONS[1] # 0, 1, or 2

func pick_up_coin():
	coin_pickup.emit()
	coins += 1
