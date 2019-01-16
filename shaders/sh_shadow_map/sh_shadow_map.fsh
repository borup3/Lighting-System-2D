//
// Shadow map shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Comment this out to disable average blending
#define BLEND_AVERAGE

// How many iterations of blending to perform, if BLEND_AVERAGE is enabled?
// This performs this number of iterations towards BLEND_TEXELS
// Supports 1, 2, 4, 8, 12
#define BLEND_ITERATIONS 8

// How many texels to diverge from this fragment when blending?
// BLEND_ITERATIONS is how many steps we take to reach this distance
#define BLEND_TEXELS 64.0

// The ambient shadow color and intensity
uniform float u_AmbientShadow;

// Texel information
uniform vec2 u_TexelSize;

// Blend the fragment into the shadow map
vec4 average(sampler2D sampler, vec2 coord, float dist);

//
//	This shader is rendered with subtractive blending (bm_subtract)
//
void main()
{
#ifdef BLEND_AVERAGE
	//
	//	Blending is ENABLED
	//

	/* ############# 12 ############# */
	#if BLEND_ITERATIONS == 12
		vec4 blend = vec4(1.0) - (1.0 / 12.0) * (average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (1.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (2.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (3.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (4.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (5.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (6.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (7.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (8.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (9.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (10.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (11.0 / 12.0))
											  +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS));
	#endif
	//

	/* ############# 8 ############# */
	#if BLEND_ITERATIONS == 8
		vec4 blend = vec4(1.0) - (1.0 / 8.0) * (average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (1.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (2.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (3.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (4.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (5.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (6.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (7.0 / 8.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS));
	#endif

	/* ############# 4 ############# */
	#if BLEND_ITERATIONS == 4
		vec4 blend = vec4(1.0) - (1.0 / 4.0) * (average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (1.0 / 4.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (2.0 / 4.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (3.0 / 4.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS));
	#endif
	
	/* ############# 2 ############# */
	#if BLEND_ITERATIONS == 2
		vec4 blend = vec4(1.0) - (1.0 / 2.0) * (average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS * (1.0 / 2.0))
											 +  average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS));
	#endif
	
	/* ############# 1 ############# */
	#if BLEND_ITERATIONS == 1
		vec4 blend = vec4(1.0) - average(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS);
	#endif
	
	gl_FragColor = blend * u_AmbientShadow;
	
#else
	//
	//	Blending is DISABLED
	//

	vec4 fragment = vec4(1.0) - texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = fragment * u_AmbientShadow;
	
#endif
}

// You can uncomment adjacent fragments to do a more complete blend
vec4 average(sampler2D sampler, vec2 coord, float dist) {
	vec2 tc0 = coord + (dist * vec2(-u_TexelSize.s,	-u_TexelSize.t));
	//vec2 tc1 = coord + (dist * vec2(-u_TexelSize.s,	0.0));
	vec2 tc2 = coord + (dist * vec2(+u_TexelSize.s,	-u_TexelSize.t));
	//vec2 tc3 = coord + (dist * vec2(+u_TexelSize.s,	0.0));
	vec2 tc4 = coord + (dist * vec2(0.0,			0.0));
	//vec2 tc5 = coord + (dist * vec2(0.0,			+u_TexelSize.t));
	vec2 tc6 = coord + (dist * vec2(-u_TexelSize.s,	+u_TexelSize.t));
	//vec2 tc7 = coord + (dist * vec2(0.0,			-u_TexelSize.t));
	vec2 tc8 = coord + (dist * vec2(+u_TexelSize.s,	+u_TexelSize.t));
	
	vec4 col0 = texture2D(sampler, tc0);
	//vec4 col1 = texture2D(sampler, tc1);
	vec4 col2 = texture2D(sampler, tc2);
	//vec4 col3 = texture2D(sampler, tc3);
	vec4 col4 = texture2D(sampler, tc4);
	//vec4 col5 = texture2D(sampler, tc5);
	vec4 col6 = texture2D(sampler, tc6);
	//vec4 col7 = texture2D(sampler, tc7);
	vec4 col8 = texture2D(sampler, tc8);
	
	// 1x for diagonals
	// 2x for adjacent
	// 4x for center
	// becomes 16 and 1 / 16 is 0.0625
	//return (1.0 * col0 + 2.0 * col1 + 1.0 * col2 + 2.0 * col3 + 4.0 * col4 + 2.0 * col5 + 1.0 * col6 + 2.0 * col7 + 1.0 * col8) * 0.0625;
	
	// Even blend with slight origin bias
	return (2.5 * col0 + 2.5 * col2 + 6.0 * col4 + 2.5 * col6 + 2.5 * col8) * 0.0625;
}
