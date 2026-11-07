shader_type canvas_item;

uniform vec4 colour1 : source_color = vec4(0.9843, 0.573, 0.2353, 1);
uniform vec4 colour2 : source_color = vec4(0.7843, 0.2941, 0.5317, 1);
uniform vec2 size = vec2(8, 8);

void fragment() {
	// gets location of pixel
	vec2 pos = FRAGCOORD.xy;
	
	// checks if pixel is even or odd (to create that checkerboard pattern)
	float colourcheck = mod(floor(pos.x / size.x) + floor(pos.y / size.y), 2);
	COLOR = mix(colour1, colour2, colourcheck);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
