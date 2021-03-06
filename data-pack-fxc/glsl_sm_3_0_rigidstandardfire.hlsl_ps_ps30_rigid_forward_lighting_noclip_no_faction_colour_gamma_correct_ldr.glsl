//
//
// Shader Model 4
// Fragment Shader
//
// id: 719 - fxc/glsl_SM_3_0_rigidstandardfire.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*20*/	r4.x = 0;
/*21*/	r4.y = cb1.data[26].x * 0.050000;
/*22*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*23*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*24*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*25*/	r1.w = saturate(r4.x * 5.000000);
/*26*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*27*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*28*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*29*/	r2.w = log2(r5.z);
/*30*/	r2.w = r2.w * 1.800000;
/*31*/	r2.w = exp2(r2.w);
/*32*/	r2.w = r2.w * 10.000000;
/*33*/	r2.w = min(r2.w, 1.000000);
/*34*/	r1.w = r1.w + r2.w;
/*35*/	r1.w = r1.w * 0.500000;
/*36*/	r2.w = -r5.w + 1.000000;
/*37*/	r2.w = log2(r2.w);
/*38*/	r2.w = r2.w * vsOut_T7.x;
/*39*/	r2.w = exp2(r2.w);
/*40*/	r2.w = min(r2.w, 1.000000);
/*41*/	r2.w = r2.w * vsOut_T7.x;
/*42*/	r3.z = r5.z * 0.250000;
/*43*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*44*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*45*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*46*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*47*/	r1.w = vsOut_T7.x + -0.025000;
/*48*/	r1.w = max(r1.w, 0.000000);
/*49*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*50*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*54*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*57*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*60*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*61*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*62*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*63*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*66*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*67*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*68*/	if(floatBitsToUint(r0.w) != 0u) {
/*69*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*70*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*71*/	  r0.w = r3.w * cb1.data[26].x;
/*72*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*73*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*74*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*75*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*76*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*77*/	}
/*78*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r0.w) != 0u) {
/*80*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*81*/	  if(floatBitsToUint(r0.w) != 0u) {
/*82*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*83*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*84*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*85*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*86*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*87*/	    r0.w = -r0.w + 1.000000;
/*88*/	    r0.w = max(r0.w, 0.000000);
/*89*/	    r8.z = sqrt(r0.w);
/*90*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*91*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*92*/	    r0.w = inversesqrt(r0.w);
/*93*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*94*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*95*/	    r10.y = -1.000000;
/*96*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*97*/	    r0.w = inversesqrt(r0.w);
/*98*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*99*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*100*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*101*/	    r1.w = r1.w * 1.250000;
/*102*/	    r1.w = min(r1.w, 1.000000);
/*103*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*104*/	    r2.w = r2.w * 4.000000;
/*105*/	    r1.w = r1.w * 0.200000 + r2.w;
/*106*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*107*/	    r0.w = r0.w + -r1.w;
/*108*/	    r0.w = saturate(r0.w * 200.000000);
/*109*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*110*/	    r0.w = r0.w * r0.w;
/*111*/	    r0.w = r0.w * r1.w;
/*112*/	    r3.x = r0.w * -r3.x + r3.x;
/*113*/	    r1.w = -r3.y + 0.200000;
/*114*/	    r3.y = r0.w * r1.w + r3.y;
/*115*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*116*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*117*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*118*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*119*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*120*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*121*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*122*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*123*/	    r1.w = -r1.w + 1.000000;
/*124*/	    r1.w = max(r1.w, 0.000000);
/*125*/	    r7.z = sqrt(r1.w);
/*126*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*127*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*128*/	    r1.w = sqrt(r1.w);
/*129*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*130*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*131*/	    r1.w = inversesqrt(r1.w);
/*132*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*133*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*134*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*135*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*136*/	    r1.w = -r0.y + 1.000000;
/*137*/	    r0.w = min(r0.w, r1.w);
/*138*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*139*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*140*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*141*/	    r0.w = inversesqrt(r0.w);
/*142*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*143*/	  }
/*144*/	}
/*145*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*146*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*147*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*148*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*149*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*150*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*151*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*152*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*153*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*154*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*155*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*156*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*157*/	r1.w = inversesqrt(r1.w);
/*158*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*159*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*160*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*161*/	r2.w = inversesqrt(r1.w);
/*162*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*163*/	r2.w = -r3.x + 1.000000;
/*164*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*165*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*166*/	r5.y = r5.y + r5.y;
/*167*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*168*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*169*/	r6.w = r2.w * 1.539380;
/*170*/	r6.w = cos((r6.w));
/*171*/	r6.w = inversesqrt(r6.w);
/*172*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*173*/	r7.x = saturate(r0.w * 60.000000);
/*174*/	r7.x = -r0.w + r7.x;
/*175*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*176*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*177*/	r8.x = inversesqrt(r8.x);
/*178*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*179*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*180*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*181*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*182*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*183*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*184*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*185*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*186*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*187*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*188*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*189*/	r6.y = -r0.w + 1.000000;
/*190*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*191*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*192*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*193*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*194*/	  r6.y = max(r6.y, 0.000000);
/*195*/	  r6.y = log2(r6.y);
/*196*/	  r6.y = r6.y * 10.000000;
/*197*/	  r6.y = exp2(r6.y);
/*198*/	  r6.y = r6.w * r6.y;
/*199*/	  r6.y = r6.y * r7.x + r0.w;
/*200*/	  r8.x = r2.w * 8.000000;
/*201*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*202*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*203*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*204*/	}
/*205*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*206*/	r0.y = max(r0.x, 0.000000);
/*207*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*208*/	if(floatBitsToUint(r0.x) != 0u) {
/*209*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*210*/	  r0.x = max(r0.x, -1.000000);
/*211*/	  r0.x = min(r0.x, 1.000000);
/*212*/	  r0.z = -abs(r0.x) + 1.000000;
/*213*/	  r0.z = sqrt(r0.z);
/*214*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*215*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*216*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*217*/	  r5.z = r0.z * r5.y;
/*218*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*219*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*220*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*221*/	  r0.x = r5.y * r0.z + r0.x;
/*222*/	  r0.z = r3.x * r3.x;
/*223*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*224*/	  r0.z = r0.z * r3.x + r6.x;
/*225*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*226*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*227*/	  r3.x = -r0.z * r0.z + 1.000000;
/*228*/	  r3.x = max(r3.x, 0.001000);
/*229*/	  r3.x = log2(r3.x);
/*230*/	  r5.x = r3.x * 4.950617;
/*231*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*232*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*233*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*234*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*235*/	  r0.z = floatBitsToInt(r0.z);
/*236*/	  r5.x = r3.x * r3.x + -r5.x;
/*237*/	  r5.x = sqrt(r5.x);
/*238*/	  r3.x = -r3.x + r5.x;
/*239*/	  r3.x = max(r3.x, 0.000000);
/*240*/	  r3.x = sqrt(r3.x);
/*241*/	  r0.z = r0.z * r3.x;
/*242*/	  r0.z = r0.z * 1.414214;
/*243*/	  r0.z = 0.008727 / r0.z;
/*244*/	  r0.z = max(r0.z, 0.000100);
/*245*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*246*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*247*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*248*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*249*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*250*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*251*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*252*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*253*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*254*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*255*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*256*/	  r0.x = floatBitsToInt(r0.x);
/*257*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*258*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*259*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*260*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*261*/	  r0.x = r0.x * r5.x + 1.000000;
/*262*/	  r0.x = r0.x * 0.500000;
/*263*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*264*/	  r0.z = r0.z * r5.y + 1.000000;
/*265*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*266*/	  r0.z = min(r0.y, 1.000000);
/*267*/	  r2.w = r2.w * 1.570796;
/*268*/	  r2.w = sin(r2.w);
/*269*/	  r0.z = r0.z + -1.000000;
/*270*/	  r0.z = r2.w * r0.z + 1.000000;
/*271*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*272*/	  r2.w = max(r2.w, 0.000000);
/*273*/	  r2.w = log2(r2.w);
/*274*/	  r2.w = r2.w * 10.000000;
/*275*/	  r2.w = exp2(r2.w);
/*276*/	  r2.w = r6.w * r2.w;
/*277*/	  r2.w = r2.w * r7.x + r0.w;
/*278*/	  r0.x = r0.z * abs(r0.x);
/*279*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*280*/	} else {
/*281*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*282*/	}
/*283*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*284*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*285*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*286*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*287*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*288*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*289*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*290*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*291*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*292*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*293*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*294*/	r2.w = 1.000000;
/*295*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*296*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*297*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*298*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*299*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*300*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*301*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*302*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*303*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*304*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*305*/	if(r0.w != 0) discard;
/*306*/	r0.w = sqrt(r1.w);
/*307*/	r1.x = saturate(cb3.data[0].w)/**/;
/*308*/	r1.x = -r1.x + 1.000000;
/*309*/	r1.x = r1.x * 8.000000 + -4.000000;
/*310*/	r1.y = saturate(cb3.data[1].x)/**/;
/*311*/	r1.y = -r1.y + 1.000000;
/*312*/	r1.y = r1.y * 1000.000000;
/*313*/	r0.w = r0.w / r1.y;
/*314*/	r0.w = r0.w + r1.x;
/*315*/	r0.w = r0.w * 1.442695;
/*316*/	r0.w = exp2(r0.w);
/*317*/	r0.w = cb3.data[1].y / r0.w;
/*318*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*319*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*320*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*321*/	r1.x = r1.x + -cb3.data[1].z;
/*322*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*323*/	r1.x = saturate(r1.y * r1.x);
/*324*/	r1.y = r1.x * -2.000000 + 3.000000;
/*325*/	r1.x = r1.x * r1.x;
/*326*/	r1.x = r1.x * r1.y;
/*327*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*328*/	r1.y = sqrt(r1.y);
/*329*/	r1.z = max(cb3.data[2].z, 0.001000);
/*330*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*331*/	r1.y = r1.z * r1.y;
/*332*/	r1.y = min(r1.y, 1.000000);
/*333*/	r1.z = r1.y * -2.000000 + 3.000000;
/*334*/	r1.y = r1.y * r1.y;
/*335*/	r1.y = r1.y * r1.z;
/*336*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*337*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*338*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*339*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*340*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*341*/	r4.w = max(r4.y, 0.000000);
/*342*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*343*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*344*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*345*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*346*/	r0.w = saturate(r0.w * r1.y);
/*347*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*348*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*349*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*350*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*351*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*352*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*353*/	return;
}
