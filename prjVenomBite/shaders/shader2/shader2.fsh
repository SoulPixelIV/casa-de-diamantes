//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 test = v_vTexcoord + vec2(0.1,0.1);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, test);
}
