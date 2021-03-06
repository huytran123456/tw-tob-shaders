//
//
// Shader Model 4
// Fragment Shader
//
// id: 5021 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*41*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*42*/	r4.w = 1.000000;
/*43*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*44*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*45*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*46*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*47*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*48*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*49*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*50*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*51*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*52*/	r5.z = vsOut_T6.x;
/*53*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*54*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*55*/	if(floatBitsToUint(r2.w) != 0u) {
/*56*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*57*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*59*/	  r2.w = -r2.w + 1.000000;
/*60*/	  r2.w = max(r2.w, 0.000000);
/*61*/	  r5.z = sqrt(r2.w);
/*62*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*63*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*64*/	  r2.w = r3.y * r8.w;
/*65*/	  r3.y = r2.w * -0.500000 + r3.y;
/*66*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*67*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*68*/	  r2.w = -r6.w * r7.w + 1.000000;
/*69*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*70*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*71*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*72*/	}
/*73*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*74*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*75*/	r5.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*76*/	r6.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*77*/	r5.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*78*/	r2.w = r5.w * r6.w;
/*79*/	r6.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*80*/	r0.xyw = (r2.wwww * r6.xyxz + r0.xyxw).xyw;
/*81*/	r1.xy = (r5.xyxx * r5.wwww + r1.xyxx).xy;
/*82*/	r5.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*83*/	r5.x = inversesqrt(r5.x);
/*84*/	r1.xyz = (r1.xyzx * r5.xxxx).xyz;
/*85*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*86*/	r5.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*87*/	r3.z = -vsOut_T7.w * 0.900000 + 1.000000;
/*88*/	r3.z = saturate(-r3.z + r5.w);
/*89*/	r3.z = uintBitsToFloat((0.000000 < r3.z) ? 0xffffffffu : 0x00000000u);
/*90*/	if(floatBitsToUint(r3.z) != 0u) {
/*91*/	  r3.z = -r5.w + 1.000000;
/*92*/	  r3.z = saturate(vsOut_T7.w * 0.900000 + -r3.z);
/*93*/	  r3.z = -r3.z + 1.000000;
/*94*/	  r3.z = -r3.z * r3.z + 1.000000;
/*95*/	  r3.z = r3.z * -0.600000 + 1.000000;
/*96*/	  r5.xyz = (r3.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*97*/	  r3.z = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*98*/	  r3.z = uintBitsToFloat((r3.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*99*/	  r3.z = uintBitsToFloat(floatBitsToUint(r3.z) & uint(0x3f800000u));
/*100*/	  r6.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r5.xzzx).xyz;
/*101*/	  r0.xyw = (r3.zzzz * r6.xyxz + r5.xyxz).xyw;
/*102*/	  r5.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*103*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*104*/	} else {
/*105*/	  r6.xyz = (r2.wwww * r2.xyzx).xyz;
/*106*/	  r5.xyz = (r6.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*107*/	}
/*108*/	r2.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*109*/	r2.x = inversesqrt(r2.x);
/*110*/	r2.xyz = (r2.xxxx * vsOut_T3.xyzx).xyz;
/*111*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*112*/	r2.w = inversesqrt(r2.w);
/*113*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*114*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*115*/	r2.w = inversesqrt(r2.w);
/*116*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*117*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*118*/	r8.xyz = (r1.xxxx * r2.xyzx + r8.xyzx).xyz;
/*119*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*120*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*123*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*124*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*125*/	if(floatBitsToUint(r0.z) != 0u) {
/*126*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*127*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*128*/	  r0.z = r3.w * cb0.data[26].x;
/*129*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*130*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*131*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*132*/	  r5.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r5.xyzx).xyz;
/*133*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*134*/	}
/*135*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*136*/	if(floatBitsToUint(r0.z) != 0u) {
/*137*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*138*/	  if(floatBitsToUint(r0.z) != 0u) {
/*139*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*140*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*141*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*142*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*144*/	    r0.z = -r0.z + 1.000000;
/*145*/	    r0.z = max(r0.z, 0.000000);
/*146*/	    r9.z = sqrt(r0.z);
/*147*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*148*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*149*/	    r0.z = inversesqrt(r0.z);
/*150*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*151*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*152*/	    r11.y = -1.000000;
/*153*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*154*/	    r0.z = inversesqrt(r0.z);
/*155*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*156*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*157*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*158*/	    r2.w = r2.w * 1.250000;
/*159*/	    r2.w = min(r2.w, 1.000000);
/*160*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*161*/	    r3.z = r3.z * 4.000000;
/*162*/	    r2.w = r2.w * 0.200000 + r3.z;
/*163*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*164*/	    r0.z = r0.z + -r2.w;
/*165*/	    r0.z = saturate(r0.z * 200.000000);
/*166*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*167*/	    r0.z = r0.z * r0.z;
/*168*/	    r0.z = r0.z * r2.w;
/*169*/	    r3.x = r0.z * -r3.x + r3.x;
/*170*/	    r2.w = -r3.y + 0.200000;
/*171*/	    r3.y = r0.z * r2.w + r3.y;
/*172*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*173*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*174*/	    r10.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*175*/	    r5.xyz = (r0.zzzz * r10.xyzx + r5.xyzx).xyz;
/*176*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*177*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*178*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*179*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*180*/	    r2.w = -r2.w + 1.000000;
/*181*/	    r2.w = max(r2.w, 0.000000);
/*182*/	    r8.z = sqrt(r2.w);
/*183*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*184*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*185*/	    r2.w = sqrt(r2.w);
/*186*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*187*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*188*/	    r2.w = inversesqrt(r2.w);
/*189*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*190*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*191*/	    r2.xyz = (r8.xxxx * r2.xyzx + r6.xyzx).xyz;
/*192*/	    r2.xyz = (r8.zzzz * r7.xyzx + r2.xyzx).xyz;
/*193*/	    r2.w = -r1.y + 1.000000;
/*194*/	    r0.z = min(r0.z, r2.w);
/*195*/	    r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*196*/	    r2.xyz = (r0.zzzz * r2.xyzx + r1.xyzx).xyz;
/*197*/	    r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*198*/	    r0.z = inversesqrt(r0.z);
/*199*/	    r1.xyz = (r0.zzzz * r2.xyzx).xyz;
/*200*/	  }
/*201*/	}
/*202*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*203*/	r2.xyz = (r0.xywx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*204*/	r2.xyz = (-r0.xywx + r2.xyzx).xyz;
/*205*/	r0.xyw = saturate(vsOut_T7.yyyy * r2.xyxz + r0.xyxw).xyw;
/*206*/	r2.x = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*207*/	r2.xyz = (-r0.xywx + r2.xxxx).xyz;
/*208*/	r0.xyw = (vsOut_T7.zzzz * r2.xyxz + r0.xyxw).xyw;
/*209*/	r2.x = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*210*/	r2.xyz = (-r5.xyzx + r2.xxxx).xyz;
/*211*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r5.xyzx).xyz;
/*212*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*213*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*214*/	r2.w = inversesqrt(r2.w);
/*215*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*216*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*217*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*218*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*219*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*220*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*221*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*222*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*223*/	r3.y = intBitsToFloat(int(r2.w));
/*224*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*225*/	if(floatBitsToUint(r3.z) != 0u) {
/*226*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*227*/	  r5.w = vsOut_T0.w;
/*228*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*229*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*230*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*231*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*232*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*233*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*234*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*235*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*236*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*237*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*238*/	  if(floatBitsToUint(r3.w) == 0u) {
/*239*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*240*/	    r7.xy = floor((r6.xyxx).xy);
/*241*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*242*/	    r3.z = -0.000400 / r3.z;
/*243*/	    r3.z = r3.z + r6.z;
/*244*/	    r8.z = -r8.y + 1.000000;
/*245*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*246*/	    r8.w = -r8.y;
/*247*/	    r10.x = cb1.data[0].z/**/;
/*248*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*249*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*250*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*251*/	    r10.w = -cb1.data[0].w/**/;
/*252*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*253*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*254*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*255*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*256*/	    r8.x = r9.x;
/*257*/	    r8.y = r11.x;
/*258*/	    r8.z = r10.x;
/*259*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*260*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*261*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*262*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*263*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*264*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*265*/	    r3.z = -r6.x + r6.y;
/*266*/	    r3.z = r3.w * r3.z + r6.x;
/*267*/	  } else {
/*268*/	    r3.z = 1.000000;
/*269*/	  }
/*270*/	} else {
/*271*/	  r3.z = 1.000000;
/*272*/	}
/*273*/	r3.w = cb1.data[34].w + -1.000000;
/*274*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*275*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*276*/	if(floatBitsToUint(r2.w) == 0u) {
/*277*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*278*/	  r2.w = floatBitsToInt(r2.w);
/*279*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*280*/	  if(floatBitsToUint(r2.w) != 0u) {
/*281*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*282*/	    r5.w = vsOut_T0.w;
/*283*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*284*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*285*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*286*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*287*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*288*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*289*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*290*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*291*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*292*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*293*/	    if(floatBitsToUint(r5.w) == 0u) {
/*294*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*295*/	      r6.xy = floor((r5.xyxx).xy);
/*296*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*297*/	      r2.w = -0.000400 / r2.w;
/*298*/	      r2.w = r2.w + r5.z;
/*299*/	      r7.z = -r7.y + 1.000000;
/*300*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*301*/	      r7.w = -r7.y;
/*302*/	      r9.x = cb1.data[0].z/**/;
/*303*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*304*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*305*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*306*/	      r9.w = -cb1.data[0].w/**/;
/*307*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*308*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*309*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*310*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*311*/	      r7.x = r8.x;
/*312*/	      r7.y = r10.x;
/*313*/	      r7.z = r9.x;
/*314*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*315*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*316*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*317*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*318*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*319*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*320*/	      r2.w = -r5.x + r5.z;
/*321*/	      r2.w = r5.y * r2.w + r5.x;
/*322*/	    } else {
/*323*/	      r2.w = 1.000000;
/*324*/	    }
/*325*/	  } else {
/*326*/	    r2.w = 1.000000;
/*327*/	  }
/*328*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*329*/	  r5.y = r5.x * cb1.data[34].x;
/*330*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*331*/	  r5.x = r1.w + -r5.x;
/*332*/	  r5.x = saturate(r5.x / r5.y);
/*333*/	  r2.w = -r3.z + r2.w;
/*334*/	  r3.z = r5.x * r2.w + r3.z;
/*335*/	}
/*336*/	if(floatBitsToUint(r3.w) != 0u) {
/*337*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*338*/	  r3.w = r2.w * cb1.data[34].y;
/*339*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*340*/	  r2.w = r1.w + -r2.w;
/*341*/	  r2.w = saturate(r2.w / r3.w);
/*342*/	  r3.y = -r3.z + 1.000000;
/*343*/	  r3.z = r2.w * r3.y + r3.z;
/*344*/	}
/*345*/	r3.z = saturate(r3.z);
/*346*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*347*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*348*/	r2.w = inversesqrt(r2.w);
/*349*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*350*/	r2.w = -r3.x + 1.000000;
/*351*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*352*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*353*/	r3.w = r3.w + r3.w;
/*354*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*355*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*356*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*357*/	r3.w = cos((r8.x));
/*358*/	r3.w = inversesqrt(r3.w);
/*359*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*360*/	r5.w = saturate(r0.z * 60.000000);
/*361*/	r5.w = -r0.z + r5.w;
/*362*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*363*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*364*/	r6.w = inversesqrt(r6.w);
/*365*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*366*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*367*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*368*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*369*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*370*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*371*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*372*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*373*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*374*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*375*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*376*/	r6.w = -r0.z + 1.000000;
/*377*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*378*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*379*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*380*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*381*/	  r6.w = max(r6.w, 0.000000);
/*382*/	  r6.w = log2(r6.w);
/*383*/	  r6.w = r6.w * 10.000000;
/*384*/	  r6.w = exp2(r6.w);
/*385*/	  r6.w = r3.w * r6.w;
/*386*/	  r6.w = r6.w * r5.w + r0.z;
/*387*/	  r7.y = r2.w * 8.000000;
/*388*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*389*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*390*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*391*/	}
/*392*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*393*/	r7.y = max(r6.w, 0.000000);
/*394*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*395*/	if(floatBitsToUint(r6.w) != 0u) {
/*396*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*397*/	  r6.x = max(r6.x, -1.000000);
/*398*/	  r6.x = min(r6.x, 1.000000);
/*399*/	  r6.y = -abs(r6.x) + 1.000000;
/*400*/	  r6.y = sqrt(r6.y);
/*401*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*402*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*403*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*404*/	  r6.w = r6.y * r6.z;
/*405*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*406*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*407*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*408*/	  r6.x = r6.z * r6.y + r6.x;
/*409*/	  r3.x = r3.x * r3.x;
/*410*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*411*/	  r3.x = r3.x * r3.y + r7.x;
/*412*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*413*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*414*/	  r3.y = -r3.x * r3.x + 1.000000;
/*415*/	  r3.y = max(r3.y, 0.001000);
/*416*/	  r3.y = log2(r3.y);
/*417*/	  r6.y = r3.y * 4.950617;
/*418*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*419*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*420*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*421*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*422*/	  r3.x = floatBitsToInt(r3.x);
/*423*/	  r6.y = r3.y * r3.y + -r6.y;
/*424*/	  r6.y = sqrt(r6.y);
/*425*/	  r3.y = -r3.y + r6.y;
/*426*/	  r3.y = max(r3.y, 0.000000);
/*427*/	  r3.y = sqrt(r3.y);
/*428*/	  r3.x = r3.y * r3.x;
/*429*/	  r3.x = r3.x * 1.414214;
/*430*/	  r3.x = 0.008727 / r3.x;
/*431*/	  r3.x = max(r3.x, 0.000100);
/*432*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*433*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*434*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*435*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*436*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*437*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*438*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*439*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*440*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*441*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*442*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*443*/	  r3.x = floatBitsToInt(r3.x);
/*444*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*445*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*446*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*447*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*448*/	  r3.x = r3.x * r6.x + 1.000000;
/*449*/	  r3.x = r3.x * 0.500000;
/*450*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*451*/	  r3.y = r3.y * r6.y + 1.000000;
/*452*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*453*/	  r3.y = min(r7.y, 1.000000);
/*454*/	  r2.w = r2.w * 1.570796;
/*455*/	  r2.w = sin(r2.w);
/*456*/	  r3.y = r3.y + -1.000000;
/*457*/	  r2.w = r2.w * r3.y + 1.000000;
/*458*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*459*/	  r3.y = max(r3.y, 0.000000);
/*460*/	  r3.y = log2(r3.y);
/*461*/	  r3.y = r3.y * 10.000000;
/*462*/	  r3.y = exp2(r3.y);
/*463*/	  r3.y = r3.w * r3.y;
/*464*/	  r3.y = r3.y * r5.w + r0.z;
/*465*/	  r2.w = r2.w * abs(r3.x);
/*466*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*467*/	} else {
/*468*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*469*/	}
/*470*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*471*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*472*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*473*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*474*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*475*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*476*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*477*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*478*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*479*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*480*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*481*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*482*/	r2.w = inversesqrt(r2.w);
/*483*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*484*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*485*/	r2.w = r2.w + r2.w;
/*486*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*487*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*488*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*489*/	r1.x = max(r1.x, 0.000000);
/*490*/	r1.x = log2(r1.x);
/*491*/	r1.x = r1.x * 10.000000;
/*492*/	r1.x = exp2(r1.x);
/*493*/	r1.x = r3.w * r1.x;
/*494*/	r0.z = r1.x * r5.w + r0.z;
/*495*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*496*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*497*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*498*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*499*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*500*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*501*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*502*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*503*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*504*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*505*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*506*/	if(r0.x != 0) discard;
/*507*/	color1.x = 1.000000;
/*508*/	return;
}
