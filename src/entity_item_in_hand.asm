#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( aNormal.xyzw , v2 )
#pragma bind_symbol ( aColor.xyzw , v3 )
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( TILE_LIGHT_COLOR , c4 )
#pragma bind_symbol ( WORLD , c9 , c12 )
#pragma bind_symbol ( UV_ANIM , c13 )
#pragma bind_symbol ( UV_OFFSET , c14 )
#pragma bind_symbol ( OVERLAY_COLOR , c15 )
#pragma bind_symbol ( CHANGE_COLOR , c16 )
#pragma bind_symbol ( GLINT_COLOR , c17 )
#pragma bind_symbol ( UV_ROTATION , c18 )
#pragma bind_symbol ( GLINT_UV_SCALE , c19 )

#pragma output_map ( position , o0 )
#pragma output_map ( color , o2 )

def c20, 1.000000, -1.000000, 1.000000, 1.000000
def c21, 0.00001526, 0.00001526, 0.00001526, 0.00001526
def c22, 0.000000, 0.000000, 0.000000, 0.000000
def c40, 1.000000, 0.500000, -0.099998, 0.099998
def c41, 0.449997, 0.549988, 0.349995, 0.000000
def c43, 1.000000, 1.000000, 1.000000, 1.000000
def c44, 0.003922, 0.003922, 0.003922, 0.003922

main:
dp4 r0.x, c0, v0
dp4 r0.y, c1, v0
dp4 r0.z, c2, v0
dp4 r0.w, c3, v0
mov r0.xyz, r0.yxzz
mul o0, c20, r0
dp4 r15.x, c9, v2
dp4 r15.y, c10, v2
dp4 r15.z, c11, v2
dp4 r1.x, r15.xyzz, r15.xyzz
rsq r1.x, r1.xxxx
mul r1.xyz, r15.xyzz, r1.xxxx
mul r1.y, c4.wwww, r1.yyyy
add r15.y, c40.xxxx, r1.yyyy
mul r15.y, c40.yyyy, r15.yyyy
mul r15.x, r1.xxxx, r1.xxxx
mul r15.x, c40.zzzz, r15.xxxx
mul r15.z, r1.zzzz, r1.zzzz
mul r15.z, c40.wwww, r15.zzzz
mul r1.x, c41.yyyy, r15.yyyy
add r1.x, r1.xxxx, r15.xxxx
add r1.x, r1.xxxx, r15.zzzz
add r1.x, c41.xxxx, r1.xxxx
mov r2.y, c15.wwww
mul r2.x, c41.zzzz, r2.yyyy
add r1.x, r1.xxxx, r2.xxxx
mul r0.xyz, c4.xyzz, r1.xxxx
mov r0.w, c40.xxxx
mov r8, c43
mul r7, c44, v3
mul r0, r0, r7
mul r1.xyz, c16.xyzz, r8.xyzz
add r2.xyz, r1.xyzz, -r8.xyzz
mad r2.xyz, r2, r8.wwww, r8.xyzz
mov r8.xyz, r2.xyzz
mov r1.x, c15.wwww
add r2.xyz, c15, -r8
mad r2.xyz, r2, r1.xxxx, r8
mov r8.xyz, r2.xyzz
mul r8, r8, r0
mov o2, r8
end
ret
endmain:

