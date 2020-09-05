// Original shader by Gaming Reverends (https://youtu.be/QjXE8r0q0nI)
// Edited by Sarek Lambert
varying vec2 v_vTexcoord;
varying vec2 v_vMaskcoord;
varying vec4 v_vColour;

uniform sampler2D maskTex;
uniform sampler2D rampTex;
	uniform float rampXMin;
	uniform float rampXMax;
	uniform float rampYMin;
	uniform float time;

void main() {
    // Factor rimSize into time
		float timeExt = time + time * 0.17;

		// Get texture samples
	vec4 baseCol = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float maskVal = texture2D(maskTex, v_vMaskcoord).r;
		
		// Colored rim
		// Get ramp color sample
		float rampPos = smoothstep(maskVal, maskVal + 0.17, timeExt);
		vec4 rampCol = texture2D(rampTex, vec2(rampXMin + rampXMax * rampPos, rampYMin));
		
		// Mix RGBA
		float blendWeight = smoothstep(maskVal + 0.17 * 0.25, maskVal + 0.17, timeExt);
		baseCol.rgb = mix(rampCol.rgb, baseCol.rgb, blendWeight);
		float alphaWeight = smoothstep(rampPos, rampPos, 0.25);
		baseCol.a = mix(baseCol.a, rampCol.a * baseCol.a, alphaWeight);
		
		// Apply mask val and edge smoothness
		baseCol.a *= smoothstep(maskVal, maskVal + 0.08, timeExt);
		
	// Output
    gl_FragColor = baseCol;
}