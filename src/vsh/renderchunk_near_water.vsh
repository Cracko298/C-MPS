.in aPosition v0
.in aColor v1
.in aTexCoord v2
.in bTexCoord v3
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

.out outPos position o0
.out outColor color o1
.out outCoord0 texcoord0 o2
.out outCoord1 texcoord1 o3

.setf c40(1.000000, -1.000000, 1.000000, 1.000000)
.setf c41(0.000000, 1.000000, 0.000000, 0.099998)
.setf c42(4.000000, 0.219604, 0.500000, 0.449997)
.setf c43(0.799988, 0.000000, 0.000000, 0.000000)
.setf c50(0.003922, 0.003922, 0.003922, 0.003922)
.setf c51(0.00001526, 0.00001526, 0.00001526, 0.00001526)
.setf c52(0.000000, 0.000000, 0.000000, 0.000000)

.proc main
    mul r0.xyz, CHUNK_ORIGIN_AND_SCALE.wwww, aPosition.xyzz
    add r1.xyz, CHUNK_ORIGIN_AND_SCALE.xyzz, r0.xyzz
    mov r1.w, c40.xxxx
    mov r3, r1
    dp4 outPos.x, WORLDVIEWPROJ[1], r1
    dp4 outPos.y, -WORLDVIEWPROJ[0], r1
    dp4 outPos.z, WORLDVIEWPROJ[2], r1
    dp4 outPos.w, WORLDVIEWPROJ[3], r1
    mul r0, c51, aTexCoord
    slti r1, r0, c52
    add outCoord0, r0, r1
    mul r0, c51, bTexCoord
    slti r1, r0, c52
    add outCoord1, r0, r1
    mul r0, c50, aColor
    mov r1.xyz, -r3.xyzz
    mul r4.y, r1.xxxx, r1.xxxx
    mad r4.y, r1.yyyy, r1.yyyy, r4.yyyy
    mad r4.y, r1.zzzz, r1.zzzz, r4.yyyy
    rsq r15.y, r4.yyyy
    mul r4.y, r4.yyyy, r15.yyyy
    rcp r5.x, FAR_CHUNKS_DISTANCE.xxxx
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
    mov outColor, r14
    end
    ret
.end

