//
//
// Shader Model 4
// Fragment Shader
//
// id: 962 - fxc/glsl_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_gbuffer_alpha_test_40.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
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
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb2.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*24*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*26*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*27*/	r2.w = saturate(vsOut_N0.w);
/*28*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r2.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*30*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*31*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*32*/	r4.xyw = (r2.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*33*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*34*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*35*/	r6.xyz = (r2.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
/*36*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*38*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*40*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*41*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*42*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*44*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*46*/	r2.w = -r2.w + 1.000000;
/*47*/	r2.w = max(r2.w, 0.000000);
/*48*/	r3.z = sqrt(r2.w);
/*49*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*51*/	r4.w = 1.000000;
/*52*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*53*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*54*/	r4.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*55*/	r4.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*56*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*57*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*58*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*59*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*60*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.w));
/*61*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r4.w));
/*62*/	r4.z = vsOut_T6.x;
/*63*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*64*/	r6.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*65*/	if(floatBitsToUint(r4.w) != 0u) {
/*66*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*67*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*68*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*69*/	  r4.w = -r4.w + 1.000000;
/*70*/	  r4.w = max(r4.w, 0.000000);
/*71*/	  r4.z = sqrt(r4.w);
/*72*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*73*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*74*/	  r4.w = r1.x * r7.w;
/*75*/	  r1.x = r4.w * -0.500000 + r1.x;
/*76*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*77*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*78*/	  r4.w = -r5.w * r6.w + 1.000000;
/*79*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*80*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*81*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*82*/	}
/*83*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*84*/	r4.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*85*/	r5.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*86*/	r5.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*87*/	r5.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*88*/	r4.z = r4.w * r5.w;
/*89*/	r6.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*90*/	r0.xyz = (r4.zzzz * r6.xyzx + r0.xyzx).xyz;
/*91*/	r3.xy = (r5.xyxx * r4.wwww + r3.xyxx).xy;
/*92*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*93*/	r4.w = inversesqrt(r4.w);
/*94*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*95*/	r4.xy = (r4.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*96*/	r5.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*97*/	r4.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*98*/	r4.x = saturate(-r4.x + r5.w);
/*99*/	r4.x = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r4.x) != 0u) {
/*101*/	  r4.x = -r5.w + 1.000000;
/*102*/	  r4.x = saturate(vsOut_T7.w * 0.900000 + -r4.x);
/*103*/	  r4.x = -r4.x + 1.000000;
/*104*/	  r4.x = -r4.x * r4.x + 1.000000;
/*105*/	  r4.x = r4.x * -0.600000 + 1.000000;
/*106*/	  r4.xyw = (r4.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*107*/	  r5.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*108*/	  r5.x = uintBitsToFloat((r5.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*109*/	  r5.x = uintBitsToFloat(floatBitsToUint(r5.x) & uint(0x3f800000u));
/*110*/	  r5.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r4.xxww).yzw;
/*111*/	  r0.xyz = (r5.xxxx * r5.yzwy + r4.xywx).xyz;
/*112*/	  r4.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*113*/	  r1.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*114*/	} else {
/*115*/	  r5.xyz = (r2.xyzx * r4.zzzz).xyz;
/*116*/	  r4.xyw = (r5.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r2.xyxz).xyw;
/*117*/	}
/*118*/	r2.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*119*/	r2.x = inversesqrt(r2.x);
/*120*/	r2.xyz = (r2.xxxx * vsOut_T3.xyzx).xyz;
/*121*/	r4.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*122*/	r4.z = inversesqrt(r4.z);
/*123*/	r5.xyz = (r4.zzzz * vsOut_T4.xyzx).xyz;
/*124*/	r4.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*125*/	r4.z = inversesqrt(r4.z);
/*126*/	r6.xyz = (r4.zzzz * vsOut_T2.xyzx).xyz;
/*127*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*128*/	r7.xyz = (r3.xxxx * r2.xyzx + r7.xyzx).xyz;
/*129*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*130*/	r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*131*/	r4.z = inversesqrt(r4.z);
/*132*/	r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*133*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*134*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*135*/	if(floatBitsToUint(r0.w) != 0u) {
/*136*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*137*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*138*/	  r0.w = r7.y * cb0.data[26].x;
/*139*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*140*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*141*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*142*/	  r4.xyw = (r7.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r4.xyxw).xyw;
/*143*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*144*/	}
/*145*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*146*/	if(floatBitsToUint(r0.w) != 0u) {
/*147*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*148*/	  if(floatBitsToUint(r0.w) != 0u) {
/*149*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*150*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*151*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*152*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*153*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*154*/	    r0.w = -r0.w + 1.000000;
/*155*/	    r0.w = max(r0.w, 0.000000);
/*156*/	    r8.z = sqrt(r0.w);
/*157*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*158*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*159*/	    r0.w = inversesqrt(r0.w);
/*160*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*161*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*162*/	    r10.y = -1.000000;
/*163*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*164*/	    r0.w = inversesqrt(r0.w);
/*165*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*166*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*167*/	    r4.z = cb1.data[1].x * cb1.data[1].x;
/*168*/	    r4.z = r4.z * 1.250000;
/*169*/	    r4.z = min(r4.z, 1.000000);
/*170*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*171*/	    r5.w = r5.w * 4.000000;
/*172*/	    r4.z = r4.z * 0.200000 + r5.w;
/*173*/	    r4.z = r4.z * -0.700000 + 1.000000;
/*174*/	    r0.w = r0.w + -r4.z;
/*175*/	    r0.w = saturate(r0.w * 200.000000);
/*176*/	    r4.z = r0.w * -2.000000 + 3.000000;
/*177*/	    r0.w = r0.w * r0.w;
/*178*/	    r0.w = r0.w * r4.z;
/*179*/	    r1.w = r0.w * -r1.w + r1.w;
/*180*/	    r4.z = -r1.x + 0.200000;
/*181*/	    r1.x = r0.w * r4.z + r1.x;
/*182*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*183*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*184*/	    r9.xyz = (-r4.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*185*/	    r4.xyw = (r0.wwww * r9.xyxz + r4.xyxw).xyw;
/*186*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*187*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*188*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*189*/	    r4.z = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*190*/	    r4.z = -r4.z + 1.000000;
/*191*/	    r4.z = max(r4.z, 0.000000);
/*192*/	    r7.z = sqrt(r4.z);
/*193*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*194*/	    r4.z = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*195*/	    r4.z = sqrt(r4.z);
/*196*/	    r7.xyz = (r8.xyzx * r4.zzzz + r7.xyzx).xyz;
/*197*/	    r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*198*/	    r4.z = inversesqrt(r4.z);
/*199*/	    r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*200*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*201*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*202*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*203*/	    r4.z = -r3.y + 1.000000;
/*204*/	    r0.w = min(r0.w, r4.z);
/*205*/	    r2.xyz = (-r3.xyzx + r2.xyzx).xyz;
/*206*/	    r2.xyz = (r0.wwww * r2.xyzx + r3.xyzx).xyz;
/*207*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*208*/	    r0.w = inversesqrt(r0.w);
/*209*/	    r3.xyz = (r0.wwww * r2.xyzx).xyz;
/*210*/	  }
/*211*/	}
/*212*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*213*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*214*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*215*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r0.xyzx).xyz;
/*216*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*217*/	r2.xyz = (-r0.xyzx + r2.xxxx).xyz;
/*218*/	r0.xyz = (vsOut_T7.zzzz * r2.xyzx + r0.xyzx).xyz;
/*219*/	r2.x = dot(vec3(r4.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*220*/	r2.xyz = (-r4.xywx + r2.xxxx).xyz;
/*221*/	r4.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xywx).xyz;
/*222*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*223*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*224*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*225*/	r2.x = inversesqrt(r2.x);
/*226*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*227*/	color3.x = r2.w / r3.w;
/*228*/	r2.w = max(abs(r2.z), abs(r2.y));
/*229*/	r2.w = max(r2.w, abs(r2.x));
/*230*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*231*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*232*/	color0.xyzw = saturate(r1.xyzw);
/*233*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*234*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*235*/	color2.xyzw = saturate(r4.xyzw);
/*236*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*237*/	color4 = vsOut_P1;
/*238*/	return;
}
