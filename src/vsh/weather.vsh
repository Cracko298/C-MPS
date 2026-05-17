.in aPosition v0
.in aColor v1
.in aTexCoord0 v2
.in aTexCoord1 v3
.fvec WORLDVIEWPROJ[4]

.out outPos position o0
.out outColor color o1
.out outCoord0 texcoord0 o2
.out outCoord1 texcoord1 o3

.setf c4(2.000000, 10.000000, 0.000000, 0.000000)

.proc main
    dp4 outPos.x, WORLDVIEWPROJ[0], aPosition
    dp4 outPos.y, WORLDVIEWPROJ[1], aPosition
    dp4 outPos.z, WORLDVIEWPROJ[2], aPosition
    dp4 outPos.w, WORLDVIEWPROJ[3], aPosition
    mov outColor, aColor
    mov outCoord1, aTexCoord1
    mul outCoord0.xy, c4.xyyy, aTexCoord0.xyyy
    end
    ret
.end

