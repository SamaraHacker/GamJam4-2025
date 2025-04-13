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
		get_tree().change_scene_to_file("res://Scenes/" + nextLevel + ".tscn")
	
