#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( aColor.xyzw , v2 )
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( POSITION_OFFSET , c4 )
#pragma bind_symbol ( VELOCITY , c5 )
#pragma bind_symbol ( ALPHA , c6 )
#pragma bind_symbol ( VIEW_POSITION , c7 )
#pragma bind_symbol ( SIZE_SCALE , c8 )
#pragma bind_symbol ( LIGHTING , c9 )
#pragma bind_symbol ( FORWARD , c10 )
#pragma bind_symbol ( UV_INFO , c11 )
#pragma bind_symbol ( PARTICLE_BOX , c12 )

#pragma output_map ( position , o0 )
#pragma output_map ( texcoord0 , o1 )
#pragma output_map ( texcoord1 , o3 )
#pragma output_map ( color , o2 )

def c23, 0.500000, 1.000000, 0.000000, 1.000000
def c30, 0.000000, 0.000000, 0.000000, 1.000000
def c31, 1.000000, -1.000000, 1.000000, 1.000000
def c43, 0.015625, 0.500000, 0.000000, 1.000000

main:
mul r1.xy, -c11.zwww, v1.xyyy
add r1.xy, c11.xyyy, r1.xyyy
mad r1.x, v2.xxxx, c11.zzzz, r1.xxxx
mov o1, r1
add r0.xyz, c4.xyzz, v0.xyzz
rcp r3.x, c12.xxxx
rcp r3.y, c12.yyyy
rcp r3.z, c12.zzzz
mul r3.xyz, r3.xyzz, r0.xyzz
flr r3.xyz, r3.xyzz
mul r3.xyz, c12.xyzz, r3.xyzz
add r0.xyz, r0.xyzz, -r3.xyzz
mov r4.xyz, c12.xxxx
mad r1.xyz, r4.xyzz, -c23.xxxx, r0.xyzz
add r1.xyz, c10.xyzz, r1.xyzz
mov r1.w, c23.wwww
mov r2.xyz, c5.xyzz
mad r2.xyz, r2.xyzz, c8.yyyy, r1.xyzz
mov r2.w, c23.wwww
dp4 r4.x, c1, r1
dp4 r4.y, -c0, r1
dp4 r4.z, c2, r1
dp4 r4.w, c3, r1
dp4 r5.x, c1, r2
dp4 r5.y, -c0, r2
dp4 r5.z, c2, r2
dp4 r5.w, c3, r2
rcp r6.w, r4.wwww
mul r6.xy, r4.xyyy, r6.wwww
rcp r7.w, r5.wwww
mul r7.xy, r5.xyyy, r7.wwww
add r6.xy, r7.xyyy, -r6.xyyy
mov r7.x, -r6.yyyy
mov r7.y, r6.xxxx
dp4 r6.x, r7.xyyy, r7.xyyy
rsq r6.x, r6.xxxx
mul r7.xy, r7.xyyy, r6.xxxx
add r6, r5, -r4
mad r6, r6, v1.yyyy, r4
mul r7.xy, c8.xxxx, r7.xyyy
add r8.x, c23.xxxx, -v1.xxxx
mad r6.xy, r7.xyyy, r8.xxxx, r6.xyyy
mov o0, r6
mov o2, c6
mul r1.xz, c43.xxxx, r1.xzzz
add r1.xz, c43.yyyy, r1.xzzz
mov o3, r1.xzzz
end
ret
endmain:

