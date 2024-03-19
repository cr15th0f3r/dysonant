package dysonant

Window  :: rawptr
Monitor :: rawptr

Monitor_Video_Mode :: struct
{
	width,
	height,
	red_bits,
	green_bits,
	blue_bits,
	refresh_rate: i32,
}

Gamma_Ramp :: struct
{
	red, green, blue: [^]u16,
	size: u32, 
}

@(private)
GLFW_Image :: struct
{
	width, height: i32,
	pixels: [^]u8,
}

Gamepad_State :: struct
{
	buttons: [15]u8,
	axes:    [6]f32,
}

@(private)
GLFW_Window_Iconify_Proc :: #type proc "c" (window: Window, iconified: i32)

@(private)
GLFW_Window_Refresh_Proc :: #type proc "c" (window: Window)

@(private)
GLFW_Window_Focus_Proc :: #type proc "c" (window: Window, focused: i32)

@(private)
GLFW_Window_Close_Proc :: #type proc "c" (window: Window)

@(private)
GLFW_Window_Size_Proc  :: #type proc "c" (window: Window, width, height: i32)

@(private)
GLFW_Window_Pos_Proc   :: #type proc "c" (window: Window, x, y: i32)

@(private)
GLFW_Window_Maximize_Proc :: #type proc "c" (window: Window, iconified: i32)

@(private)
GLFW_Window_Content_Scale_Proc :: #type proc "c" (window: Window, xscale, yscale: f32)

@(private)
GLFW_Framebuffer_Size_Proc :: #type proc "c" (window: Window, width, height: i32)

@(private)
GLFW_Drop_Proc :: #type proc "c" (window: Window, count: i32, paths: [^]cstring)

@(private)
GLFW_Monitor_Proc :: #type proc "c" (window: Window, event: i32)

@(private)
GLFW_Key_Proc :: #type proc "c" (window: Window, key: Keyboard_keys, scancode, action, mods: i32)

@(private)
GLFW_Mouse_Button_Proc :: #type proc "c" (window: Window, button, action, mods: i32)

@(private)
GLFW_Cursor_Pos_Proc :: #type proc "c" (window: Window, xpos,  ypos: f64)

@(private)
GLFW_Scroll_Proc :: #type proc "c" (window: Window, xoffset, yoffset: f64)

@(private)
GLFW_Char_Proc :: #type proc "c" (window: Window, codepoint: rune)

@(private)
GLFW_Char_Mods_Proc :: #type proc "c" (window: Window, codepoint: rune, mods: i32)

@(private)
GLFW_Cursor_Enter_Proc :: #type proc "c" (window: Window, entered: i32)

@(private)
GLFW_Joystick_Proc :: #type proc "c" (joy, event: i32)

@(private)
GLFW_Error_Proc :: #type proc "c" (error: i32, description: cstring)

when ODIN_OS == .Windows
{
	foreign import glfw {
        "glfw3_mt.lib",
        "system:user32.lib",
        "system:gdi32.lib",
        "system:shell32.lib",
	}
}

#assert(size_of(i32) == size_of(b32))

/*** Functions ***/
@(default_calling_convention="c", link_prefix="glfw")
foreign glfw
{
	@(link_name="glfwInit", private)
    glfw_init      :: proc() -> b32 ---

	@(link_name="glfwTerminate", private)
    glfw_terminate :: proc() ---

	@(link_name="glfwInitHint", private)
    glfw_init_hint  :: proc(hint, value: i32) ---

	@(link_name="glfwGetVersion", private)
    glfw_get_version :: proc(major, minor, rev: ^i32) ---

	@(link_name="glfwGetError", private)
    glfw_get_error   :: proc(description: ^cstring) -> i32 ---

	@(link_name="glfwGetPrimaryMonitor")
    monitor_primary :: proc() -> Monitor ---

	@(link_name="glfwGetMonitors", private)
    glfw_get_monitors            :: proc(count: ^i32) -> [^]Monitor ---

	@(link_name="glfwGetMonitorPos", private)
    glfw_get_monitor_pos          :: proc(monitor: Monitor, xpos, ypos: ^i32) ---

	@(link_name="glfwGetMonitorPhysicalSize", private)
    glfw_get_monitor_physical_size :: proc(monitor: Monitor, widthMM, heightMM: ^i32) ---

	@(link_name="glfwGetMonitorContentScale", private)
    glfw_get_monitor_content_scale :: proc(monitor: Monitor, xscale, yscale: ^f32) ---

	@(link_name="glfwSetMonitorUserPointer", private)
    glfw_set_monitor_user_pointer :: proc(monitor: Monitor, pointer: rawptr) ---

	@(link_name="glfwGetMonitorUserPointer", private)
    glfw_get_monitor_user_pointer :: proc(monitor: Monitor) -> rawptr ---

	@(link_name="glfwGetVideoMode")
    monitor_video_mode :: proc(monitor: Monitor) -> ^Monitor_Video_Mode ---

	@(link_name="glfwSetGamma", private)
    glfw_set_gamma     :: proc(monitor: Monitor, gamma: f32) ---

	@(link_name="glfwGetGammaRamp", private)
    glfw_get_gamma_ramp :: proc(monitor: Monitor) -> ^Gamma_Ramp ---

	@(link_name="glfwSetGammaRamp", private)
    glfw_set_gamma_ramp :: proc(monitor: Monitor, ramp: ^Gamma_Ramp) ---

	@(link_name="glfwCreateWindow", private)
    glfw_create_window  :: proc(width, height: i32, title: cstring, monitor: Monitor, share: Window) -> Window ---

	@(link_name="glfwDestroyWindow")
    glfw_destroy_window :: proc(window: Window) ---

	@(link_name="glfwWindowHint", private)
    glfw_window_hint         :: proc(hint, value: i32) ---

	@(link_name="glfwDefaultWindowHints", private)
    glfw_default_window_hints :: proc() ---

	@(link_name="glfwWindowHintString", private)
    glfw_window_hint_string   :: proc(hint: i32, value: cstring) ---

	@(link_name="glfwWindowShouldClose", private)
    glfw_window_should_close  :: proc(window: Window) -> b32 ---

	@(link_name="glfwSwapInterval", private)
    glfw_swap_interval :: proc(interval: i32) ---

	@(link_name="glfwSwapBuffers", private)
    glfw_swap_buffers  :: proc(window: Window) ---

	@(link_name="glfwSetWindowTitle", private)
    glfw_set_window_title       :: proc(window: Window, title: cstring) ---

	@(link_name="glfwSetWindowIcon", private)
    glfw_set_window_icon        :: proc(window: Window, count: i32, images: [^]GLFW_Image) ---

	@(link_name="glfwSetWindowPos", private)
    glfw_set_window_pos         :: proc(window: Window, xpos, ypos: i32) ---

	@(link_name="glfwSetWindowSizeLimits", private)
    glfw_set_window_size_limits  :: proc(window: Window, minwidth, minheight, maxwidth, maxheight: i32) ---

	@(link_name="glfwSetWindowAspectRatio", private)
    glfw_set_window_aspect_ratio :: proc(window: Window, numer, denom: i32) ---

	@(link_name="glfwSetWindowSize", private)
    glfw_set_window_size        :: proc(window: Window, width, height: i32) ---

	@(link_name="glfwGetWindowPos", private)
    glfw_get_window_pos         :: proc(window: Window, xpos, ypos: ^i32) ---

	@(link_name="glfwGetWindowSize", private)
    glfw_get_window_size        :: proc(window: Window, width, height: ^i32) ---

	@(link_name="glfwGetFramebufferSize", private)
    glfw_get_framebuffer_size   :: proc(window: Window, width, height: ^i32) ---

	@(link_name="glfwGetWindowFrameSize", private)
    glfw_get_window_frame_size   :: proc(window: Window, left, top, right, bottom: ^i32) ---

	@(link_name="glfwGetWindowContentScale", private)
    glfw_get_window_content_scale :: proc(window: Window, xscale, yscale: ^f32) ---

	@(link_name="glfwGetWindowOpacity", private)
    glfw_get_window_opacity      :: proc(window: Window) -> f32 ---

	@(link_name="glfwSetWindowOpacity", private)
    glfw_set_window_opacity      :: proc(window: Window, opacity: f32) ---

	@(link_name="glfwGetVersionString", private)
    glfw_get_version_string     :: proc() -> cstring ---

	@(link_name="glfwGetMonitorName")
    monitor_name       :: proc(monitor: Monitor) -> cstring ---

	@(link_name="glfwGetClipboardString", private)
    glfw_get_clipboard_string   :: proc(window: Window) -> cstring ---

	@(link_name="glfwGetVideoModes", private)
    glfw_get_video_modes        :: proc(monitor: Monitor, count: ^i32) -> [^]Monitor_Video_Mode ---

	@(link_name="glfwGetKey")
    glfw_get_key :: proc(window: Window, key: Keyboard_keys) -> b32 ---

	@(link_name="glfwGetKeyName", private)
    glfw_get_key_name           :: proc(key, scancode: i32) -> cstring ---

	@(link_name="glfwSetWindowShouldClose", private)
    glfw_set_window_should_close :: proc(window: Window, value: b32) ---

	@(link_name="glfwJoystickPresent", private)
    glfw_joystick_present      :: proc(joy: i32) -> b32 ---

	@(link_name="glfwGetJoystickName", private)
    glfw_get_joystick_name      :: proc(joy: i32) -> cstring ---

	@(link_name="glfwGetKeyScancode", private)
    glfw_get_key_scancode       :: proc(key: i32) -> i32 ---

	@(link_name="glfwIconifyWindow", private)
    glfw_iconify_window  :: proc(window: Window) ---

	@(link_name="glfwRestoreWindow", private)
    glfw_restore_window  :: proc(window: Window) ---

	@(link_name="glfwMaximizeWindow", private)
    glfw_maximize_window :: proc(window: Window) ---

	@(link_name="glfwShowWindow", private)
    glfw_show_window     :: proc(window: Window) ---

	@(link_name="glfwHideWindow", private)
    glfw_hide_window     :: proc(window: Window) ---

	@(link_name="glfwFocusWindow", private)
    glfw_focus_window    :: proc(window: Window) ---

	@(link_name="glfwRequestWindowAttention", private)
    glfw_request_window_attention :: proc(window: Window) ---

	@(link_name="glfwGetWindowMonitor", private)
    glfw_get_window_monitor     :: proc(window: Window) -> Monitor ---

	@(link_name="glfwSetWindowMonitor", private)
    glfw_set_window_monitor     :: proc(window: Window, monitor: Monitor, xpos, ypos, width, height, refresh_rate: i32) ---

	@(link_name="glfwGetWindowAttrib", private)
    glfw_get_window_attrib      :: proc(window: Window, attrib: i32) -> i32 ---

	@(link_name="glfwSetWindowUserPointer", private)
    glfw_set_window_user_pointer :: proc(window: Window, pointer: rawptr) ---

	@(link_name="glfwGetWindowUserPointer", private)
    glfw_get_window_user_pointer :: proc(window: Window) -> rawptr ---

	@(link_name="glfwSetWindowAttrib", private)
    glfw_set_window_attrib :: proc(window: Window, attrib, value: i32) ---

	@(link_name="glfwPollEvents", private)
    glfw_poll_events        :: proc() ---

	@(link_name="glfwWaitEvents", private)
    glfw_wait_events        :: proc() ---

	@(link_name="glfwWaitEventsTimeout", private)
    glfw_wait_events_timeout :: proc(timeout: f64) ---

	@(link_name="glfwPostEmptyEvent", private)
    glfw_post_empty_event    :: proc() ---

	@(link_name="glfwRawMouseMotionSupported", private)
    glfw_raw_mouse_motion_supported :: proc() -> b32 ---

	@(link_name="glfwGetInputMode", private)
    glfw_get_input_mode :: proc(window: Window, mode: i32) -> i32 ---

	@(link_name="glfwSetInputMode", private)
    glfw_set_input_mode :: proc(window: Window, mode, value: i32) ---

	@(link_name="glfwGetMouseButton", private)
    glfw_get_mouse_button :: proc(window: Window, button: i32) -> i32 ---

	@(link_name="glfwGetCursorPos", private)
    glfw_get_cursor_pos   :: proc(window: Window, xpos, ypos: ^f64) ---

	@(link_name="glfwSetCursorPos", private)
    glfw_set_cursor_pos   :: proc(window: Window, xpos, ypos: f64) ---

	@(link_name="glfwCreateCursor", private)
    glfw_create_cursor :: proc(image: ^GLFW_Image, xhot, yhot: i32) -> Cursor_Image ---

	@(link_name="glfwDestroyCursor")
    cursor_image_destroy :: proc(cursor: Cursor_Image) ---

	@(link_name="glfwSetCursor", private)
    glfw_set_cursor :: proc(window: Window, cursor: Cursor_Image) ---

	@(link_name="glfwCreateStandardCursor")
    cursor_image_create_standard :: proc(image: Standard_Cursor) -> Cursor_Image ---

	@(link_name="glfwGetJoystickAxes", private)
    glfw_get_joystick_axes        :: proc(joy: i32, count: ^i32) -> [^]f32 ---

	@(link_name="glfwGetJoystickButtons", private)
    glfw_get_joystick_buttons     :: proc(joy: i32, count: ^i32) -> [^]u8 ---

	@(link_name="glfwGetJoystickHats", private)
    glfw_get_joystick_hats        :: proc(jid: i32, count: ^i32) -> [^]u8 ---

	@(link_name="glfwGetJoystickGUID", private)
    glfw_get_joystick_guid        :: proc(jid: i32) -> cstring ---

	@(link_name="glfwSetJoystickUserPointer", private)
    glfw_set_joystick_user_pointer :: proc(jid: i32, pointer: rawptr) ---

	@(link_name="glfwGetJoystickUserPointer", private)
    glfw_get_joystick_user_pointer :: proc(jid: i32) -> rawptr ---

	@(link_name="glfwJoystickIsGamepad", private)
    glfw_joystick_is_gamepad      :: proc(jid: i32) -> b32 ---

	@(link_name="glfwUpdateGamepadMappings", private)
    glfw_update_gamepad_mappings  :: proc(str: cstring) -> i32 ---

	@(link_name="glfwGetGamepadName", private)
    glfw_get_gamepad_name         :: proc(jid: i32) -> cstring ---

	@(link_name="glfwGetGamepadState", private)
    glfw_get_gamepad_state        :: proc(jid: i32, state: ^Gamepad_State) -> i32 ---

	@(link_name="glfwSetClipboardString", private)
    glfw_set_clipboard_string :: proc(window: Window, str: cstring) ---

	@(link_name="glfwSetTime", private)
    glfw_set_time           :: proc(time: f64) ---

	@(link_name="glfwGetTime", private)
    glfw_get_time           :: proc() -> f64 ---

	@(link_name="glfwGetTimerValue", private)
    glfw_get_timer_value     :: proc() -> u64 ---

	@(link_name="glfwGetTimerFrequency", private)
    glfw_get_timer_frequency :: proc() -> u64 ---

	@(link_name="glfwMakeContextCurrent", private)
    glfw_make_context_current :: proc(window: Window) ---

	@(link_name="glfwGetCurrentContext", private)
    glfw_get_current_context  :: proc() -> Window ---

	@(link_name="glfwGetProcAddress", private)
    glfw_get_proc_address     :: proc(name: cstring) -> rawptr ---

	@(link_name="glfwExtensionSupported", private)
    glfw_extension_supported :: proc(extension: cstring) -> i32 ---

	@(link_name="glfwSetWindowIconifyCallback", private)
    glfw_set_window_iconify_callback :: proc(window: Window, cbfun: GLFW_Window_Iconify_Proc) -> GLFW_Window_Iconify_Proc ---

	@(link_name="glfwSetWindowRefreshCallback", private)
    glfw_set_window_refresh_callback :: proc(window: Window, cbfun: GLFW_Window_Refresh_Proc) -> GLFW_Window_Refresh_Proc ---

	@(link_name="glfwSetWindowFocusCallback", private)
    glfw_set_window_focus_callback :: proc(window: Window, cbfun: GLFW_Window_Focus_Proc) -> GLFW_Window_Focus_Proc ---

	@(link_name="glfwSetWindowCloseCallback", private)
    glfw_set_window_close_callback :: proc(window: Window, cbfun: GLFW_Window_Close_Proc) -> GLFW_Window_Close_Proc ---

	@(link_name="glfwSetWindowSizeCallback", private)
    glfw_set_window_size_callback :: proc(window: Window, cbfun: GLFW_Window_Size_Proc) -> GLFW_Window_Size_Proc ---

	@(link_name="glfwSetWindowPosCallback", private)
    glfw_set_window_pos_callback :: proc(window: Window, cbfun: GLFW_Window_Pos_Proc) -> GLFW_Window_Pos_Proc ---

	@(link_name="glfwSetFramebufferSizeCallback", private)
    glfw_set_framebuffer_size_callback :: proc(window: Window, cbfun: GLFW_Framebuffer_Size_Proc) -> GLFW_Framebuffer_Size_Proc ---

	@(link_name="glfwSetDropCallback", private)
    glfw_set_drop_callback :: proc(window: Window, cbfun: GLFW_Drop_Proc) -> GLFW_Drop_Proc ---

	@(link_name="glfwSetMonitorCallback", private)
    glfw_set_monitor_callback :: proc(window: Window, cbfun: GLFW_Monitor_Proc) -> GLFW_Monitor_Proc ---

	@(link_name="glfwSetWindowMaximizeCallback", private)
    glfw_set_window_maximize_callback     :: proc(window: Window, cbfun: GLFW_Window_Maximize_Proc) -> GLFW_Window_Maximize_Proc ---

	@(link_name="glfwSetWindowContentScaleCallback", private)
    glfw_set_window_content_scale_callback :: proc(window: Window, cbfun: GLFW_Window_Content_Scale_Proc) -> GLFW_Window_Content_Scale_Proc ---

	@(link_name="glfwSetKeyCallback", private)
    glfw_set_key_callback :: proc(window: Window, cbfun: GLFW_Key_Proc) -> GLFW_Key_Proc ---

	@(link_name="glfwSetMouseButtonCallback", private)
    glfw_set_mouse_button_callback :: proc(window: Window, cbfun: GLFW_Mouse_Button_Proc) -> GLFW_Mouse_Button_Proc ---

	@(link_name="glfwSetCursorPosCallback", private)
    glfw_set_cursor_pos_callback :: proc(window: Window, cbfun: GLFW_Cursor_Pos_Proc) -> GLFW_Cursor_Pos_Proc ---

	@(link_name="glfwSetScrollCallback", private)
    glfw_set_scroll_callback :: proc(window: Window, cbfun: GLFW_Scroll_Proc) -> GLFW_Scroll_Proc ---

	@(link_name="glfwSetCharCallback", private)
    glfw_set_char_callback :: proc(window: Window, cbfun: GLFW_Char_Proc) -> GLFW_Char_Proc ---

	@(link_name="glfwSetCharModsCallback", private)
    glfw_set_char_mods_callback :: proc(window: Window, cbfun: GLFW_Char_Mods_Proc) -> GLFW_Char_Mods_Proc ---

	@(link_name="glfwSetCursorEnterCallback", private)
    glfw_set_cursor_enter_callback :: proc(window: Window, cbfun: GLFW_Cursor_Enter_Proc) -> GLFW_Cursor_Enter_Proc ---

	@(link_name="glfwSetJoystickCallback", private)
    glfw_set_joystick_callback :: proc(cbfun: GLFW_Joystick_Proc) -> GLFW_Joystick_Proc ---

	@(link_name="glfwSetErrorCallback", private)
    glfw_set_error_callback :: proc(cbfun: GLFW_Error_Proc) -> GLFW_Error_Proc ---

}

