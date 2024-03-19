package dysonant

import "core:time"

load :: proc() -> bool
{
    last_frame_time = time.now()
    return cast(bool)glfw_init()
}

unload :: proc()
{
    glfw_terminate()
}

// // when USE_GL
// // {
// //     // glfw.InitHint(glfw.CLIENT_API, glfw.OPENGL_API)
// //     // glfw.InitHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE)
// //     // glfw.InitHint(glfw.VERSION_MAJOR, 3)
// //     // glfw.InitHint(glfw.VERSION_MINOR, 3)
// //     // glfw.InitHint(glfw.OPENGL_DEBUG_CONTEXT, ODIN_DEBUG ? 1 : 0)
// // }