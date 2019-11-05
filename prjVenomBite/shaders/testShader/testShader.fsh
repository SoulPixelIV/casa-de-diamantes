//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float imageW;
uniform float imageH;
//uniform int res;

void main()
{
    int res = 8;
    vec4 newCol = vec4(0,0,0,0);
    vec4 div = vec4(res*res,res*res,res*res,res*res);
    
    for (int i = 0; i < res * res; i++)    
    {
        float x = v_vTexcoord.x + float(res/2 + (i / res)) * imageW;
        float y = v_vTexcoord.y + float(float(res/2) + mod(float(i), float(res))) * imageH;
        
        //float x = v_vTexcoord.x - (res / 2.0) + (i / res * imageW);
        //float y = v_vTexcoord.y - (res / 2.0) + (mod(i, res) * imageH);

        newCol += texture2D(gm_BaseTexture, vec2(x, y)) / div;
    }
    gl_FragColor = newCol;
}