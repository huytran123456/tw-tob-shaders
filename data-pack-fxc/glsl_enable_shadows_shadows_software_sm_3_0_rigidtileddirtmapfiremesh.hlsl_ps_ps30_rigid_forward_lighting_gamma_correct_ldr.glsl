//
//
// Shader Model 4
// Fragment Shader
//
// id: 4887 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidtileddirtmapfiremesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*42*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*43*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*44*/	r1.w = r4.w + -1.000000;
/*45*/	r1.w = r5.x * r1.w + 1.000000;
/*46*/	r1.w = saturate(r1.w * r5.x);
/*47*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*48*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*49*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*50*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*51*/	r6.x = 0;
/*52*/	r6.y = cb1.data[26].x * 0.050000;
/*53*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*54*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*55*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*56*/	r1.w = saturate(r6.x * 5.000000);
/*57*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*58*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*60*/	r2.w = log2(r7.z);
/*61*/	r2.w = r2.w * 1.800000;
/*62*/	r2.w = exp2(r2.w);
/*63*/	r2.w = r2.w * 10.000000;
/*64*/	r2.w = min(r2.w, 1.000000);
/*65*/	r1.w = r1.w + r2.w;
/*66*/	r1.w = r1.w * 0.500000;
/*67*/	r2.w = -r7.w + 1.000000;
/*68*/	r2.w = log2(r2.w);
/*69*/	r2.w = r2.w * vsOut_T7.x;
/*70*/	r2.w = exp2(r2.w);
/*71*/	r2.w = min(r2.w, 1.000000);
/*72*/	r2.w = r2.w * vsOut_T7.x;
/*73*/	r3.z = r7.z * 0.250000;
/*74*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*75*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*76*/	r0.xyw = (-r0.xyxw * r4.xyxz + r6.xyxz).xyw;
/*77*/	r0.xyw = (r2.wwww * r0.xyxw + r5.xyxz).xyw;
/*78*/	r1.w = vsOut_T7.x + -0.025000;
/*79*/	r1.w = max(r1.w, 0.000000);
/*80*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*81*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*82*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*88*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*89*/	r1.w = inversesqrt(r1.w);
/*90*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*91*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*92*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*93*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*94*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*95*/	r1.w = inversesqrt(r1.w);
/*96*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*97*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*98*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*99*/	if(floatBitsToUint(r0.z) != 0u) {
/*100*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*101*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*102*/	  r0.z = r3.w * cb1.data[26].x;
/*103*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*104*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*105*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*106*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*107*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*108*/	}
/*109*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*110*/	if(floatBitsToUint(r0.z) != 0u) {
/*111*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*112*/	  if(floatBitsToUint(r0.z) != 0u) {
/*113*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*114*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*115*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*116*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*117*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*118*/	    r0.z = -r0.z + 1.000000;
/*119*/	    r0.z = max(r0.z, 0.000000);
/*120*/	    r8.z = sqrt(r0.z);
/*121*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*122*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*123*/	    r0.z = inversesqrt(r0.z);
/*124*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*125*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*126*/	    r10.y = -1.000000;
/*127*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*128*/	    r0.z = inversesqrt(r0.z);
/*129*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*130*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*131*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*132*/	    r1.w = r1.w * 1.250000;
/*133*/	    r1.w = min(r1.w, 1.000000);
/*134*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*135*/	    r2.w = r2.w * 4.000000;
/*136*/	    r1.w = r1.w * 0.200000 + r2.w;
/*137*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*138*/	    r0.z = r0.z + -r1.w;
/*139*/	    r0.z = saturate(r0.z * 200.000000);
/*140*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*141*/	    r0.z = r0.z * r0.z;
/*142*/	    r0.z = r0.z * r1.w;
/*143*/	    r3.x = r0.z * -r3.x + r3.x;
/*144*/	    r1.w = -r3.y + 0.200000;
/*145*/	    r3.y = r0.z * r1.w + r3.y;
/*146*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*147*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*148*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*149*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*150*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*151*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*152*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*153*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*154*/	    r1.w = -r1.w + 1.000000;
/*155*/	    r1.w = max(r1.w, 0.000000);
/*156*/	    r7.z = sqrt(r1.w);
/*157*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*158*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*159*/	    r1.w = sqrt(r1.w);
/*160*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*161*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*162*/	    r1.w = inversesqrt(r1.w);
/*163*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*164*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*165*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*166*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*167*/	    r1.w = -r1.y + 1.000000;
/*168*/	    r0.z = min(r0.z, r1.w);
/*169*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*170*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*171*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*172*/	    r0.z = inversesqrt(r0.z);
/*173*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*174*/	  }
/*175*/	}
/*176*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*177*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*178*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*179*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*180*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*182*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*183*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*185*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*186*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*187*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*188*/	r1.w = inversesqrt(r1.w);
/*189*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*190*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*191*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*192*/	r2.w = inversesqrt(r1.w);
/*193*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*194*/	r2.w = -r3.x + 1.000000;
/*195*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*197*/	r5.y = r5.y + r5.y;
/*198*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*199*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*200*/	r6.w = r2.w * 1.539380;
/*201*/	r6.w = cos((r6.w));
/*202*/	r6.w = inversesqrt(r6.w);
/*203*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*204*/	r7.x = saturate(r0.z * 60.000000);
/*205*/	r7.x = -r0.z + r7.x;
/*206*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*207*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*208*/	r8.x = inversesqrt(r8.x);
/*209*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*210*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*211*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*212*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*213*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*214*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*215*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*216*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*217*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*218*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*219*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*220*/	r6.y = -r0.z + 1.000000;
/*221*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*222*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*223*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*224*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*225*/	  r6.y = max(r6.y, 0.000000);
/*226*/	  r6.y = log2(r6.y);
/*227*/	  r6.y = r6.y * 10.000000;
/*228*/	  r6.y = exp2(r6.y);
/*229*/	  r6.y = r6.w * r6.y;
/*230*/	  r6.y = r6.y * r7.x + r0.z;
/*231*/	  r8.x = r2.w * 8.000000;
/*232*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*233*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*234*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*235*/	}
/*236*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*237*/	r1.y = max(r1.x, 0.000000);
/*238*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*239*/	if(floatBitsToUint(r1.x) != 0u) {
/*240*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*241*/	  r1.x = max(r1.x, -1.000000);
/*242*/	  r1.x = min(r1.x, 1.000000);
/*243*/	  r1.z = -abs(r1.x) + 1.000000;
/*244*/	  r1.z = sqrt(r1.z);
/*245*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*246*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*247*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*248*/	  r5.z = r1.z * r5.y;
/*249*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*250*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*251*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*252*/	  r1.x = r5.y * r1.z + r1.x;
/*253*/	  r1.z = r3.x * r3.x;
/*254*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*255*/	  r1.z = r1.z * r3.x + r6.x;
/*256*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*257*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*258*/	  r3.x = -r1.z * r1.z + 1.000000;
/*259*/	  r3.x = max(r3.x, 0.001000);
/*260*/	  r3.x = log2(r3.x);
/*261*/	  r5.x = r3.x * 4.950617;
/*262*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*263*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*264*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*265*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*266*/	  r1.z = floatBitsToInt(r1.z);
/*267*/	  r5.x = r3.x * r3.x + -r5.x;
/*268*/	  r5.x = sqrt(r5.x);
/*269*/	  r3.x = -r3.x + r5.x;
/*270*/	  r3.x = max(r3.x, 0.000000);
/*271*/	  r3.x = sqrt(r3.x);
/*272*/	  r1.z = r1.z * r3.x;
/*273*/	  r1.z = r1.z * 1.414214;
/*274*/	  r1.z = 0.008727 / r1.z;
/*275*/	  r1.z = max(r1.z, 0.000100);
/*276*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*277*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*278*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*279*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*280*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*281*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*282*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*283*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*284*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*285*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*286*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*287*/	  r1.x = floatBitsToInt(r1.x);
/*288*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*289*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*290*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*291*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*292*/	  r1.x = r1.x * r5.x + 1.000000;
/*293*/	  r1.x = r1.x * 0.500000;
/*294*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*295*/	  r1.z = r1.z * r5.y + 1.000000;
/*296*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*297*/	  r1.z = min(r1.y, 1.000000);
/*298*/	  r2.w = r2.w * 1.570796;
/*299*/	  r2.w = sin(r2.w);
/*300*/	  r1.z = r1.z + -1.000000;
/*301*/	  r1.z = r2.w * r1.z + 1.000000;
/*302*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*303*/	  r2.w = max(r2.w, 0.000000);
/*304*/	  r2.w = log2(r2.w);
/*305*/	  r2.w = r2.w * 10.000000;
/*306*/	  r2.w = exp2(r2.w);
/*307*/	  r2.w = r6.w * r2.w;
/*308*/	  r2.w = r2.w * r7.x + r0.z;
/*309*/	  r1.x = r1.z * abs(r1.x);
/*310*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*311*/	} else {
/*312*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*313*/	}
/*314*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*315*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*316*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*317*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*318*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*319*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*320*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*321*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*322*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*323*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*324*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*325*/	r2.w = 1.000000;
/*326*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*327*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*328*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*329*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*330*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*331*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*333*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*334*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*335*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*336*/	if(r0.w != 0) discard;
/*337*/	r0.w = sqrt(r1.w);
/*338*/	r1.x = saturate(cb3.data[0].w)/**/;
/*339*/	r1.x = -r1.x + 1.000000;
/*340*/	r1.x = r1.x * 8.000000 + -4.000000;
/*341*/	r1.y = saturate(cb3.data[1].x)/**/;
/*342*/	r1.y = -r1.y + 1.000000;
/*343*/	r1.y = r1.y * 1000.000000;
/*344*/	r0.w = r0.w / r1.y;
/*345*/	r0.w = r0.w + r1.x;
/*346*/	r0.w = r0.w * 1.442695;
/*347*/	r0.w = exp2(r0.w);
/*348*/	r0.w = cb3.data[1].y / r0.w;
/*349*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*350*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*351*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*352*/	r1.x = r1.x + -cb3.data[1].z;
/*353*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*354*/	r1.x = saturate(r1.y * r1.x);
/*355*/	r1.y = r1.x * -2.000000 + 3.000000;
/*356*/	r1.x = r1.x * r1.x;
/*357*/	r1.x = r1.x * r1.y;
/*358*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*359*/	r1.y = sqrt(r1.y);
/*360*/	r1.z = max(cb3.data[2].z, 0.001000);
/*361*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*362*/	r1.y = r1.z * r1.y;
/*363*/	r1.y = min(r1.y, 1.000000);
/*364*/	r1.z = r1.y * -2.000000 + 3.000000;
/*365*/	r1.y = r1.y * r1.y;
/*366*/	r1.y = r1.y * r1.z;
/*367*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*368*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*369*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*370*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*371*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*372*/	r4.w = max(r4.y, 0.000000);
/*373*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*374*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*375*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*376*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*377*/	r0.w = saturate(r0.w * r1.y);
/*378*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*379*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*380*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*381*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*382*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*383*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*384*/	return;
}
