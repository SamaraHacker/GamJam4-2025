extends Area2D

@export var nextLevel = ""

var winTimer = 0
var win = false


func _on_body_entered(body):
	if not win:
		$Sprite2D/AnimationPlayer.play("Open")
		$AudioStreamPlayer2D.play()
	winTimer = Time.get_ticks_msec() + 1000
	win = true

func _process(delta: float) -> void:
	if win and winTimer < Time.get_ticks_msec():
		if(nextLevel == "level_2"):
			Global.completedLevel1 = true
			get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
		if(nextLevel == "level_3"):
			Global.completedLevel2 = true
			get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
		if(nextLevel == "level_4"):
			Global.completedLevel3 = true
			get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
		if(nextLevel == "level_5"):
			Global.completedLevel4 = true
			get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
		if(nextLevel == "level_6"):
			Global.completedLevel5 = true
			get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
		if(nextLevel == "win_screen"):
			get_tree().change_scene_to_file("res://Scenes/Menu/win_menu.tscn")
	
