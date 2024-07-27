shader_type canvas_item;
render_mode light_only;
global uniform float MAX_LIGHT_ENERGY;
void light() {
	vec3 light_color = LIGHT_COLOR.rgb * LIGHT_ENERGY/MAX_LIGHT_ENERGY;
	LIGHT = vec4(light_color,1);
}
