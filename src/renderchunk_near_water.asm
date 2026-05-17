#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )
#pragma bind_symbol ( aTexCoord.xy , v2 )
#pragma bind_symbol ( bTexCoord.xy , v3 )
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( WORLDVIEW , c4 , c7 )
#pragma bind_symbol ( PROJ , c8 , c11 )
#pragma bind_symbol ( FOG_COLOR , c12 )
#pragma bind_symbol ( FOG_CONTROL , c13 )
#pragma bind_symbol ( RENDER_DISTANCE , c14 )
#pragma bind_symbol ( VIEWPORT_DIMENSION , c15 )
#pragma bind_symbol ( CURRENT_COLOR , c16 )
#pragma bind_symbol ( CHUNK_ORIGIN_AND_SCALE , c17 )
#pragma bind_symbol ( VIEW_POS , c18 )
#pragma bind_symbol ( FAR_CHUNKS_DISTANCE , c19 )

#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )
#pragma output_map ( texcoord0 , o2 )
#pragma output_map ( texcoord1 , o3 )

def c40, 1.000000, -1.000000, 1.000000, 1.000000
def c41, 0.000000, 1.000000, 0.000000, 0.099998
def c42, 4.000000, 0.219604, 0.500000, 0.449997
def c43, 0.799988, 0.000000, 0.000000, 0.000000
def c50, 0.003922, 0.003922, 0.003922, 0.003922
def c51, 0.00001526, 0.00001526, 0.00001526, 0.00001526
def c52, 0.000000, 0.000000, 0.000000, 0.000000

main:
mul r0.xyz, c17.wwww, v0.xyzz
add r1.xyz, c17.xyzz, r0.xyzz
mov r1.w, c40.xxxx
mov r3, r1
dp4 o0.x, c1, r1
dp4 o0.y, -c0, r1
dp4 o0.z, c2, r1
dp4 o0.w, c3, r1
mul r0, c51, v2
slti r1, r0, c52
add o2, r0, r1
mul r0, c51, v3
slti r1, r0, c52
add o3, r0, r1
mul r0, c50, v1
mov r1.xyz, -r3.xyzz
mul r4.y, r1.xxxx, r1.xxxx
mad r4.y, r1.yyyy, r1.yyyy, r4.yyyy
mad r4.y, r1.zzzz, r1.zzzz, r4.yyyy
rsq r15.y, r4.yyyy
mul r4.y, r4.yyyy, r15.yyyy
rcp r5.x, c19.xxxx
mul r6.x, r4.yyyy, r5.xxxx
dp4 r7.x, r1, r1
rsq r7.x, r7.xxxx
mul r7, r1, r7.xxxx
dp3 r8.x, c41, r7
max r9.x, c41.wwww, r8.xxxx
add r8.x, c40.xxxx, -r9.xxxx
min r9.x, c40.xxxx, r6.xxxx
mul r10.x, r8.xxxx, r8.xxxx
mul r10.x, r10.xxxx, r10.xxxx
add r14.x, c40.xxxx, -r10.xxxx
mad r14.x, r14.xxxx, r9.xxxx, r10.xxxx
add r8.x, c40.xxxx, -r14.xxxx
mad r0.xy, r8.xxxx, -c42.yyyy, r0.xyyy
mul r10.xyz, c42.zzzz, r0.xyzz
mov r10.w, c40.xxxx
mul r11.xyz, c42.wwww, r0.xyzz
mov r11.w, c43.xxxx
mov r12.xyz, r0.xyzz
mov r12.w, c40.xxxx
add r13, r10, -r11
mad r13, r13, r0.wwww, r11
add r14, r13, -r12
mad r14, r14, r8.xxxx, r12
mov o1, r14
end
ret
endmain:

