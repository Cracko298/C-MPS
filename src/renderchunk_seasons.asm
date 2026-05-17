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
#pragma bind_symbol ( ENABLE_FOG , b1 )
#pragma bind_symbol ( ALLOW_FADE , b2 )

#pragma output_map ( position , o0 )
#pragma output_map ( texcoord0 , o1 )
#pragma output_map ( texcoord1 , o2 )
#pragma output_map ( texcoord2 , o3 )
#pragma output_map ( color , o4 )

def c32, 1.000000, -1.000000, 1.000000, 1.000000
def c33, 0.003922, 0.003922, 0.003922, 0.003922
def c34, 0.00001526, 0.00001526, 0.00001526, 0.00001526
def c35, 0.000000, 0.000000, 0.000000, 0.000000

main:
mul r0.xyz, c17.wwww, v0.xyzz
add r1.xyz, c17.xyzz, r0.xyzz
mov r1.w, c32.xxxx
dp4 o0.x, c1, r1
dp4 o0.y, -c0, r1
dp4 o0.z, c2, r1
dp4 o0.w, c3, r1
mul r0, c34, v2
slti r1, r0, c35
add o1, r0, r1
mul r0, c34, v3
slti r1, r0, c35
add o2, r0, r1
mul o3, c33, v1
mul o4, c33, v1
end
ret
endmain:

