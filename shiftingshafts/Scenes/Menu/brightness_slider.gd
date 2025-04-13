extends HSlider

@onready var brightness_slider: HSlider = $"."

func _ready() -> void:
	brightness_slider.value = GlobalWorldEnvrironment.environment.adjustment_brightness

func _on_value_changed(value: float) -> void:
	GlobalWorldEnvrironment.environment.adjustment_brightness = value
