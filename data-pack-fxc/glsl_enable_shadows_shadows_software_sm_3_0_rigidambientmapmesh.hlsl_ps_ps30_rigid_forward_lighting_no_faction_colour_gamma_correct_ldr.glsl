//
//
// Shader Model 4
// Fragment Shader
//
// id: 4489 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_ambient_map;
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
  vec4 r11;
  vec4 r12;
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*25*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*26*/	r1.w = inversesqrt(r1.w);
/*27*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*28*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*29*/	r1.w = inversesqrt(r1.w);
/*30*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*31*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*34*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*35*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*36*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*37*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*40*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*44*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*45*/	  r0.w = r3.w * cb1.data[26].x;
/*46*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*47*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*48*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*49*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*50*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*51*/	}
/*52*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*55*/	  if(floatBitsToUint(r0.w) != 0u) {
/*56*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*57*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*58*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*61*/	    r0.w = -r0.w + 1.000000;
/*62*/	    r0.w = max(r0.w, 0.000000);
/*63*/	    r10.z = sqrt(r0.w);
/*64*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*65*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*66*/	    r0.w = inversesqrt(r0.w);
/*67*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*68*/	    r12.xz = (cb4.data[0].xxyx).xz/**/;
/*69*/	    r12.y = -1.000000;
/*70*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*71*/	    r0.w = inversesqrt(r0.w);
/*72*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*73*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*74*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*75*/	    r1.w = r1.w * 1.250000;
/*76*/	    r1.w = min(r1.w, 1.000000);
/*77*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*78*/	    r2.w = r2.w * 4.000000;
/*79*/	    r1.w = r1.w * 0.200000 + r2.w;
/*80*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*81*/	    r0.w = r0.w + -r1.w;
/*82*/	    r0.w = saturate(r0.w * 200.000000);
/*83*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*84*/	    r0.w = r0.w * r0.w;
/*85*/	    r0.w = r0.w * r1.w;
/*86*/	    r3.x = r0.w * -r3.x + r3.x;
/*87*/	    r1.w = -r3.y + 0.200000;
/*88*/	    r3.y = r0.w * r1.w + r3.y;
/*89*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*90*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*91*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*92*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*93*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*94*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*95*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*96*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*97*/	    r1.w = -r1.w + 1.000000;
/*98*/	    r1.w = max(r1.w, 0.000000);
/*99*/	    r1.z = sqrt(r1.w);
/*100*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*101*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*102*/	    r1.w = sqrt(r1.w);
/*103*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*104*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*105*/	    r1.w = inversesqrt(r1.w);
/*106*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*107*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*108*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*109*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*110*/	    r1.w = -r0.y + 1.000000;
/*111*/	    r0.w = min(r0.w, r1.w);
/*112*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*113*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*114*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*115*/	    r0.w = inversesqrt(r0.w);
/*116*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*117*/	  }
/*118*/	}
/*119*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*120*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*121*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*122*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
/*123*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*124*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*125*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*126*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*128*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*129*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*130*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*131*/	r1.w = inversesqrt(r1.w);
/*132*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*133*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*134*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*135*/	r2.w = inversesqrt(r1.w);
/*136*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*137*/	r2.w = -r3.x + 1.000000;
/*138*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*139*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*140*/	r5.y = r5.y + r5.y;
/*141*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*142*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*143*/	r6.w = r2.w * 1.539380;
/*144*/	r6.w = cos((r6.w));
/*145*/	r6.w = inversesqrt(r6.w);
/*146*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*147*/	r7.x = saturate(r0.w * 60.000000);
/*148*/	r7.x = -r0.w + r7.x;
/*149*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*150*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*151*/	r8.x = inversesqrt(r8.x);
/*152*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*153*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*154*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*155*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*156*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*157*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*158*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*159*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*160*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*161*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*162*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*163*/	r6.y = -r0.w + 1.000000;
/*164*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*165*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*166*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*167*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*168*/	  r6.y = max(r6.y, 0.000000);
/*169*/	  r6.y = log2(r6.y);
/*170*/	  r6.y = r6.y * 10.000000;
/*171*/	  r6.y = exp2(r6.y);
/*172*/	  r6.y = r6.w * r6.y;
/*173*/	  r6.y = r6.y * r7.x + r0.w;
/*174*/	  r8.x = r2.w * 8.000000;
/*175*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*176*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*177*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*178*/	}
/*179*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*180*/	r0.y = max(r0.x, 0.000000);
/*181*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*182*/	if(floatBitsToUint(r0.x) != 0u) {
/*183*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*184*/	  r0.x = max(r0.x, -1.000000);
/*185*/	  r0.x = min(r0.x, 1.000000);
/*186*/	  r0.z = -abs(r0.x) + 1.000000;
/*187*/	  r0.z = sqrt(r0.z);
/*188*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*189*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*190*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*191*/	  r5.z = r0.z * r5.y;
/*192*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*193*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*194*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*195*/	  r0.x = r5.y * r0.z + r0.x;
/*196*/	  r0.z = r3.x * r3.x;
/*197*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*198*/	  r0.z = r0.z * r3.x + r6.x;
/*199*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*200*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*201*/	  r3.x = -r0.z * r0.z + 1.000000;
/*202*/	  r3.x = max(r3.x, 0.001000);
/*203*/	  r3.x = log2(r3.x);
/*204*/	  r5.x = r3.x * 4.950617;
/*205*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*206*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*207*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*208*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*209*/	  r0.z = floatBitsToInt(r0.z);
/*210*/	  r5.x = r3.x * r3.x + -r5.x;
/*211*/	  r5.x = sqrt(r5.x);
/*212*/	  r3.x = -r3.x + r5.x;
/*213*/	  r3.x = max(r3.x, 0.000000);
/*214*/	  r3.x = sqrt(r3.x);
/*215*/	  r0.z = r0.z * r3.x;
/*216*/	  r0.z = r0.z * 1.414214;
/*217*/	  r0.z = 0.008727 / r0.z;
/*218*/	  r0.z = max(r0.z, 0.000100);
/*219*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*220*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*221*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*222*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*223*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*224*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*225*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*226*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*227*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*228*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*229*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*230*/	  r0.x = floatBitsToInt(r0.x);
/*231*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*232*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*233*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*234*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*235*/	  r0.x = r0.x * r5.x + 1.000000;
/*236*/	  r0.x = r0.x * 0.500000;
/*237*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*238*/	  r0.z = r0.z * r5.y + 1.000000;
/*239*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*240*/	  r0.z = min(r0.y, 1.000000);
/*241*/	  r2.w = r2.w * 1.570796;
/*242*/	  r2.w = sin(r2.w);
/*243*/	  r0.z = r0.z + -1.000000;
/*244*/	  r0.z = r2.w * r0.z + 1.000000;
/*245*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*246*/	  r2.w = max(r2.w, 0.000000);
/*247*/	  r2.w = log2(r2.w);
/*248*/	  r2.w = r2.w * 10.000000;
/*249*/	  r2.w = exp2(r2.w);
/*250*/	  r2.w = r6.w * r2.w;
/*251*/	  r2.w = r2.w * r7.x + r0.w;
/*252*/	  r0.x = r0.z * abs(r0.x);
/*253*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*254*/	} else {
/*255*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*256*/	}
/*257*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*258*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*259*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*260*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*261*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*262*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*263*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*264*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*265*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*266*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*267*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*268*/	r2.w = 1.000000;
/*269*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*270*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*271*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*272*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*273*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*274*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*275*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*276*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*277*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*278*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*279*/	if(r0.w != 0) discard;
/*280*/	r0.w = sqrt(r1.w);
/*281*/	r1.x = saturate(cb3.data[0].w)/**/;
/*282*/	r1.x = -r1.x + 1.000000;
/*283*/	r1.x = r1.x * 8.000000 + -4.000000;
/*284*/	r1.y = saturate(cb3.data[1].x)/**/;
/*285*/	r1.y = -r1.y + 1.000000;
/*286*/	r1.y = r1.y * 1000.000000;
/*287*/	r0.w = r0.w / r1.y;
/*288*/	r0.w = r0.w + r1.x;
/*289*/	r0.w = r0.w * 1.442695;
/*290*/	r0.w = exp2(r0.w);
/*291*/	r0.w = cb3.data[1].y / r0.w;
/*292*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*293*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*294*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*295*/	r1.x = r1.x + -cb3.data[1].z;
/*296*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*297*/	r1.x = saturate(r1.y * r1.x);
/*298*/	r1.y = r1.x * -2.000000 + 3.000000;
/*299*/	r1.x = r1.x * r1.x;
/*300*/	r1.x = r1.x * r1.y;
/*301*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*302*/	r1.y = sqrt(r1.y);
/*303*/	r1.z = max(cb3.data[2].z, 0.001000);
/*304*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*305*/	r1.y = r1.z * r1.y;
/*306*/	r1.y = min(r1.y, 1.000000);
/*307*/	r1.z = r1.y * -2.000000 + 3.000000;
/*308*/	r1.y = r1.y * r1.y;
/*309*/	r1.y = r1.y * r1.z;
/*310*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*311*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*312*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*313*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*314*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*315*/	r4.w = max(r4.y, 0.000000);
/*316*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*317*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*318*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*319*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*320*/	r0.w = saturate(r0.w * r1.y);
/*321*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*322*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*323*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*324*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*325*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*326*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*327*/	return;
}
