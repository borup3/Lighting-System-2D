//
//	Light fragment shader
//

// Comment this out to disable lit fragment blending
#define BLEND_LIT_FRAGMENTS
// Comment this out to disable unlit fragment blending
#define BLEND_UNLIT_FRAGMENTS

// How many texels to diverge from this fragment when blending?
#define BLEND_TEXELS_IN_SHADOW 8.0	// if BLEND_UNLIT_FRAGMENTS is defined
#define BLEND_TEXELS_IN_LIGHT 4.0	// if BLEND_LIT_FRAGMENTS is defined

// Maps to eLightType enum in lighting_global
#define eLightType_Point 0
#define eLightType_Spot 1
#define eLightType_Area 2
#define eLightType_Directional 3
#define eLightType_Line 4

#define PI 3.1415926535897932384626433832795

// Conversion between degrees<->radians
#define DEG_TO_RAD (PI / 180.0)
#define RAD_TO_DEG (180.0 / PI)

// We get these from the vertex shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//
//	Uniforms
//

// Lookup texture for light intensity
uniform sampler2D u_LutIntensity;

// The light's attributes
uniform vec2 u_LightPosition;
uniform vec4 u_LightColor;
uniform float u_LightRange;
uniform float u_LightIntensity;
uniform float u_LightAngle;
uniform float u_LightDirection;
uniform float u_LightWidth;
uniform int u_LightType;

// Area light precalculated attributes
uniform vec2 u_LineEmitterPoint1;		// The first point on the line of the area light
uniform vec2 u_LineEmitterPoint2;		// The second point on the line of the area light

// Texel information
uniform vec2 u_TexelSize;

//
//	Light extension modules
//

// Light attenuation extension (Lighting -> Extension Modules -> Attenuation)
uniform bool u_AttenuationEnabled;	// Is attenuation enabled?
uniform float u_AttenuationAlpha;	// A good default if using LUTs is 0.2
uniform float u_AttenuationBeta;	// A good default if using LUTs is 0.4

//
//	Forward declarations
//

// Light intensity to a point emitter P
float intensityPoint(vec2 P, vec2 tex, float range);

// Returns the attenuation of intensity for a given x between 0 and 1
// You can play with parameterization of this function here https://www.desmos.com/calculator/nmnaud1hrw
// If you don't want to use LUTs for light intensity (i.e. you modify this shader and remove that functionality)
// then you'll probably want another attenuation function than this one (one that converges on zero)
float attenuation(float X, float alpha, float beta);

// Attenuation of the light intensity at the vertices of an area light's line emitter
// This calls attenuation(X, alpha, beta) with parameters alpha=0.0 and beta=10.0
float attenuationAreaLightVertex(float X);

// Gets the angle difference from the coord to the light's direction
float angleDiff(vec2 origin, vec2 coord, float direction);

// Blend the fragment into the shadow map
vec4 blendFragment(sampler2D sampler, vec2 coord, float dist);

//
//	This shader is rendered with additive blending (bm_add)
//

