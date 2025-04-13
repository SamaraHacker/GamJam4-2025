shader_type canvas_item;

uniform vec4 OLDCOLORMAIN : source_color;
uniform vec4 OLDCOLORSECONDARY : source_color;

uniform vec4 NEWCOLORMAIN : source_color;
uniform vec4 NEWCOLORSECONDARY : source_color;


void fragment() {
    vec4 curr_color = texture(TEXTURE, UV);

    // Use a threshold to compare the colors more reliably (to avoid precision issues)
    float threshold = 0.01;  // Adjust as needed to allow for slight differences

    if (distance(curr_color, OLDCOLORMAIN) < threshold) {
        COLOR = NEWCOLORMAIN;
    }
    else if (distance(curr_color, OLDCOLORSECONDARY) < threshold){
        COLOR = NEWCOLORSECONDARY;
    }
    else {
        COLOR = curr_color;
    }
}