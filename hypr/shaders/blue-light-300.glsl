#version 300 es
precision mediump float;

uniform sampler2D tex;
in vec2 v_texcoord;
out vec4 fragColor;

void main() {
  vec4 c = texture(tex, v_texcoord);
  mat3 warm = mat3(
  1.00, 0.00, 0.00,
  0.00, 0.80, 0.00,
  0.00, 0.00, 0.60
);

  vec3 outc = clamp(warm * c.rgb, 0.0, 1.0);
  fragColor = vec4(outc, c.a);
}