/* Booleans */
TRUE  :: true
FALSE :: false

/* Button/Key states */
@(private)
GLFW_RELEASE :: 0

@(private)
GLFW_PRESS   :: 1

@(private)
GLFW_REPEAT  :: 2

/* Joystick hat states. */
HAT_CENTERED   :: 0
HAT_UP         :: 1
HAT_RIGHT      :: 2
HAT_DOWN       :: 4
HAT_LEFT       :: 8
HAT_RIGHT_UP   :: (HAT_RIGHT | HAT_UP)
HAT_RIGHT_DOWN :: (HAT_RIGHT | HAT_DOWN)
HAT_LEFT_UP    :: (HAT_LEFT  | HAT_UP)
HAT_LEFT_DOWN  :: (HAT_LEFT  | HAT_DOWN)

/* The unknown key */
KEY_UNKNOWN :: -1

/** Printable keys **/

Keyboard_keys :: enum i32
{
	/* Named printable keys */
	Space         = 32,
	Apostrophe    = 39,  /* ' */
	Comma         = 44,  /* , */
	Minus         = 45,  /* - */
	Period        = 46,  /* . */
	Slash         = 47,  /* / */
	Semicolon     = 59,  /* ; */
	Equal         = 61,  /* :: */
	Left_Bracket  = 91,  /* [ */
	Backslash     = 92,  /* \ */
	Right_Bracket = 93,  /* ] */
	Grave_Accent  = 96,  /* ` */
	World_1       = 161, /* non-US #1 */
	World_2       = 162, /* non-US #2 */

	/* Alphanumeric characters */
	Alpha_0 = 48,
	Alpha_1 = 49,
	Alpha_2 = 50,
	Alpha_3 = 51,
	Alpha_4 = 52,
	Alpha_5 = 53,
	Alpha_6 = 54,
	Alpha_7 = 55,
	Alpha_8 = 56,
	Alpha_9 = 57,

	A = 65,
	B = 66,
	C = 67,
	D = 68,
	E = 69,
	F = 70,
	G = 71,
	H = 72,
	I = 73,
	J = 74,
	K = 75,
	L = 76,
	M = 77,
	N = 78,
	O = 79,
	P = 80,
	Q = 81,
	R = 82,
	S = 83,
	T = 84,
	U = 85,
	V = 86,
	W = 87,
	X = 88,
	Y = 89,
	Z = 90,


	/** Function keys **/

	/* Named non-printable keys */
	Escape       = 256,
	Enter        = 257,
	Tab          = 258,
	Backspace    = 259,
	Insert       = 260,
	Delete       = 261,
	Right        = 262,
	Left         = 263,
	Down         = 264,
	Up           = 265,
	Page_Up      = 266,
	Page_Down    = 267,
	Home         = 268,
	End          = 269,
	Caps_Lock    = 280,
	Scroll_Lock  = 281,
	Num_Lock     = 282,
	Print_Screen = 283,
	Pause        = 284,

	/* Function keys */
	F1  = 290,
	F2  = 291,
	F3  = 292,
	F4  = 293,
	F5  = 294,
	F6  = 295,
	F7  = 296,
	F8  = 297,
	F9  = 298,
	F10 = 299,
	F11 = 300,
	F12 = 301,
	F13 = 302,
	F14 = 303,
	F15 = 304,
	F16 = 305,
	F17 = 306,
	F18 = 307,
	F19 = 308,
	F20 = 309,
	F21 = 310,
	F22 = 311,
	F23 = 312,
	F24 = 313,
	F25 = 314,

	/* Keypad numbers */
	Keypad_0 = 320,
	Keypad_1 = 321,
	Keypad_2 = 322,
	Keypad_3 = 323,
	Keypad_4 = 324,
	Keypad_5 = 325,
	Keypad_6 = 326,
	Keypad_7 = 327,
	Keypad_8 = 328,
	Keypad_9 = 329,

	/* Keypad named function keys */
	Keypad_Decimal  = 330,
	Keypad_Divide   = 331,
	Keypad_Multiply = 332,
	Keypad_Subtract = 333,
	Keypad_Add      = 334,
	Keypad_Enter    = 335,
	Keypad_Equal    = 336,

	/* Modifier keys */
	Left_Shift    = 340,
	Left_Control  = 341,
	Left_Alt      = 342,
	Left_Super    = 343,
	Right_Shift   = 344,
	Right_Control = 345,
	Right_Alt     = 346,
	Right_Super   = 347,
	Menu          = 348,
}

