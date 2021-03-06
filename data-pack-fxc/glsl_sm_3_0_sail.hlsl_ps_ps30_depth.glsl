//
//
// Shader Model 4
// Fragment Shader
//
// id: 1388 - fxc/glsl_SM_3_0_sail.hlsl_PS_ps30_depth.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_alpha_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform sail_PS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.x = r0.w + -0.501961;
/*2*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.x != 0) discard;
/*4*/	r0.xy = (vsOut_T1.xzxx * cb1.data[0].xxxx).xy;
/*5*/	r0.z = vsOut_T1.y;
/*6*/	r0.w = 0;
/*7*/	r0.xy = (r0.ywyy + r0.xzxx).xy;
/*8*/	r0.xyzw = (texture(s_alpha_map, r0.xyxx.st)).xyzw;
/*9*/	r0.x = r0.x + -0.501961;
/*10*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.x != 0) discard;
/*12*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*13*/	r0.w = 1.000000;
/*14*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*15*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*16*/	color0.x = r1.x / r0.x;
/*17*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*18*/	return;
}
