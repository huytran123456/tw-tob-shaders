// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3904 - fxc/glsl_SM_3_0_GaussianBlur.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;

out vec4 vsOut_T0;

void main()
{
  vec4 r0;

/*0*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	gl_Position.xyzw = r0.xyzw;
/*3*/	vsOut_T0.xyzw = r0.xyzw;
/*4*/	return;
}
