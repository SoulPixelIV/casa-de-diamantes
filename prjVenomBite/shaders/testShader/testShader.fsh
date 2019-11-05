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

	vec4 newCol = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 div = vec4(8,8,8,8);
	newCol += texture2D(gm_BaseTexture, v_vTexcoord + offsetX) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord - offsetX) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord + offsetY) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord - offsetY) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord + offsetX + offsetY) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord - offsetX - offsetY) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord + offsetY + offsetX) / div;
	newCol += texture2D(gm_BaseTexture, v_vTexcoord - offsetY - offsetX) / div;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	gl_FragColor = newCol;
}
