extends Node

@export var SPEED = 30.0
@export var entity: CharacterBody2D
@export var moving_left: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if moving_left:
		entity.scale.x = -abs(entity.scale.x)
	else:
		entity.scale.x = abs(entity.scale.x)
	

func _physics_process(delta):
	# Add the gravity.
	if not entity.is_on_floor():
		entity.velocity.y += gravity * delta

#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = -1.0 if moving_left else 1.0
	if entity.get_node("AttackComponent").attacking:
		entity.velocity.x = direction * 0.0
	else:
		entity.velocity.x = direction * SPEED
	entity.move_and_slide()
