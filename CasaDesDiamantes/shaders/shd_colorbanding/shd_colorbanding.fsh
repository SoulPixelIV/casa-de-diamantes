//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float smoothness;
vec4 color;
float range;

void main()
{
	range = 256.0;
	color = v_vColour * texture2D(gm_BaseTexture,v_vTexcoord);
	color.r = (ceil((color.r * range) * smoothness) / smoothness) / range;
	color.g = (ceil((color.g * range) * smoothness) / smoothness) / range;
	color.b = (ceil((color.b * range) * smoothness) / smoothness) / range;
	
    gl_FragColor = color;
}