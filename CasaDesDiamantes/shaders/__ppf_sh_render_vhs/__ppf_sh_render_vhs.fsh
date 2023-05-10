
/*------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Only compiled binary executables. Don't remove this notice, please.
Copyright (C) 2023 Mozart Junior (FoxyOfJungle). Kazan Games Ltd.
Website: https://foxyofjungle.itch.io/ | Discord: FoxyOfJungle#0167
-------------------------------------------------------------------*/

precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 v_TexelSize;
varying vec2 v_Res;
uniform vec2 u_time_n_intensity;

// >> uniforms
uniform float u_vhs_chromatic_aberration;
uniform float u_vhs_scan_aberration;
uniform float u_vhs_grain_intensity;
uniform float u_vhs_grain_height;
uniform float u_vhs_grain_fade;
uniform float u_vhs_grain_amount;
uniform float u_vhs_grain_speed;
uniform float u_vhs_grain_interval;
uniform float u_vhs_scan_speed;
uniform float u_vhs_scan_size;
uniform float u_vhs_scan_offset;
uniform float u_vhs_hscan_offset;
uniform float u_vhs_flickering_intensity;
uniform float u_vhs_flickering_speed;
uniform float u_vhs_wiggle_amplitude;

// >> dependencies
uniform float u_lens_distortion_enable;
uniform float u_lens_distortion_amount;
vec2 lens_distortion_uv(vec2 uv) {
	vec2 _uv = uv;
	vec2 uv2 = _uv - 0.5;
	float at = atan(uv2.x, uv2.y);
	float uvd = length(uv2);
	float dist = u_lens_distortion_amount * u_time_n_intensity.y;
	uvd *= (pow(uvd, 2.0) * dist + 1.0);
	_uv = vec2(0.5) + vec2(sin(at), cos(at)) * uvd;
	return _uv;
}

// >> effect
const float Phi = 1.61803398875;

// (C) 2015, Dominic Cerisano
float gold_noise(in vec2 fpos, in float seed) {
	highp vec2 p = fpos;
	return fract(tan(distance(p*Phi, p)*seed)*p.x);
}

float bar_vertical(float uv, float pos, float offset, float size) {
    return (smoothstep(pos-size, pos, uv) * offset) - smoothstep(pos, pos+size, uv) * offset;
}

float scan_vertical(float uv, float pos, float offset, float size) {
    return (smoothstep(pos-size, pos, 1.0-uv) * offset) - step(pos, 1.0-uv) * offset;
}

vec4 vhs_fx(vec2 uv, vec2 fpos) {
	vec4 _col;
	float geral_intensity = u_time_n_intensity.y;
	vec2 uv2 = mix(uv, lens_distortion_uv(uv), step(0.5, u_lens_distortion_enable));
	vec2 offset;
	uv.y = 1.0-uv.y;
	
	// sets
	float scan_aberration_sum = 0.0;
	float time = u_time_n_intensity.x;
	
	// wiggle
	uv.y += sin(time*15.0 + sin(time*15.0)) * u_vhs_wiggle_amplitude * geral_intensity;
	
	// bottom glitch
	float scan_time = time * u_vhs_scan_speed;
	
	float hscan = sin(scan_time*60.0 + sin(scan_time))*0.1+0.5;
	float vscan = floor(bar_vertical(uv.y, 0.008, hscan, 0.03)*5.0) * 0.01;
	uv.x -= vscan * geral_intensity;
	scan_aberration_sum += vscan * u_vhs_scan_aberration;
	
	// scan
	float wave = sin(uv.y*4.0 + scan_time);
	float scan = step(sin(wave), wave) * u_vhs_hscan_offset;
	uv.x += scan * geral_intensity;
    
	float scan_noise = gold_noise(vec2(time, fpos.y), 1.0) * geral_intensity;
    
	for(float i = 1.0; i < 2.0; i+=1.0/2.0) {
		float scan_yoffset = -u_vhs_scan_size + fract(scan_time*0.1 * i) * 2.0;
		float scan_hscan = sin(uv.y + scan_time * i);
		float scan = scan_vertical(uv.y, scan_yoffset, u_vhs_scan_offset*uv.y*scan_hscan, u_vhs_scan_size);
		uv.x -= scan * scan_noise;
		scan_aberration_sum += scan * u_vhs_scan_aberration;
	}
	
	// chromatic aberration
	float chroma_dist = v_TexelSize.x * geral_intensity * u_vhs_chromatic_aberration + scan_aberration_sum;
	vec4 col_chroma_a = texture2D(gm_BaseTexture, vec2(uv.x+chroma_dist, 1.0-uv.y));
	vec4 col_chroma_b = texture2D(gm_BaseTexture, vec2(uv.x, 1.0-uv.y));
	vec4 col_chroma_c = texture2D(gm_BaseTexture, vec2(uv.x-chroma_dist, 1.0-uv.y));
    
	vec4 col_prisma_a = vec4(vec3(1.0, 0.0, 0.0), 1.0);
	vec4 col_prisma_b = vec4(vec3(0.0, 1.0, 0.0), 1.0);
	vec4 col_prisma_c = vec4(vec3(0.0, 0.0, 1.0), 1.0);
    
	vec4 col = col_chroma_a*col_prisma_a + col_chroma_b*col_prisma_b + col_chroma_c*col_prisma_c;
	vec4 col_sum = (col_prisma_a + col_prisma_b + col_prisma_c);
	_col = col / col_sum;
	
	// grain
	float grain_time = 100.0 + time;
	float grain_lines = v_Res.y / max(2.0, u_vhs_grain_amount);
	float sprinkles = gold_noise(vec2(1.0+grain_time, fpos.y), 1.0);
	sprinkles = 1.0 + pow(sprinkles, 7.0) * step(u_vhs_grain_interval, sprinkles);
    
	float grain_yoffset = (grain_time * grain_lines * u_vhs_grain_speed) * sprinkles;
	float mask = floor(mod(fpos.y-grain_yoffset, grain_lines+u_vhs_grain_height) / grain_lines) * smoothstep(mix(2.0, 0.0, u_vhs_grain_fade), 0.0, uv.y);
    
	float grain = pow(gold_noise(fpos, 1.0+fract(grain_time)), 1.0/u_vhs_grain_intensity) * mask;
	_col.rgb += grain * geral_intensity;
	
	// flickering
	float flickering_time = time * u_vhs_flickering_speed;
	float scanlines = (sin(uv2.y*0.8 + flickering_time*15.0 + sin(flickering_time))*0.5+0.2) * u_vhs_flickering_intensity;
	_col.rgb = mix(_col.rgb, vec3(scanlines), scanlines * geral_intensity);
	
	return _col;
}

void main() {
	gl_FragColor = vhs_fx(v_vTexcoord, gl_FragCoord.xy);
}
