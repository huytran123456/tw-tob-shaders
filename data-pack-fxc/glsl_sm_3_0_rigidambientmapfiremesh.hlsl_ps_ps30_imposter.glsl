//
//
// Shader Model 4
// Fragment Shader
//
// id: 542 - fxc/glsl_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_imposter.glsl
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
uniform sampler2D s_ambient_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb3.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb4.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb4.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb4.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*22*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*23*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*24*/	r4.x = r3.x;
/*25*/	r4.y = cb1.data[26].x * 0.050000 + r3.y;
/*26*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*27*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*28*/	r1.w = saturate(r4.x * 5.000000);
/*29*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*30*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*32*/	r2.w = log2(r3.z);
/*33*/	r2.w = r2.w * 1.800000;
/*34*/	r2.w = exp2(r2.w);
/*35*/	r2.w = r2.w * 10.000000;
/*36*/	r2.w = min(r2.w, 1.000000);
/*37*/	r1.w = r1.w + r2.w;
/*38*/	r1.w = r1.w * 0.500000;
/*39*/	r2.w = -r3.w + 1.000000;
/*40*/	r2.w = log2(r2.w);
/*41*/	r2.w = r2.w * vsOut_T7.x;
/*42*/	r2.w = exp2(r2.w);
/*43*/	r2.w = min(r2.w, 1.000000);
/*44*/	r2.w = r2.w * vsOut_T7.x;
/*45*/	r3.x = r3.z * 0.250000;
/*46*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*47*/	r3.xyw = (r1.wwww * r4.xyxz + r3.xxxx).xyw;
/*48*/	r0.xyz = (-r0.xyzx * r1.xyzx + r3.xywx).xyz;
/*49*/	r0.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*50*/	r1.x = vsOut_T7.x + -0.025000;
/*51*/	r1.x = max(r1.x, 0.000000);
/*52*/	r1.yzw = (r3.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*53*/	r0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*54*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*55*/	if(floatBitsToUint(r1.x) != 0u) {
/*56*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*57*/	  if(floatBitsToUint(r1.x) != 0u) {
/*58*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*60*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*61*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*62*/	    r1.w = -r1.w + 1.000000;
/*63*/	    r1.w = max(r1.w, 0.000000);
/*64*/	    r1.z = sqrt(r1.w);
/*65*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*66*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	    r1.w = inversesqrt(r1.w);
/*68*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*69*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*70*/	    r1.w = inversesqrt(r1.w);
/*71*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*72*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	    r1.w = inversesqrt(r1.w);
/*74*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*76*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*77*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*78*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*79*/	    r1.w = inversesqrt(r1.w);
/*80*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*81*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*82*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*83*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*84*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*85*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*86*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*87*/	    r0.w = -r0.w + 1.000000;
/*88*/	    r0.w = max(r0.w, 0.000000);
/*89*/	    r2.y = sqrt(r0.w);
/*90*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*91*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	    r0.w = inversesqrt(r0.w);
/*93*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*94*/	    r2.xz = (cb2.data[0].xxyx).xz/**/;
/*95*/	    r2.y = -1.000000;
/*96*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*97*/	    r0.w = inversesqrt(r0.w);
/*98*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*99*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*100*/	    r1.x = cb2.data[1].x * cb2.data[1].x;
/*101*/	    r1.x = r1.x * 1.250000;
/*102*/	    r1.x = min(r1.x, 1.000000);
/*103*/	    r1.y = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*104*/	    r1.y = r1.y * 4.000000;
/*105*/	    r1.x = r1.x * 0.200000 + r1.y;
/*106*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*107*/	    r0.w = r0.w + -r1.x;
/*108*/	    r0.w = saturate(r0.w * 200.000000);
/*109*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*110*/	    r0.w = r0.w * r0.w;
/*111*/	    r0.w = r0.w * r1.x;
/*112*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*113*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*114*/	  }
/*115*/	}
/*116*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*117*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*118*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*119*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*120*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*121*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*122*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*123*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*124*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*125*/	color0.w = 1.000000;
/*126*/	return;
}
