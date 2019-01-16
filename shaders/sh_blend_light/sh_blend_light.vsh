//
//	Light vertex shader
//

// Vertex format
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_Texcoord;					 // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    v_vColour = in_Colour;
	v_vTexcoord = in_Texcoord;
	
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}
