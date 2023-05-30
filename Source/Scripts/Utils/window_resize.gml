/// window_resize()
// Sets the window resolution.
if (global.screen_scale != 4)
{
    if (window_get_fullscreen())
    {
        window_set_fullscreen(false);
    }
    window_set_size(global.screen_width * global.screen_scale, global.screen_height * global.screen_scale);
}
else
{
    if (!window_get_fullscreen())
    {
        window_set_fullscreen(true);
    }
    window_set_size(global.screen_width, global.screen_height);
}

// Center window.
with (obj_screen_controller)
{
    alarm[0] = 1;
}
