//
//
// Shader Model 4
// Fragment Shader
//
// id: 1644 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r3.z = sqrt(r1.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r1.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r2.x = inversesqrt(r2.x);
/*38*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*39*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*40*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*41*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*43*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*46*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*47*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*48*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*49*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*50*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*52*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r2.w = inversesqrt(r2.w);
/*54*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*55*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*58*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*61*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*62*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*63*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*64*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r2.w = inversesqrt(r2.w);
/*66*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*67*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*68*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*69*/	r4.y = inversesqrt(r2.w);
/*70*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*71*/	r5.x = -r4.x + 1.000000;
/*72*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*74*/	r5.z = r5.z + r5.z;
/*75*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*76*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*77*/	r5.z = r5.x * 1.539380;
/*78*/	r5.z = cos((r5.z));
/*79*/	r5.z = inversesqrt(r5.z);
/*80*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*81*/	r5.w = saturate(r1.w * 60.000000);
/*82*/	r5.w = -r1.w + r5.w;
/*83*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*84*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*85*/	r6.w = inversesqrt(r6.w);
/*86*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*87*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*88*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*89*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*90*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*91*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*92*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*93*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*94*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*95*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*96*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*97*/	r6.w = -r1.w + 1.000000;
/*98*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*99*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*100*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*101*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*102*/	  r6.w = max(r6.w, 0.000000);
/*103*/	  r6.w = log2(r6.w);
/*104*/	  r6.w = r6.w * 10.000000;
/*105*/	  r6.w = exp2(r6.w);
/*106*/	  r6.w = r5.z * r6.w;
/*107*/	  r6.w = r6.w * r5.w + r1.w;
/*108*/	  r7.y = r5.x * 8.000000;
/*109*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*110*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*111*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*112*/	}
/*113*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*114*/	r2.y = max(r2.x, 0.000000);
/*115*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r2.x) != 0u) {
/*117*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*118*/	  r2.x = max(r2.x, -1.000000);
/*119*/	  r2.x = min(r2.x, 1.000000);
/*120*/	  r2.z = -abs(r2.x) + 1.000000;
/*121*/	  r2.z = sqrt(r2.z);
/*122*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*123*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*124*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*125*/	  r6.y = r2.z * r6.x;
/*126*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*127*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*128*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*129*/	  r2.x = r6.x * r2.z + r2.x;
/*130*/	  r2.z = r4.x * r4.x;
/*131*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*132*/	  r2.z = r2.z * r4.x + r7.x;
/*133*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*134*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*135*/	  r4.x = -r2.z * r2.z + 1.000000;
/*136*/	  r4.x = max(r4.x, 0.001000);
/*137*/	  r4.x = log2(r4.x);
/*138*/	  r5.y = r4.x * 4.950617;
/*139*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*140*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*141*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*142*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*143*/	  r2.z = floatBitsToInt(r2.z);
/*144*/	  r5.y = r4.x * r4.x + -r5.y;
/*145*/	  r5.y = sqrt(r5.y);
/*146*/	  r4.x = -r4.x + r5.y;
/*147*/	  r4.x = max(r4.x, 0.000000);
/*148*/	  r4.x = sqrt(r4.x);
/*149*/	  r2.z = r2.z * r4.x;
/*150*/	  r2.z = r2.z * 1.414214;
/*151*/	  r2.z = 0.008727 / r2.z;
/*152*/	  r2.z = max(r2.z, 0.000100);
/*153*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*154*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*155*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*156*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*157*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*158*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*159*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*160*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*161*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*162*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*164*/	  r2.x = floatBitsToInt(r2.x);
/*165*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*166*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*167*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*168*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*169*/	  r2.x = r2.x * r6.x + 1.000000;
/*170*/	  r2.x = r2.x * 0.500000;
/*171*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*172*/	  r2.z = r2.z * r6.y + 1.000000;
/*173*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*174*/	  r2.z = min(r2.y, 1.000000);
/*175*/	  r4.x = r5.x * 1.570796;
/*176*/	  r4.x = sin(r4.x);
/*177*/	  r2.z = r2.z + -1.000000;
/*178*/	  r2.z = r4.x * r2.z + 1.000000;
/*179*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*180*/	  r4.x = max(r4.x, 0.000000);
/*181*/	  r4.x = log2(r4.x);
/*182*/	  r4.x = r4.x * 10.000000;
/*183*/	  r4.x = exp2(r4.x);
/*184*/	  r4.x = r5.z * r4.x;
/*185*/	  r4.x = r4.x * r5.w + r1.w;
/*186*/	  r2.x = r2.z * abs(r2.x);
/*187*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*188*/	} else {
/*189*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*190*/	}
/*191*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*192*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*193*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*194*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*195*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*196*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*197*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*198*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*199*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*200*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*201*/	r1.x = sqrt(r2.w);
/*202*/	r1.y = saturate(cb2.data[0].w)/**/;
/*203*/	r1.y = -r1.y + 1.000000;
/*204*/	r1.y = r1.y * 8.000000 + -4.000000;
/*205*/	r1.z = saturate(cb2.data[1].x)/**/;
/*206*/	r1.z = -r1.z + 1.000000;
/*207*/	r1.z = r1.z * 1000.000000;
/*208*/	r1.x = r1.x / r1.z;
/*209*/	r1.x = r1.x + r1.y;
/*210*/	r1.x = r1.x * 1.442695;
/*211*/	r1.x = exp2(r1.x);
/*212*/	r1.x = cb2.data[1].y / r1.x;
/*213*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*214*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*215*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*216*/	r1.y = r1.y + -cb2.data[1].z;
/*217*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*218*/	r1.y = saturate(r1.z * r1.y);
/*219*/	r1.z = r1.y * -2.000000 + 3.000000;
/*220*/	r1.y = r1.y * r1.y;
/*221*/	r1.y = r1.y * r1.z;
/*222*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*223*/	r1.z = sqrt(r1.z);
/*224*/	r1.w = max(cb2.data[2].z, 0.001000);
/*225*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*226*/	r1.z = r1.w * r1.z;
/*227*/	r1.z = min(r1.z, 1.000000);
/*228*/	r1.w = r1.z * -2.000000 + 3.000000;
/*229*/	r1.z = r1.z * r1.z;
/*230*/	r1.z = r1.z * r1.w;
/*231*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*232*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*233*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*234*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*235*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*236*/	r3.w = max(r3.y, 0.000000);
/*237*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*238*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*239*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*240*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*241*/	r1.x = saturate(r1.x * r1.z);
/*242*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*243*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*244*/	color0.w = r0.w * vsOut_T6.w;
/*245*/	return;
}
