package dysonant

import "core:strings"

window: Window = nil

window_create :: proc(width, height: i32, title: string, monitor: Monitor = nil) -> (success: bool)
{
    title_cstring, _ := strings.clone_to_cstring(title, context.temp_allocator)
    if title_cstring == nil do return

    when USE_GL
    {
        glfw_window_hint(GLFW_CLIENT_API, GLFW_OPENGL_API)
        glfw_window_hint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfw_window_hint(GLFW_CONTEXT_VERSION_MAJOR, 3)
        glfw_window_hint(GLFW_CONTEXT_VERSION_MINOR, 3)
        glfw_window_hint(GLFW_DOUBLEBUFFER, 1)
        glfw_window_hint(GLFW_OPENGL_DEBUG_CONTEXT, ODIN_DEBUG ? 1 : 0)
    }

    window = glfw_create_window(width, height, title_cstring, monitor, nil)
    if window == nil do return
    defer if !success do glfw_destroy_window(window)

    glfw_make_context_current(window)

    glfw_set_window_size_callback(window, window_did_resize_callback)
    glfw_set_window_pos_callback(window, window_did_move_callback)
    //glfw_set_key_callback(window, keyboard_callback)

    sg_desc: Sokol_GFX_Desc
    sg_setup(&sg_desc)
    return sg_isvalid()
}

window_destroy :: proc()
{
    sg_shutdown()
    glfw_destroy_window(window)
    window = nil
}

window_update :: proc() -> (loop: bool)
{
    time_update()
    _window_did_resize = false
    _window_did_move = false
    loop = !cast(bool)glfw_window_should_close(window)
    glfw_poll_events()
    keyboard_update()
    return
}

window_get_position :: #force_inline proc "contextless" () -> (position: IVector2)
{
    glfw_get_window_pos(window, &position.x, &position.y)
    return
}

window_get_size :: #force_inline proc "contextless" () -> (size: IVector2)
{
    glfw_get_window_size(window, &size.x, &size.y)
    return
}

window_swapchain_size :: proc() -> (size: IVector2)
{
    glfw_get_framebuffer_size(window, &size.x, &size.y)
    return
}

window_is_resizable :: proc() -> bool
{
    return glfw_get_window_attrib(window, GLFW_RESIZABLE) == 1
}

window_setup_resizable :: proc(resizable: bool)
{
    glfw_set_window_attrib(window, GLFW_RESIZABLE, resizable ? 1 : 0)
}

window_is_borderless :: proc() -> bool
{
    return glfw_get_window_attrib(window, GLFW_DECORATED) == 0
}

window_setup_borderless :: proc(borderless: bool)
{
    glfw_set_window_attrib(window, GLFW_DECORATED, borderless ? 0 : 1)
}


monitor_list :: proc() -> []Monitor
{
    count: i32
    monitors := glfw_get_monitors(&count)
    return monitors[:count]
}

monitor_position :: proc(monitor: Monitor) -> (position: IVector2)
{
    glfw_get_monitor_pos(monitor, &position.x, &position.y)
    return
}

graphics_present :: proc()
{
    glfw_swap_buffers(window)
}

graphics_get_swapchain :: proc() -> Swapchain
{
    _swapchain_: Swapchain
    glfw_get_framebuffer_size(window, &_swapchain_.width, &_swapchain_.height)

    when USE_GL
    {
        _swapchain_.color_format = .RGBA8
        _swapchain_.depth_format = .Depth_Stencil
        _swapchain_.sample_count = 1
    }

    return _swapchain_
}

window_set_title :: proc(new_title: string)
{
    title_cstring, _ := strings.clone_to_cstring(new_title, context.temp_allocator)
    if title_cstring == nil do return
    glfw_set_window_title(window, title_cstring)
}

@(private)
_window_did_resize: bool

@(private)
window_did_resize_callback :: proc "c" (window: Window, new_width, new_height: i32)
{
    _window_did_resize = true
}

window_did_resize :: #force_inline proc "contextless" () -> bool
{
    return _window_did_resize
}

@(private)
_window_did_move: bool

@(private)
window_did_move_callback :: proc "c" (window: Window, new_x, new_y: i32)
{
    _window_did_move = true
}

window_did_move :: #force_inline proc "contextless" () -> bool
{
    return _window_did_move
}

@(private)
_vsync: bool

vsync_is_enabled :: proc() -> bool
{
    return _vsync
}

vsync_setup :: proc(vsync: bool)
{
    _vsync = vsync
    glfw_swap_interval(vsync ? 1 : 0)
}