//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float imageW;
uniform float imageH;
uniform vec4 uvs;
//uniform int res;

void main()
{
    int res = 4;
    highp vec4 newCol = vec4(0,0,0,0);
    vec4 div = vec4(res*res,res*res,res*res,res*res);
    
    for (int i = 0; i < res * res; i++)    
    {
        float x = clamp(v_vTexcoord.x + float(res/2 + (i / res)) * imageW, uvs.x, uvs.z);
        float y = clamp(v_vTexcoord.y + float(float(res/2) + mod(float(i), float(res))) * imageH, uvs.y, uvs.w);

        newCol += texture2D(gm_BaseTexture, vec2(x, y)) / div;
    }
    gl_FragColor = newCol;
}