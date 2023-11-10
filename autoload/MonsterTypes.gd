extends Node

enum TYPES {
	BROCCOLI,
	CABBAGE,
	CARROT,
	CORN,
	CAULIFLOWER,
	GREEN_ONION,
	ONION,
	POTATO,
	RADDISH
}

enum SIZES {
	SMALL,
	MEDIUM,
	LARGE,
	MEGA
}
enum CLICK_FUNCTIONALITIES {
	TRAIN,
	STOP_TRAIN
}

var training_times = {
	MonsterTypes.TYPES.BROCCOLI:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM: 2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.CABBAGE:
		{
			MonsterTypes.SIZES.SMALL: 3,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 4,
		},
	MonsterTypes.TYPES.CARROT:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.CORN:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.CAULIFLOWER:
		{
			MonsterTypes.SIZES.SMALL: 2,
			MonsterTypes.SIZES.MEDIUM:3,
			MonsterTypes.SIZES.LARGE: 4,
		},
	MonsterTypes.TYPES.GREEN_ONION:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.ONION:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.POTATO:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
	MonsterTypes.TYPES.RADDISH:
		{
			MonsterTypes.SIZES.SMALL: 11,
			MonsterTypes.SIZES.MEDIUM:2,
			MonsterTypes.SIZES.LARGE: 15,
		},
}
