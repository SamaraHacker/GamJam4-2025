extends AnimatedSprite2D

@onready var main_color_picker : ColorPickerButton = get_node_or_null("../MainColorPickerButton")
@onready var secondary_color_picker : ColorPickerButton = get_node_or_null("../SecondaryColorPickerButton")

func _ready():
	main_color_picker.color = Global.player_main_color
	secondary_color_picker.color = Global.player_secondary_color
	(self.material as ShaderMaterial).set_shader_parameter("NEWCOLORMAIN", Global.player_main_color)
	(self.material as ShaderMaterial).set_shader_parameter("NEWCOLORSECONDARY", Global.player_secondary_color)
	
func _on_main_color_picker_color_changed(color: Color) -> void:
	Global.player_main_color = color
	if self.material is ShaderMaterial:
		(self.material as ShaderMaterial).set_shader_parameter("NEWCOLORMAIN", Global.player_main_color)

func _on_color_picker_button_color_changed(color: Color) -> void:
	Global.player_secondary_color = color
	if self.material is ShaderMaterial:
		(self.material as ShaderMaterial).set_shader_parameter("NEWCOLORSECONDARY", Global.player_secondary_color)
	print("worked")
