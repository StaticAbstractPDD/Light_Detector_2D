shader_type canvas_item;
uniform float comparison_value: hint_range(0.0, 10.0);
void light() {
	vec3 light_color = LIGHT_COLOR.rgb * LIGHT_ENERGY/comparison_value;
	LIGHT = vec4(light_color,1);
}
