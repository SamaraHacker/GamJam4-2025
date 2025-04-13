extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.completedLevel5:
		$BoxContainer/VBoxContainer/Level6Button.disabled = false
	if Global.completedLevel4:
		$BoxContainer/VBoxContainer/Level5Button.disabled = false
	if Global.completedLevel3:
		$BoxContainer/VBoxContainer/Level4Button.disabled = false
	if Global.completedLevel2:
		$BoxContainer/VBoxContainer/Level3Button.disabled = false
	if Global.completedLevel1:
		$BoxContainer/VBoxContainer/Level2Button.disabled = false
	pass


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	pass # Replace with function body.


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	pass # Replace with function body.


func _on_level_3_button_pressed() -> void:
	pass # Replace with function body.


func _on_level_4_button_pressed() -> void:
	pass # Replace with function body.


func _on_level_5_button_pressed() -> void:
	pass # Replace with function body.


func _on_level_6_button_pressed() -> void:
	pass # Replace with function body.
