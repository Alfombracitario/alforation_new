attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

uniform vec2 _t; // x = s, y = c
uniform vec2 fog_settings; // x = near, y = far
uniform vec3 fog_color;
uniform float _move;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fogFactor;

void main() {
    float a = -floor((in_Colour.a - 0.5) * 255.0);

    //Condición: vértice arriba (a > 0), color no blanco 

    bool apply_move = (in_Position.z < -1.0) && any(lessThan(in_Colour.rgb, vec3(0.999)));

    //Solo aplicamos movimiento si se cumple la condición
    float move = apply_move ? _move : 0.0;
	
	a += move;
    float dx = _t.y *a;	
    float dy = _t.x *a;

    vec4 object_space_pos = vec4(in_Position.xy + vec2(dx, dy), in_Position.z, 1.0);

    vec4 view_pos = gm_Matrices[MATRIX_VIEW] * object_space_pos;
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * view_pos;

    // Fog factor
    v_fogFactor = clamp((view_pos.z - fog_settings.x) / (fog_settings.y - fog_settings.x), 0.0, 1.0);
    
    v_vColour = vec4(in_Colour.rgb, 1.0);
    v_vTexcoord = in_TextureCoord;
}