/* Bitmask for modifier keys */
MOD_SHIFT     :: 0x0001
MOD_CONTROL   :: 0x0002
MOD_ALT       :: 0x0004
MOD_SUPER     :: 0x0008
MOD_CAPS_LOCK :: 0x0010
MOD_NUM_LOCK  :: 0x0020

/* Mouse buttons */
MOUSE_BUTTON_1 :: 0
MOUSE_BUTTON_2 :: 1
MOUSE_BUTTON_3 :: 2
MOUSE_BUTTON_4 :: 3
MOUSE_BUTTON_5 :: 4
MOUSE_BUTTON_6 :: 5
MOUSE_BUTTON_7 :: 6
MOUSE_BUTTON_8 :: 7

/* Mousebutton aliases */
MOUSE_BUTTON_LAST   :: MOUSE_BUTTON_8
MOUSE_BUTTON_LEFT   :: MOUSE_BUTTON_1
MOUSE_BUTTON_RIGHT  :: MOUSE_BUTTON_2
MOUSE_BUTTON_MIDDLE :: MOUSE_BUTTON_3

/* Joystick buttons */
JOYSTICK_1  :: 0
JOYSTICK_2  :: 1
JOYSTICK_3  :: 2
JOYSTICK_4  :: 3
JOYSTICK_5  :: 4
JOYSTICK_6  :: 5
JOYSTICK_7  :: 6
JOYSTICK_8  :: 7
JOYSTICK_9  :: 8
JOYSTICK_10 :: 9
JOYSTICK_11 :: 10
JOYSTICK_12 :: 11
JOYSTICK_13 :: 12
JOYSTICK_14 :: 13
JOYSTICK_15 :: 14
JOYSTICK_16 :: 15

JOYSTICK_LAST :: JOYSTICK_16

/* Gamepad buttons */
GAMEPAD_BUTTON_A            :: 0
GAMEPAD_BUTTON_B            :: 1
GAMEPAD_BUTTON_X            :: 2
GAMEPAD_BUTTON_Y            :: 3
GAMEPAD_BUTTON_LEFT_BUMPER  :: 4
GAMEPAD_BUTTON_RIGHT_BUMPER :: 5
GAMEPAD_BUTTON_BACK         :: 6
GAMEPAD_BUTTON_START        :: 7
GAMEPAD_BUTTON_GUIDE        :: 8
GAMEPAD_BUTTON_LEFT_THUMB   :: 9
GAMEPAD_BUTTON_RIGHT_THUMB  :: 10
GAMEPAD_BUTTON_DPAD_UP      :: 11
GAMEPAD_BUTTON_DPAD_RIGHT   :: 12
GAMEPAD_BUTTON_DPAD_DOWN    :: 13
GAMEPAD_BUTTON_DPAD_LEFT    :: 14
GAMEPAD_BUTTON_LAST         :: GAMEPAD_BUTTON_DPAD_LEFT

GAMEPAD_BUTTON_CROSS    :: GAMEPAD_BUTTON_A
GAMEPAD_BUTTON_CIRCLE   :: GAMEPAD_BUTTON_B
GAMEPAD_BUTTON_SQUARE   :: GAMEPAD_BUTTON_X
GAMEPAD_BUTTON_TRIANGLE :: GAMEPAD_BUTTON_Y

