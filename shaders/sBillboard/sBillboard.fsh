varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fogFactor;

uniform vec3 fog_color; // color de niebla (por ejemplo, gris: vec3(0.5, 0.5, 0.5))

void main()
{
    vec4 tex_color = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 base_color = v_vColour * tex_color;

    if (base_color.a < 0.1) discard;

    // Mezcla el color con el color de la niebla
    vec3 final_rgb = mix(base_color.rgb, fog_color, v_fogFactor);
    gl_FragColor = vec4(final_rgb, base_color.a);
}
