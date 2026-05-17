.in aPosition v0
.in aTexCoord v1
.in aNormal v2
.in aColor v3
.fvec WORLDVIEWPROJ[4]
.fvec TILE_LIGHT_COLOR
.fvec WORLD[4]
.fvec UV_ANIM
.fvec UV_OFFSET
.fvec OVERLAY_COLOR
.fvec CHANGE_COLOR
.fvec GLINT_COLOR
.fvec UV_ROTATION
.fvec GLINT_UV_SCALE

.out outPos position o0
.out outColor color o2

.setf c20(1.000000, -1.000000, 1.000000, 1.000000)
.setf c21(0.00001526, 0.00001526, 0.00001526, 0.00001526)
.setf c22(0.000000, 0.000000, 0.000000, 0.000000)
.setf c40(1.000000, 0.500000, -0.099998, 0.099998)
.setf c41(0.449997, 0.549988, 0.349995, 0.000000)
.setf c43(1.000000, 1.000000, 1.000000, 1.000000)
.setf c44(0.003922, 0.003922, 0.003922, 0.003922)

.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxzz
    mul outPos, c20, r0
    dp4 r15.x, WORLD[0], aNormal
    dp4 r15.y, WORLD[1], aNormal
    dp4 r15.z, WORLD[2], aNormal
    dp4 r1.x, r15.xyzz, r15.xyzz
    rsq r1.x, r1.xxxx
    mul r1.xyz, r15.xyzz, r1.xxxx
    mul r1.y, TILE_LIGHT_COLOR.wwww, r1.yyyy
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
    mul r0.xyz, TILE_LIGHT_COLOR.xyzz, r1.xxxx
    mov r0.w, c40.xxxx
    mul r7, c44, aColor
    mul r0, r0, r7
    mov outColor, r0
    end
    ret
.end

