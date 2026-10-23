.in aPosition v0
.in aColor v1
.fvec WORLDVIEWPROJ[4]
.fvec WORLD[4]
.fvec RENDER_DISTANCE
.fvec FOG_COLOR
.fvec CURRENT_COLOR

.out outPos position o0
.out outColor color o1

.setf c19(1.000000, -1.000000, 1.000000, 1.000000)
.setf c20(0.003921568393707275, 0.003921568393707275, 0.003921568393707275, 0.003921568393707275)
.setf c21(0.899993896484375, 0.899993896484375, 0.899993896484375, 0.899993896484375)
.setf c30(0.000000, 0.000000, 0.000000, 1.000000)

.proc length
    mul r15.x, r14.xxxx, r14.xxxx
    mad r15.x, r14.yyyy, r14.yyyy, r15.xxxx
    mad r15.x, r14.zzzz, r14.zzzz, r15.xxxx
    rsq r15.y, r15.xxxx
    mul r15.x, r15.xxxx, r15.yyyy
.end

.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxzz
    mul outPos, c19, r0
    // Preserve face shading and alpha from the mesh RGBA channels.
    mul r0, c20, aColor
    mul r1, CURRENT_COLOR, r0
    dp4 r2.x, WORLD[0], aPosition
    dp4 r2.y, WORLD[1], aPosition
    dp4 r2.z, WORLD[2], aPosition
    dp4 r2.w, WORLD[3], aPosition
    mov r14, r2
    call length
    mov r3.y, r15.xxxx
    rcp r4.x, RENDER_DISTANCE.xxxx
    mul r5.x, r3.yyyy, r4.xxxx
    add r6.x, -c21.xxxx, r5.xxxx
    max r7.x, c30.xxxx, r6.xxxx
    add r8.x, c19.xxxx, -r7.xxxx
    // Keep the distance fade from producing negative alpha.
    max r8.x, c30.xxxx, r8.xxxx
    mul r1.w, r1.wwww, r8.xxxx
    mov outColor, r1
    end
.end
