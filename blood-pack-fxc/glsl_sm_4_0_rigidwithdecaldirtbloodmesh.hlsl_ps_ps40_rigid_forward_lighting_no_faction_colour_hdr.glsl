//
//
// Shader Model 4
// Fragment Shader
//
// id: 994 - fxc/glsl_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
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
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*23*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*25*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*26*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*27*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*31*/	r4.z = vsOut_T6.x;
/*32*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*33*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*34*/	if(floatBitsToUint(r1.w) != 0u) {
/*35*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*36*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*37*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*38*/	  r1.w = -r1.w + 1.000000;
/*39*/	  r1.w = max(r1.w, 0.000000);
/*40*/	  r4.z = sqrt(r1.w);
/*41*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*42*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*43*/	  r1.w = r3.y * r7.w;
/*44*/	  r3.y = r1.w * -0.500000 + r3.y;
/*45*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*46*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*47*/	  r1.w = -r5.w * r6.w + 1.000000;
/*48*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*49*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*50*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*51*/	}
/*52*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*53*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*54*/	r4.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*55*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*56*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	r1.w = r4.w * r5.w;
/*58*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*59*/	r1.xyz = (r1.wwww * r5.xyzx + r1.xyzx).xyz;
/*60*/	r0.xy = (r4.xyxx * r4.wwww + r0.xyxx).xy;
/*61*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*64*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*65*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*66*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*67*/	r2.w = saturate(-r2.w + r4.w);
/*68*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r2.w) != 0u) {
/*70*/	  r2.w = -r4.w + 1.000000;
/*71*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*72*/	  r2.w = -r2.w + 1.000000;
/*73*/	  r2.w = -r2.w * r2.w + 1.000000;
/*74*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*75*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*76*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*77*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*78*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*79*/	  r5.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*80*/	  r1.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*81*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*82*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*83*/	} else {
/*84*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*85*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*86*/	}
/*87*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*90*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*93*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*96*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*97*/	r7.xyz = (r0.xxxx * r2.xyzx + r7.xyzx).xyz;
/*98*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*99*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*100*/	r1.w = inversesqrt(r1.w);
/*101*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*102*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*103*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*104*/	if(floatBitsToUint(r0.w) != 0u) {
/*105*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*106*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*107*/	  r0.w = r3.w * cb0.data[26].x;
/*108*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*109*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*110*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*111*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*112*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*113*/	}
/*114*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*115*/	if(floatBitsToUint(r0.w) != 0u) {
/*116*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*117*/	  if(floatBitsToUint(r0.w) != 0u) {
/*118*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*119*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*120*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*121*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*122*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*123*/	    r0.w = -r0.w + 1.000000;
/*124*/	    r0.w = max(r0.w, 0.000000);
/*125*/	    r8.z = sqrt(r0.w);
/*126*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*127*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*128*/	    r0.w = inversesqrt(r0.w);
/*129*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*130*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*131*/	    r10.y = -1.000000;
/*132*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*133*/	    r0.w = inversesqrt(r0.w);
/*134*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*135*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*136*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*137*/	    r1.w = r1.w * 1.250000;
/*138*/	    r1.w = min(r1.w, 1.000000);
/*139*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*140*/	    r2.w = r2.w * 4.000000;
/*141*/	    r1.w = r1.w * 0.200000 + r2.w;
/*142*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*143*/	    r0.w = r0.w + -r1.w;
/*144*/	    r0.w = saturate(r0.w * 200.000000);
/*145*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*146*/	    r0.w = r0.w * r0.w;
/*147*/	    r0.w = r0.w * r1.w;
/*148*/	    r3.x = r0.w * -r3.x + r3.x;
/*149*/	    r1.w = -r3.y + 0.200000;
/*150*/	    r3.y = r0.w * r1.w + r3.y;
/*151*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*152*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*153*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*154*/	    r4.xyz = (r0.wwww * r9.xyzx + r4.xyzx).xyz;
/*155*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*156*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*157*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*158*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*159*/	    r1.w = -r1.w + 1.000000;
/*160*/	    r1.w = max(r1.w, 0.000000);
/*161*/	    r7.z = sqrt(r1.w);
/*162*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*163*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*164*/	    r1.w = sqrt(r1.w);
/*165*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*166*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*167*/	    r1.w = inversesqrt(r1.w);
/*168*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*169*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*170*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*171*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*172*/	    r1.w = -r0.y + 1.000000;
/*173*/	    r0.w = min(r0.w, r1.w);
/*174*/	    r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*175*/	    r2.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*176*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*177*/	    r0.w = inversesqrt(r0.w);
/*178*/	    r0.xyz = (r0.wwww * r2.xyzx).xyz;
/*179*/	  }
/*180*/	}
/*181*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*182*/	r2.xyz = (r1.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*183*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*184*/	r1.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*185*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*186*/	r2.xyz = (-r1.xyzx + r1.wwww).xyz;
/*187*/	r1.xyz = (vsOut_T7.zzzz * r2.xyzx + r1.xyzx).xyz;
/*188*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*189*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*190*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*191*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*192*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*193*/	r1.w = inversesqrt(r1.w);
/*194*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*195*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*196*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*197*/	r1.w = inversesqrt(r1.w);
/*198*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*199*/	r1.w = -r3.x + 1.000000;
/*200*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*201*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*202*/	r4.x = r4.x + r4.x;
/*203*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*204*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*205*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*206*/	r4.w = cos((r6.x));
/*207*/	r4.w = inversesqrt(r4.w);
/*208*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*209*/	r5.w = saturate(r0.w * 60.000000);
/*210*/	r5.w = -r0.w + r5.w;
/*211*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*212*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*213*/	r7.x = inversesqrt(r7.x);
/*214*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*215*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*216*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*217*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*218*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*219*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*220*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*221*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*222*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*223*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*224*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*225*/	r5.y = -r0.w + 1.000000;
/*226*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*227*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*228*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*229*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*230*/	  r5.y = max(r5.y, 0.000000);
/*231*/	  r5.y = log2(r5.y);
/*232*/	  r5.y = r5.y * 10.000000;
/*233*/	  r5.y = exp2(r5.y);
/*234*/	  r5.y = r4.w * r5.y;
/*235*/	  r5.y = r5.y * r5.w + r0.w;
/*236*/	  r7.x = r1.w * 8.000000;
/*237*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*238*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*239*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*240*/	}
/*241*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*242*/	r7.x = max(r5.y, 0.000000);
/*243*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*244*/	if(floatBitsToUint(r5.y) != 0u) {
/*245*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*246*/	  r4.x = max(r4.x, -1.000000);
/*247*/	  r4.x = min(r4.x, 1.000000);
/*248*/	  r4.y = -abs(r4.x) + 1.000000;
/*249*/	  r4.y = sqrt(r4.y);
/*250*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*251*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*252*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*253*/	  r5.y = r4.y * r4.z;
/*254*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*255*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*256*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*257*/	  r4.x = r4.z * r4.y + r4.x;
/*258*/	  r3.x = r3.x * r3.x;
/*259*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*260*/	  r2.w = r3.x * r2.w + r5.x;
/*261*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*262*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*263*/	  r3.x = -r2.w * r2.w + 1.000000;
/*264*/	  r3.x = max(r3.x, 0.001000);
/*265*/	  r3.x = log2(r3.x);
/*266*/	  r4.y = r3.x * 4.950617;
/*267*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*268*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*269*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*270*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*271*/	  r2.w = floatBitsToInt(r2.w);
/*272*/	  r4.y = r3.x * r3.x + -r4.y;
/*273*/	  r4.y = sqrt(r4.y);
/*274*/	  r3.x = -r3.x + r4.y;
/*275*/	  r3.x = max(r3.x, 0.000000);
/*276*/	  r3.x = sqrt(r3.x);
/*277*/	  r2.w = r2.w * r3.x;
/*278*/	  r2.w = r2.w * 1.414214;
/*279*/	  r2.w = 0.008727 / r2.w;
/*280*/	  r2.w = max(r2.w, 0.000100);
/*281*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*282*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*283*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*284*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*285*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*286*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*287*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*288*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*289*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*290*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*291*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*292*/	  r2.w = floatBitsToInt(r2.w);
/*293*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*294*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*295*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*296*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*297*/	  r2.w = r2.w * r4.x + 1.000000;
/*298*/	  r2.w = r2.w * 0.500000;
/*299*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*300*/	  r3.x = r3.x * r4.y + 1.000000;
/*301*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*302*/	  r3.x = min(r7.x, 1.000000);
/*303*/	  r1.w = r1.w * 1.570796;
/*304*/	  r1.w = sin(r1.w);
/*305*/	  r3.x = r3.x + -1.000000;
/*306*/	  r1.w = r1.w * r3.x + 1.000000;
/*307*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*308*/	  r3.x = max(r3.x, 0.000000);
/*309*/	  r3.x = log2(r3.x);
/*310*/	  r3.x = r3.x * 10.000000;
/*311*/	  r3.x = exp2(r3.x);
/*312*/	  r3.x = r4.w * r3.x;
/*313*/	  r3.x = r3.x * r5.w + r0.w;
/*314*/	  r1.w = r1.w * abs(r2.w);
/*315*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*316*/	} else {
/*317*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*318*/	}
/*319*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*320*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*321*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*322*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*323*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*324*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*325*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*326*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*327*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*328*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*329*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*330*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*331*/	r1.w = inversesqrt(r1.w);
/*332*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*333*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*334*/	r1.w = r1.w + r1.w;
/*335*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*336*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*337*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*338*/	r0.x = max(r0.x, 0.000000);
/*339*/	r0.x = log2(r0.x);
/*340*/	r0.x = r0.x * 10.000000;
/*341*/	r0.x = exp2(r0.x);
/*342*/	r0.x = r4.w * r0.x;
/*343*/	r0.x = r0.x * r5.w + r0.w;
/*344*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*345*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*346*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*347*/	r0.w = 1.000000;
/*348*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*349*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*350*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*351*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*352*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*353*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*354*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*355*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*356*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*357*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*358*/	if(r0.x != 0) discard;
/*359*/	color1.x = 1.000000;
/*360*/	return;
}
