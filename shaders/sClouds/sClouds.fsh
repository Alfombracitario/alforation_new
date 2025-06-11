varying vec4 v_color;
varying vec2 v_coord;
varying float v_depth; // Profundidad en view space (z-coordinate)

uniform vec3 fog_color; // Color de la niebla (RGB)
uniform vec2 fog_settings; // x = near, y = far
uniform float time;

void main()
{
    // Desplazamiento de textura (opcional)
    vec2 scroll = vec2(.000244140625,.000244140625)*time;
    vec4 tex = texture2D(gm_BaseTexture, fract(v_coord + scroll));
    
    // Color base
    vec4 final_color = v_color * tex;
    
    // Cálculo correcto del factor de niebla
    float fog_factor = smoothstep(fog_settings.x, fog_settings.y, abs(v_depth));
    
    // Mezcla con niebla (preservando el alpha)
    gl_FragColor = mix(final_color, vec4(fog_color, final_color.a), fog_factor);
}