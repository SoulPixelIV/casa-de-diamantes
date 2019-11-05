//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float imageW;
uniform float imageH;

void main()
{
	vec2 offsetX;
	vec2 offsetY;
	offsetX.x = imageW;
	offsetY.y = imageH;
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetX).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetX).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetY).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetY).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	gl_FragColor.a = alpha;
}
