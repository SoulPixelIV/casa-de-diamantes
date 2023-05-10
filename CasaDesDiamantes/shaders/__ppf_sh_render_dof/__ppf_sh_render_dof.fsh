
/*------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Only compiled binary executables. Don't remove this notice, please.
Copyright (C) 2023 Mozart Junior (FoxyOfJungle). Kazan Games Ltd.
Website: https://foxyofjungle.itch.io/ | Discord: FoxyOfJungle#0167
-------------------------------------------------------------------*/

varying vec2 v_vTexcoord;

uniform sampler2D u_coc_tex;
uniform sampler2D u_dof_tex;
uniform float u_downscale;

void main() {
	vec4 col_tex = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 dof = texture2D(u_dof_tex, v_vTexcoord);
	float coc = texture2D(u_coc_tex, v_vTexcoord).r;
	
	float blending = mix(coc, 1.0, step(0.51, u_downscale));
	gl_FragColor = mix(col_tex, dof, blending);//coc
}
