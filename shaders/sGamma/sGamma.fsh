// shader_gamma_legacy.fsh
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

uniform float u_gamma; // 0.0 (oscuro) to 1.0 (claro), 0.5 = neutral

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 baseColor = texColor * v_vColour;

    // Simula gamma legacy tipo Minecraft: curva no lineal
    float gamma = clamp(u_gamma * 2.0, 0.01, 2.0); // evita dividir por 0
    vec3 adjusted = pow(baseColor.rgb, vec3(1.0 / gamma));

    gl_FragColor = vec4(adjusted, baseColor.a);
}