void main()
{
	// Starting light intensity
	float intensity = u_LightIntensity;
	
	/*								*/
	/*		    Point Light			*/
	/*								*/
	if(u_LightType == eLightType_Point) {
		// Distance from point to point emitter
		intensity *= intensityPoint(u_LightPosition, v_vTexcoord, u_LightRange);
	}
	/*								*/
	/*			Spot Light			*/
	/*								*/
	else if(u_LightType == eLightType_Spot) {
		// Distance from point to point emitter
		intensity *= intensityPoint(u_LightPosition, v_vTexcoord, u_LightRange);
		// Dim it by angular distance to cone
		intensity *= clamp(u_LightAngle * 0.5 / angleDiff(u_LightPosition, v_vTexcoord, u_LightDirection), 0.0, 1.0);
	}
	/*								*/
	/*		 Area & Line Light		*/
	/*								*/
	else if(u_LightType == eLightType_Area || u_LightType == eLightType_Line) {
		// The line emitter is precomputed in constants u_LineEmitterPoint1 and u_LineEmitterPoint2
		if(u_LightType == eLightType_Area) {
			// Compute if the fragment falls on the correct side of this infinite line
			float side = (v_vTexcoord.x - u_LineEmitterPoint1.x) * (u_LineEmitterPoint2.y - u_LineEmitterPoint1.y) - (v_vTexcoord.y - u_LineEmitterPoint1.y) * (u_LineEmitterPoint2.x - u_LineEmitterPoint1.x);
			if(side > 0.0) {
				// This side is not lit
				return;
			}
		}
		
		// Project the fragment onto the line emitter
		vec2 p1p2 = (u_LineEmitterPoint2 - u_LineEmitterPoint1) / u_TexelSize;
		float projection = dot((v_vTexcoord - u_LineEmitterPoint1) / u_TexelSize, p1p2) / dot(p1p2, p1p2);
		if(projection < 0.0) {
			// Vertex
			intensity *= intensityPoint(u_LineEmitterPoint1, v_vTexcoord, u_LightRange)
					   * attenuationAreaLightVertex(-clamp(projection, -1.0, 0.0));
		}
		else if(projection > 1.0) {
			// Vertex
			intensity *= intensityPoint(u_LineEmitterPoint2, v_vTexcoord, u_LightRange)
					   * attenuationAreaLightVertex(clamp(projection - 1.0, 0.0, 1.0));
		}
		else {
			// Perpendicular
			intensity *= intensityPoint(u_LineEmitterPoint1 + (u_LineEmitterPoint2 - u_LineEmitterPoint1) * projection, v_vTexcoord, u_LightRange);
		}
	}
	
	// Get the fragment of this light
	vec4 fragment = texture2D(gm_BaseTexture, v_vTexcoord);
	
	if(fragment.a > 0.5) {
		// This fragment is in shadow
#ifdef BLEND_UNLIT_FRAGMENTS
		// Blend it with nearby fragments
		vec4 blend = 0.50 * (blendFragment(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS_IN_SHADOW * 0.50)
						  +  blendFragment(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS_IN_SHADOW));
		gl_FragColor = u_LightColor * intensity * (1.0 - blend.a);
#endif
	}
	else {
#ifdef BLEND_LIT_FRAGMENTS
		vec4 blend = 0.50 * (blendFragment(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS_IN_LIGHT * 0.50)
						  +  blendFragment(gm_BaseTexture, v_vTexcoord, BLEND_TEXELS_IN_LIGHT));
		gl_FragColor = u_LightColor * intensity * (1.0 - blend.a);
#else
		gl_FragColor = u_LightColor * intensity * (1.0 - fragment.a);
#endif
	}
}

//
//	Function implementations
//

float intensityPoint(vec2 P, vec2 tex, float range) {
	// Distance from point to point emitter
	float distx = distance(vec2(P.x, 0.0), vec2(tex.x, 0.0)) / u_TexelSize.x;
	float disty = distance(vec2(0.0, P.y), vec2(0.0, tex.y)) / u_TexelSize.y;
	float distPixels = sqrt((distx * distx) + (disty * disty));
	
	// Get light intensity from lut
	float T = clamp(distPixels / range, 0.0, 1.0);
	vec4 intensity = texture2D(u_LutIntensity, vec2(T, 0.0));
	if(!u_AttenuationEnabled) return intensity.a;
	return intensity.a * attenuation(T, u_AttenuationAlpha, u_AttenuationBeta);
}

float attenuation(float X, float alpha, float beta) {
	return 1.0 / (1.0 + alpha * X + beta * X * X);
}

float attenuationAreaLightVertex(float X) {
	return attenuation(X, 0.0, 10.0);
}

float angleDiff(vec2 origin, vec2 coord, float direction) {
	// Get the angle from origin to coordinate
	float angle = atan((origin.y - coord.y) * u_TexelSize.x, (origin.x - coord.x) * u_TexelSize.y);
	// Convert from radians to degrees in [0; 360] counter-clockwise order
	angle = mod(360.0 - ((RAD_TO_DEG * angle) + 180.0), 360.0);
	// Return the shortest distance between the two angles
	return abs(mod(mod(angle - direction, 360.0) + 540.0, 360.0) - 180.0);
}

// You can uncomment adjacent fragments to do a more complete blend
vec4 blendFragment(sampler2D sampler, vec2 coord, float dist) {
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