attribute vec3 in_Position;
attribute vec3 in_TextureCoord;

varying vec4 v_color;
varying vec2 v_coord;
varying float v_depth;

uniform vec3 t_color;
uniform vec2 p_pos;
void main()
{
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.x+p_pos.x,in_Position.y+p_pos.y,in_Position.z,1);
	
    v_color = vec4(t_color.x,t_color.y,t_color.z,1);
	v_coord = in_TextureCoord.xy;
	v_depth = -gl_Position.z;
}