/* Gamepad axes */
GAMEPAD_AXIS_LEFT_X        :: 0
GAMEPAD_AXIS_LEFT_Y        :: 1
GAMEPAD_AXIS_RIGHT_X       :: 2
GAMEPAD_AXIS_RIGHT_Y       :: 3
GAMEPAD_AXIS_LEFT_TRIGGER  :: 4
GAMEPAD_AXIS_RIGHT_TRIGGER :: 5
GAMEPAD_AXIS_LAST          :: GAMEPAD_AXIS_RIGHT_TRIGGER

/* Error constants */
GLFW_NO_ERROR            :: 0x00000000
GLFW_NOT_INITIALIZED     :: 0x00010001
GLFW_NO_CURRENT_CONTEXT  :: 0x00010002
GLFW_INVALID_ENUM        :: 0x00010003
GLFW_INVALID_VALUE       :: 0x00010004
GLFW_OUT_OF_MEMORY       :: 0x00010005
GLFW_API_UNAVAILABLE     :: 0x00010006
GLFW_VERSION_UNAVAILABLE :: 0x00010007
GLFW_PLATFORM_ERROR      :: 0x00010008
GLFW_FORMAT_UNAVAILABLE  :: 0x00010009
GLFW_NO_WINDOW_CONTEXT   :: 0x0001000A

