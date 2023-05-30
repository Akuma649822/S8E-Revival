/// player_handle_grabs()
// Used for grabbable objects.

// Check if jumping:
if (grab_timer == 0 && (state == STATE_JUMP || state == STATE_SPRING || state == STATE_FLY || state == STATE_GLIDE))
{
    // Check if colliding with grab object.
    if (collision_rectangle(x - 4, y - 2, x + 4, y + 2, par_grab, false, true))
    {
        // Change variables.
        x_speed   = 0;
        y_speed   = 0;
        state     = STATE_GRAB;
        animation = "GRAB";
        audio_play_sound(SFX._player_hang, global.sfx_volume, 1, 0, 0);
        with (par_grab)
        {
            if (place_meeting(x, y, other))
            {
                other.grab_y        = bbox_top + bbox;
                other.grab_id       = id;
                other.grab_type     = type;
                other.grab_distance = distance;
                other.grab_x        = x;

                if (type == GRAB_POLE)
                {
                    if (left)
                    {
                        if (other.x < x)
                        {
                            other.x = bbox_left + 5;
                        }
                    }
                    if (right)
                    {
                        if (other.x > x)
                        {
                            other.x = bbox_right - 5;
                        }
                    }
                    if (middle)
                    {
                        if (other.x > x + 4)
                        {
                            other.x = bbox_right - 5;
                        }
                        if (other.x < x - 4)
                        {
                            other.x = bbox_left + 5
                        }
                    }
                }
                else
                {
                    other.x = x;
                }
            }
        }
    }
}
