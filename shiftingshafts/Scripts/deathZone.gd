extends Area2D

func _on_body_entered(body):
	print("AHHHHHhhh")
	get_tree().reload_current_scene()
