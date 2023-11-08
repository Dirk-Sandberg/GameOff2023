extends VBoxContainer

var training_queue = []
@export var monster_panel_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("start_training_unit", on_start_training_unit)
	GameEvents.connect("stop_training_unit", on_stop_training_unit)
	$Timer.connect("timeout", on_timer_timeout)
	%CurrentlyTrainedUnitIcon.queue_free()

func on_stop_training_unit(unit):
	print("Stop training unit!", unit)
	print("A ", %CurrentlyTrainedUnitArea.get_children())
	print("B ", %UpNextUnitIcons.get_children())
	if unit in %CurrentlyTrainedUnitArea.get_children():
		training_queue.pop_front()
		%CurrentlyTrainedUnitArea.remove_child(unit)
		var backlog = %UpNextUnitIcons.get_children()
		if backlog:
			var first_child = backlog[0]
			%UpNextUnitIcons.remove_child(first_child)
			%CurrentlyTrainedUnitArea.add_child(first_child)
		reset_timer()
	else:
		var backlog = %UpNextUnitIcons.get_children()
		var unit_index = backlog.find(unit)
		%UpNextUnitIcons.remove_child(unit)
		training_queue.pop_at(unit_index+1)
	unit.queue_free()
	print("TEST", %CurrentlyTrainedUnitArea.get_children())

func on_start_training_unit(unit_type, unit_scale):
	display_unit_icon(unit_type, unit_scale)
	training_queue.append([unit_type, unit_scale])
	if $Timer.is_stopped():
		$Timer.wait_time = MonsterTypes.training_times[unit_type][unit_scale]
		$Timer.start()

func display_unit_icon(unit_type, unit_scale):
	var monster_panel = monster_panel_scene.instantiate() as MonsterPanel
	if not training_queue:
		%CurrentlyTrainedUnitArea.add_child(monster_panel)
	else:
		%UpNextUnitIcons.add_child(monster_panel)
	monster_panel.set_monster_type(unit_type)
	monster_panel.set_click_functionality(MonsterTypes.CLICK_FUNCTIONALITIES.STOP_TRAIN)

func remove_unit_icon():
	# Remove the currently trained unit icon
	for child in %CurrentlyTrainedUnitArea.get_children():
		%CurrentlyTrainedUnitArea.remove_child(child)
		child.queue_free()
	# If there's another unit in the queue, move its icon to currently trained
	var next_units = %UpNextUnitIcons.get_children()
	if next_units:
		var next_unit = next_units[0]
		%UpNextUnitIcons.remove_child(next_unit)
		%CurrentlyTrainedUnitArea.add_child(next_unit)

func on_timer_timeout():
	var monster_to_spawn = training_queue.pop_front()
	remove_unit_icon()
	if not monster_to_spawn:
		return
	var unit_type = monster_to_spawn[0]
	var unit_scale = monster_to_spawn[1]
	GameEvents.emit_signal("spawn_monster", unit_type, unit_scale)
	check_start_timer()

func check_start_timer():
	if training_queue:
		start_timer()

func reset_timer():
	$Timer.stop()
	start_timer()
	
func start_timer():
	if not training_queue:
		return

	var unit_type = training_queue[0][0]
	var unit_scale = training_queue[0][1]
	if $Timer.is_stopped():
		$Timer.wait_time = MonsterTypes.training_times[unit_type][unit_scale]
		$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.is_stopped():
		%UnitTrainingProgressBar.value = 0.0
	else:
		%UnitTrainingProgressBar.value = 1- ($Timer.time_left / $Timer.wait_time)
