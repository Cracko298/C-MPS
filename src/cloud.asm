#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( WORLD , c4 , c7 )
#pragma bind_symbol ( RENDER_DISTANCE , c8 )
#pragma bind_symbol ( FOG_COLOR , c9 )
#pragma bind_symbol ( CURRENT_COLOR , c10 )

#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 0.003921568393707275, 0.003921568393707275, 0.003921568393707275, 0.003921568393707275
def c21, 0.899993896484375, 0.899993896484375, 0.899993896484375, 0.899993896484375
def c30, 0.000000, 0.000000, 0.000000, 1.000000

length:
mul r15.x, r14.xxxx, r14.xxxx
mad r15.x, r14.yyyy, r14.yyyy, r15.xxxx
mad r15.x, r14.zzzz, r14.zzzz, r15.xxxx
rsq r15.y, r15.xxxx
mul r15.x, r15.xxxx, r15.yyyy
endlength:

main:
dp4 r0.x, c0, v0
dp4 r0.y, c1, v0
dp4 r0.z, c2, v0
dp4 r0.w, c3, v0
mov r0.xyz, r0.yxzz
mul o0, c19, r0
// Preserve face shading and alpha from the mesh RGBA channels.
mul r0, c20, v1
mul r1, c10, r0
dp4 r2.x, c4, v0
dp4 r2.y, c5, v0
dp4 r2.z, c6, v0
dp4 r2.w, c7, v0
mov r14, r2
call length
mov r3.y, r15.xxxx
rcp r4.x, c8.xxxx
mul r5.x, r3.yyyy, r4.xxxx
add r6.x, -c21.xxxx, r5.xxxx
max r7.x, c30.xxxx, r6.xxxx
add r8.x, c19.xxxx, -r7.xxxx
// Keep the distance fade from producing negative alpha.
max r8.x, c30.xxxx, r8.xxxx
mul r1.w, r1.wwww, r8.xxxx
mov o1, r1
end
endmain:
