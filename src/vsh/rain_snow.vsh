.in aPosition v0
.in aTexCoord v1
.in aColor v2
.fvec WORLDVIEWPROJ[4]
.fvec POSITION_OFFSET
.fvec VELOCITY
.fvec ALPHA
.fvec VIEW_POSITION
.fvec SIZE_SCALE
.fvec LIGHTING
.fvec FORWARD
.fvec UV_INFO
.fvec PARTICLE_BOX

.out outPos position o0
.out outCoord0 texcoord0 o1
.out outCoord1 texcoord1 o3
.out outColor color o2

.setf c23(0.500000, 1.000000, 0.000000, 1.000000)
.setf c30(0.000000, 0.000000, 0.000000, 1.000000)
.setf c31(1.000000, -1.000000, 1.000000, 1.000000)
.setf c43(0.015625, 0.500000, 0.000000, 1.000000)

.proc main
    mul r1.xy, -UV_INFO.zwww, aTexCoord.xyyy
    add r1.xy, UV_INFO.xyyy, r1.xyyy
    mad r1.x, aColor.xxxx, UV_INFO.zzzz, r1.xxxx
    mov outCoord0, r1
    add r0.xyz, POSITION_OFFSET.xyzz, aPosition.xyzz
    rcp r3.x, PARTICLE_BOX.xxxx
    rcp r3.y, PARTICLE_BOX.yyyy
    rcp r3.z, PARTICLE_BOX.zzzz
    mul r3.xyz, r3.xyzz, r0.xyzz
    flr r3.xyz, r3.xyzz
    mul r3.xyz, PARTICLE_BOX.xyzz, r3.xyzz
    add r0.xyz, r0.xyzz, -r3.xyzz
    mov r4.xyz, PARTICLE_BOX.xxxx
    mad r1.xyz, r4.xyzz, -c23.xxxx, r0.xyzz
    add r1.xyz, FORWARD.xyzz, r1.xyzz
    mov r1.w, c23.wwww
    mov r2.xyz, VELOCITY.xyzz
    mad r2.xyz, r2.xyzz, SIZE_SCALE.yyyy, r1.xyzz
    mov r2.w, c23.wwww
    dp4 r4.x, WORLDVIEWPROJ[1], r1
    dp4 r4.y, -WORLDVIEWPROJ[0], r1
    dp4 r4.z, WORLDVIEWPROJ[2], r1
    dp4 r4.w, WORLDVIEWPROJ[3], r1
    dp4 r5.x, WORLDVIEWPROJ[1], r2
    dp4 r5.y, -WORLDVIEWPROJ[0], r2
    dp4 r5.z, WORLDVIEWPROJ[2], r2
    dp4 r5.w, WORLDVIEWPROJ[3], r2
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
    mad r6, r6, aTexCoord.yyyy, r4
    mul r7.xy, SIZE_SCALE.xxxx, r7.xyyy
    add r8.x, c23.xxxx, -aTexCoord.xxxx
    mad r6.xy, r7.xyyy, r8.xxxx, r6.xyyy
    mov outPos, r6
    mov outColor, ALPHA
    mul r1.xz, c43.xxxx, r1.xzzz
    add r1.xz, c43.yyyy, r1.xzzz
    mov outCoord1, r1.xzzz
    end
    ret
.end

