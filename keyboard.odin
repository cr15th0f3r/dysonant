package dysonant

KEYBOARD_KEYS_COUNT :: cast(int)max(Keyboard_keys) + 1

@(private)
_keyboard_keys: [KEYBOARD_KEYS_COUNT]i8

keyboard_update :: proc()
{
    for key in Keyboard_keys
    {
        if glfw_get_key(window, key)
        {
            switch _keyboard_keys[key]
            {
                case -1: _keyboard_keys[key] = 1
                case 0: _keyboard_keys[key] = 1
                case 1: _keyboard_keys[key] = 2
                //case 2:
            }
        }
        else
        {
            switch _keyboard_keys[key]
            {
                case -1: _keyboard_keys[key] = 0
                //case 0:
                case 1: _keyboard_keys[key] = -1
                case 2: _keyboard_keys[key] = -1

            }
        }
    }
}

keyboard_pressing_key :: #force_inline proc "contextless" (key: Keyboard_keys) -> bool
{
    return _keyboard_keys[key] > 0
}

keyboard_pressed_key :: #force_inline proc "contextless" (key: Keyboard_keys) -> bool
{
    return _keyboard_keys[key] == 1
}

keyboard_released_key :: #force_inline proc "contextless" (key: Keyboard_keys) -> bool
{
    return _keyboard_keys[key] == -1
}