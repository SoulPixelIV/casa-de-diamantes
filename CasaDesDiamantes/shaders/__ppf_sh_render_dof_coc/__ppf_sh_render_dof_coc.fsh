
/*------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Only compiled binary executables. Don't remove this notice, please.
Copyright (C) 2023 Mozart Junior (FoxyOfJungle). Kazan Games Ltd.
Website: https://foxyofjungle.itch.io/ | Discord: FoxyOfJungle#0167
-------------------------------------------------------------------*/

varying vec2 v_vTexcoord;

uniform float u_bokeh_radius;
uniform float u_focus_distance;
uniform float u_focus_range;
uniform float u_use_zdepth;
uniform sampler2D u_zdepth_tex;

// >> dependencies
uniform float u_lens_distortion_enable;
uniform float u_lens_distortion_amount;
vec2 lens_distortion_uv(vec2 uv) {
	vec2 _uv = uv;
	vec2 uv2 = _uv - 0.5;
	float at = atan(uv2.x, uv2.y);
	float uvd = length(uv2);
	float dist = u_lens_distortion_amount;
	uvd *= (pow(uvd, 2.0) * dist + 1.0);
	_uv = vec2(0.5) + vec2(sin(at), cos(at)) * uvd;
	return _uv;
}

float get_CoC(float depth, float f_distance, float f_range) {
	float coc = clamp((1.0 / f_distance - 1.0 / depth) * f_range, -1.0, 1.0);
	return abs(coc) * u_bokeh_radius;
}

void main() {
	if (u_use_zdepth > 0.5) {
		vec2 uv = v_vTexcoord;
		float depth = texture2D(u_zdepth_tex, mix(uv, lens_distortion_uv(uv), step(0.5, u_lens_distortion_enable))).r;
		float range = get_CoC(depth, u_focus_distance, 1.0-u_focus_range);
		gl_FragColor = vec4(vec3(range), 1.0);
	} else {
		gl_FragColor = vec4(1.0);
	}
}
