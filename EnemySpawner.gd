extends Node2D

var entities_layer
var wave_counter = 0
var delay_between_waves = 10
var delay_between_monsters = 0.51
var enemy_waves = {
	0: [
		{
			"monster": MonsterTypes.TYPES.CAULIFLOWER,
			"num": 1,
			"scale": MonsterTypes.SIZES.SMALL
		},
		{
			"monster": MonsterTypes.TYPES.CAULIFLOWER,
			"num": 1,
			"scale": MonsterTypes.SIZES.MEDIUM
		}
	],
	1: [
		{
			"monster": MonsterTypes.TYPES.CAULIFLOWER,
			"num": 2,
			"scale": MonsterTypes.SIZES.SMALL
		},
		{
			"monster": MonsterTypes.TYPES.CAULIFLOWER,
			"num": 2,
			"scale": MonsterTypes.SIZES.MEDIUM
		}
	]
}
# Called when the node enters the scene tree for the first time.
func _ready():
	entities_layer = get_tree().get_first_node_in_group("entities_layer")
	%WaveTimer.wait_time = delay_between_waves
	%WaveTimer.timeout.connect(spawn_wave)

func spawn_wave():
	print("Spawning wave", wave_counter)
	if wave_counter >= len(enemy_waves):
		print("YOU WIN THE GAME")
		return
	var wave = enemy_waves[wave_counter]
	wave_counter += 1
	for monster_group in wave:
		print("Monster group is", monster_group)
		for i in range(monster_group["num"]):
			var monster = MonsterScenes.MONSTER_SCENES[monster_group["monster"]].instantiate() as Node2D
			entities_layer.add_child(monster)
			var monster_scale = GameEvents.SCALE_OPTIONS[monster_group["scale"]]
			monster.scale = Vector2(monster_scale, monster_scale)
			monster.global_position = %SpawnPosition.global_position
			monster.add_to_group("enemies")
			monster.get_node("MovementComponent").moving_left = true
			monster.get_node("HealthBar").is_ally = false
			await get_tree().create_timer(delay_between_monsters).timeout
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
