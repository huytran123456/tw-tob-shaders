//
//
// Shader Model 4
// Fragment Shader
//
// id: 815 - fxc/glsl_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_imposter.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
flat in vec4 vsOut_N0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
uniform sampler2D s_snow_normals;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*22*/	r1.xyzw = (texture(s_detail_map, r1.xyxx.st)).xyzw;
/*23*/	r2.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r1.w = r1.w + -1.000000;
/*25*/	r1.w = r2.x * r1.w + 1.000000;
/*26*/	r1.w = saturate(r1.w * r2.x);
/*27*/	r2.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*28*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*29*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*30*/	r1.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*31*/	if(floatBitsToUint(r1.w) != 0u) {
/*32*/	  r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*33*/	  if(floatBitsToUint(r1.w) != 0u) {
/*34*/	    r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*35*/	    r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*36*/	    r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*37*/	    r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*38*/	    r1.w = -r1.w + 1.000000;
/*39*/	    r1.w = max(r1.w, 0.000000);
/*40*/	    r3.z = sqrt(r1.w);
/*41*/	    r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*42*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	    r1.w = inversesqrt(r1.w);
/*44*/	    r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*45*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*46*/	    r1.w = inversesqrt(r1.w);
/*47*/	    r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*48*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	    r1.w = inversesqrt(r1.w);
/*50*/	    r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*51*/	    r5.xyz = (r3.yyyy * r5.xyzx).xyz;
/*52*/	    r3.xyw = (r3.xxxx * r4.xyxz + r5.xyxz).xyw;
/*53*/	    r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*54*/	    r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*55*/	    r1.w = inversesqrt(r1.w);
/*56*/	    r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*57*/	    r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*58*/	    r4.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*59*/	    r4.xyzw = (texture(s_snow_normals, r4.xyxx.st)).xyzw;
/*60*/	    r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*61*/	    r4.xz = (r4.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*62*/	    r0.w = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*63*/	    r0.w = -r0.w + 1.000000;
/*64*/	    r0.w = max(r0.w, 0.000000);
/*65*/	    r4.y = sqrt(r0.w);
/*66*/	    r3.xyz = (r4.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*67*/	    r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*68*/	    r0.w = inversesqrt(r0.w);
/*69*/	    r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*70*/	    r4.xz = (cb1.data[0].xxyx).xz/**/;
/*71*/	    r4.y = -1.000000;
/*72*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*73*/	    r0.w = inversesqrt(r0.w);
/*74*/	    r4.xyz = (r0.wwww * r4.xyzx).xyz;
/*75*/	    r0.w = saturate(dot(vec3(-r4.xyzx), vec3(r3.xyzx)));
/*76*/	    r1.w = cb1.data[1].x * cb1.data[1].x;
/*77*/	    r1.w = r1.w * 1.250000;
/*78*/	    r1.w = min(r1.w, 1.000000);
/*79*/	    r2.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*80*/	    r2.w = r2.w * 4.000000;
/*81*/	    r1.w = r1.w * 0.200000 + r2.w;
/*82*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*83*/	    r0.w = r0.w + -r1.w;
/*84*/	    r0.w = saturate(r0.w * 200.000000);
/*85*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*86*/	    r0.w = r0.w * r0.w;
/*87*/	    r0.w = r0.w * r1.w;
/*88*/	    r0.xyz = (-r0.xyzx * r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*89*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*90*/	  }
/*91*/	}
/*92*/	r0.xyz = (r2.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*93*/	r0.xyz = (-r2.xyzx + r0.xyzx).xyz;
/*94*/	r0.xyz = saturate(vsOut_T7.yyyy * r0.xyzx + r2.xyzx).xyz;
/*95*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*96*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*97*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*98*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*99*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*100*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*101*/	color0.w = 1.000000;
/*102*/	return;
}
