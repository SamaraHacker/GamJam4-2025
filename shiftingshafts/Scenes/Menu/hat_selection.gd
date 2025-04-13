extends Sprite2D

var hatNumber = 0
@onready var hat: Sprite2D = $"."
@onready var hat_label: Label = $"../../HBoxContainer/HatLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hatNumber = Global.player_hat_number


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hat.frame_coords.x = hatNumber
	hat_label.text = "Hat Number: " + str(hatNumber)

func _on_prev_hat_button_pressed() -> void:
	print("Back button pressed")
	if(hatNumber <= 6 && hatNumber > 0):
		hatNumber -= 1
		Global.player_hat_number = hatNumber
	else:
		hatNumber = 6

func _on_next_hat_button_pressed() -> void:
	print("Next button pressed")
	if(hatNumber < 6 && hatNumber >= 0):
		hatNumber += 1
		Global.player_hat_number = hatNumber
	else:
		hatNumber = 0
