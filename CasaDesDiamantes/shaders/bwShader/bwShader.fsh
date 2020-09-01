//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 j = texture2D( gm_BaseTexture, v_vTexcoord );
	float brightness = (j.r + j.g + j.b) / 3.0;
    gl_FragColor = vec4 (brightness, brightness, brightness, j.a); 
}