/* Window attributes */
GLFW_FOCUSED                 :: 0x00020001
GLFW_ICONIFIED               :: 0x00020002
GLFW_RESIZABLE               :: 0x00020003
GLFW_VISIBLE                 :: 0x00020004
GLFW_DECORATED               :: 0x00020005
GLFW_AUTO_ICONIFY            :: 0x00020006
GLFW_FLOATING                :: 0x00020007
GLFW_MAXIMIZED               :: 0x00020008
GLFW_CENTER_CURSOR           :: 0x00020009
GLFW_TRANSPARENT_FRAMEBUFFER :: 0x0002000A
GLFW_HOVERED                 :: 0x0002000B
GLFW_FOCUS_ON_SHOW           :: 0x0002000C

/* Pixel window attributes */
@(private)
GLFW_RED_BITS         :: 0x00021001

@(private)
GLFW_GREEN_BITS       :: 0x00021002

@(private)
GLFW_BLUE_BITS        :: 0x00021003

@(private)
GLFW_ALPHA_BITS       :: 0x00021004

@(private)
GLFW_DEPTH_BITS       :: 0x00021005

@(private)
GLFW_STENCIL_BITS     :: 0x00021006

@(private)
GLFW_ACCUM_RED_BITS   :: 0x00021007

@(private)
GLFW_ACCUM_GREEN_BITS :: 0x00021008

@(private)
GLFW_ACCUM_BLUE_BITS  :: 0x00021009

@(private)
GLFW_ACCUM_ALPHA_BITS :: 0x0002100A

@(private)
GLFW_AUX_BUFFERS      :: 0x0002100B

@(private)
GLFW_STEREO           :: 0x0002100C

@(private)
GLFW_SAMPLES          :: 0x0002100D

@(private)
GLFW_SRGB_CAPABLE     :: 0x0002100E

