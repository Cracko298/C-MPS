.in aPosition v0
.in aColor v1
.in aTexCoord v2
.in bTexCoord v3
.in aNormal v4
.fvec WORLDVIEWPROJ[4]
.fvec WORLDVIEW[4]
.fvec PROJ[4]
.fvec FOG_COLOR
.fvec FOG_CONTROL
.fvec RENDER_DISTANCE
.fvec VIEWPORT_DIMENSION
.fvec CURRENT_COLOR
.fvec CHUNK_ORIGIN_AND_SCALE
.fvec VIEW_POS
.fvec FAR_CHUNKS_DISTANCE
.bool ENABLE_FOG
.bool ALLOW_FADE

.out outPos position o0
.out outColor color o1
.out outCoord0 texcoord0 o2
.out outCoord1 texcoord1 o3

.setf c32(1.000000, -1.000000, 1.000000, 1.000000)
.setf c33(0.003922, 0.003922, 0.003922, 0.003922)
.setf c34(0.00001526, 0.00001526, 0.00001526, 0.00001526)
.setf c35(0.000000, 0.000000, 0.000000, 0.000000)

.proc main
    dp4 outPos.x, WORLDVIEWPROJ[1], aPosition
    dp4 outPos.y, -WORLDVIEWPROJ[0], aPosition
    dp4 outPos.z, WORLDVIEWPROJ[2], aPosition
    dp4 outPos.w, WORLDVIEWPROJ[3], aPosition
    mul outColor, c33, aColor
    mul r0, c34, aTexCoord
    slti r1, r0, c35
    add outCoord0, r0, r1
    mul r0, c34, bTexCoord
    slti r1, r0, c35
    add outCoord1, r0, r1
    end
    ret
.end

