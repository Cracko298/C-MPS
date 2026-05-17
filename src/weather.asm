#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )
#pragma bind_symbol ( aTexCoord0.xy , v2 )
#pragma bind_symbol ( aTexCoord1.xy , v3 )
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )

#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )
#pragma output_map ( texcoord0 , o2 )
#pragma output_map ( texcoord1 , o3 )

def c4, 2.000000, 10.000000, 0.000000, 0.000000

main:
dp4 o0.x, c0, v0
dp4 o0.y, c1, v0
dp4 o0.z, c2, v0
dp4 o0.w, c3, v0
mov o1, v1
mov o3, v3
mul o2.xy, c4.xyyy, v2.xyyy
end
ret
endmain:

