extends Node2D

@export var shop_menu_scene: PackedScene
var shop_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	%Button.connect("pressed", on_button_pressed)


func on_button_pressed():
	if not shop_menu:
		shop_menu = shop_menu_scene.instantiate()
		add_child(shop_menu)
	else:
		shop_menu.visible = true
