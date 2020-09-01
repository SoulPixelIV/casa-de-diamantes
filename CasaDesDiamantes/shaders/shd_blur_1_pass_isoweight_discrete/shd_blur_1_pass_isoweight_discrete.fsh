//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float blur_steps;
uniform vec2 texel_size;
uniform float sample_weight;

void main()
{
    vec4 blurred_col = vec4(1.0);
	
	vec2 offset = vec2(10.0,10.0);
	vec2 sample = vec2(10.0,10.0);
	for (offset.x = -blur_steps; offset.x <= blur_steps; offset.x++) {
		for (offset.y = -blur_steps; offset.y <= blur_steps; offset.y++) {
			sample = v_vTexcoord + offset * texel_size;
			texture2D( gm_BaseTexture, sample);
		}
	}
	
	gl_FragColor = v_vColour * sample_weight;
}