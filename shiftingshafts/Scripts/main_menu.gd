extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/options_menu.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/level_selection.tscn")
	pass # Replace with function body.
