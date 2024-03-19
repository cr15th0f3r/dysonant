package dysonant

import "core:image"

Cursor_Image  :: rawptr

cursor_is_visible :: #force_inline proc "contextless" () -> bool
{
    return glfw_get_input_mode(window, GLFW_CURSOR) != GLFW_CURSOR_HIDDEN
}

cursor_setup_visibility :: #force_inline proc "contextless" (visible: bool)
{
    glfw_set_input_mode(window, GLFW_CURSOR, visible ? GLFW_CURSOR_NORMAL : GLFW_CURSOR_HIDDEN)
}

cursor_setup_image :: #force_inline proc "contextless" (img: Cursor_Image)
{
    glfw_set_cursor(window, img)
}

cursor_image_create :: proc(img: ^image.Image) -> Cursor_Image
{
    glfw_image: GLFW_Image
    glfw_image.width = cast(i32)img.width
    glfw_image.height = cast(i32)img.height
    glfw_image.pixels = raw_data(img.pixels.buf)
    return glfw_create_cursor(&glfw_image, 0, 0)
}