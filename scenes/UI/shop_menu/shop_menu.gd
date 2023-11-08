extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("show_information", on_show_information)
	GameEvents.connect("hide_information", on_hide_information)
	%CloseButton.connect("pressed", on_close_button_pressed)

func on_close_button_pressed():
	visible = false

func on_show_information(t):
	%Description.text = t

func on_hide_information():
	%Description.text = ""

