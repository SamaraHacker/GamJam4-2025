shader_type canvas_item;

uniform vec4 OLDCOLORMAIN : source_color;
uniform vec4 OLDCOLORSECONDARY : source_color;

uniform vec4 NEWCOLORMAIN : source_color;
uniform vec4 NEWCOLORSECONDARY : source_color;

void fragment() {
	vec4 curr_color = texture(TEXTURE, UV);

	// Compare with some tolerance for minor differences
	float tolerance = 0.01;

	if (distance(curr_color.rgb, OLDCOLORMAIN.rgb) < tolerance) {
		COLOR = vec4(NEWCOLORMAIN.rgb, curr_color.a);
	}
	else if (distance(curr_color.rgb, OLDCOLORSECONDARY.rgb) < tolerance) {
		COLOR = vec4(NEWCOLORSECONDARY.rgb, curr_color.a);
	}
	else {
		COLOR = curr_color;
	}
}