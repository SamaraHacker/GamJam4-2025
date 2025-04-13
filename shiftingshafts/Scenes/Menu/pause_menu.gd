extends Control

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.visible = false  # Hide the pause menu

func _on_main_menu_pressed() -> void:
	get_tree().paused = false  # Unpause before going to the menu
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