@(private)
GLFW_REFRESH_RATE     :: 0x0002100F

@(private)
GLFW_DOUBLEBUFFER     :: 0x00021010

/* Context window attributes */
@(private)
GLFW_CLIENT_API               :: 0x00022001

@(private)
GLFW_CONTEXT_VERSION_MAJOR    :: 0x00022002

@(private)
GLFW_CONTEXT_VERSION_MINOR    :: 0x00022003

@(private)
GLFW_CONTEXT_REVISION         :: 0x00022004

@(private)
GLFW_CONTEXT_ROBUSTNESS       :: 0x00022005

@(private)
GLFW_OPENGL_FORWARD_COMPAT    :: 0x00022006

@(private)
GLFW_OPENGL_DEBUG_CONTEXT     :: 0x00022007

@(private)
GLFW_OPENGL_PROFILE           :: 0x00022008

@(private)
GLFW_CONTEXT_RELEASE_BEHAVIOR :: 0x00022009

@(private)
GLFW_CONTEXT_NO_ERROR         :: 0x0002200A

@(private)
GLFW_CONTEXT_CREATION_API     :: 0x0002200B

@(private)
GLFW_SCALE_TO_MONITOR         :: 0x0002200C

/* Cross platform attributes */
@(private)
GLFW_COCOA_RETINA_FRAMEBUFFER :: 0x00023001

@(private)
GLFW_COCOA_FRAME_NAME         :: 0x00023002

@(private)
GLFW_COCOA_GRAPHICS_SWITCHING :: 0x00023003

@(private)
GLFW_X11_CLASS_NAME           :: 0x00024001

@(private)
GLFW_X11_INSTANCE_NAME        :: 0x00024002

/* APIs */
@(private)
GLFW_NO_API        :: 0

@(private)
GLFW_OPENGL_API    :: 0x00030001

@(private)
GLFW_OPENGL_ES_API :: 0x00030002

/* Robustness? */
NO_ROBUSTNESS         :: 0
NO_RESET_NOTIFICATION :: 0x00031001
LOSE_CONTEXT_ON_RESET :: 0x00031002

/* OpenGL Profiles */
@(private)
GLFW_OPENGL_ANY_PROFILE    :: 0

@(private)
GLFW_OPENGL_CORE_PROFILE   :: 0x00032001

@(private)
GLFW_OPENGL_COMPAT_PROFILE :: 0x00032002

/* Cursor draw state and whether keys are sticky */
@(private)
GLFW_CURSOR               :: 0x00033001

@(private)
GLFW_STICKY_KEYS          :: 0x00033002

@(private)
GLFW_STICKY_MOUSE_BUTTONS :: 0x00033003

@(private)
GLFW_LOCK_KEY_MODS        :: 0x00033004

/* Cursor draw state */
@(private)
GLFW_CURSOR_NORMAL   :: 0x00034001

@(private)
GLFW_CURSOR_HIDDEN   :: 0x00034002

@(private)
GLFW_CURSOR_DISABLED :: 0x00034003


/* Mouse motion */
RAW_MOUSE_MOTION :: 0x00033005

/* Behavior? */
ANY_RELEASE_BEHAVIOR   :: 0
RELEASE_BEHAVIOR_FLUSH :: 0x00035001
RELEASE_BEHAVIOR_NONE  :: 0x00035002

/* Context API ? */
NATIVE_CONTEXT_API :: 0x00036001
EGL_CONTEXT_API    :: 0x00036002
OSMESA_CONTEXT_API :: 0x00036003

/* Types of cursors */
Standard_Cursor :: enum i32
{
	Arrow_Cursor = 0x00036001,
	Ibeam_Cursor = 0x00036002,
	Crosshair_Cursor = 0x00036003,
	Hand_Cursor = 0x00036004,
	Horizontal_Resize_Cursor = 0x00036005,
	Vertical_Resize_Cursor = 0x00036006,
	// Resize_NWSE_Cursor = 0x00036007,
	// Resize_NESW_Cursor = 0x00036008,
}

/* Joystick? */
CONNECTED    :: 0x00040001
DISCONNECTED :: 0x00040002

/*  macOS specific init hint. */
@(private)
JOYSTICK_HAT_BUTTONS  :: 0x00050001

@(private)
COCOA_CHDIR_RESOURCES :: 0x00051001

@(private)
COCOA_MENUBAR         :: 0x00051002

/*  */
@(private)
DONT_CARE :: -1