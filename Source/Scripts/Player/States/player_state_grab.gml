/// player_state_grab()
// The player's state when grabbing on certain poles.
if (state == STATE_GRAB)
{
    // Animation & Movement:
    if (grab_type == GRAB_STATIC)
    {
        x_speed   = 0;
        animation = "GRAB";
    }
    if (grab_type == GRAB_POLE)
    {
        if (input_right && place_meeting(x + sprite_width / 2, y, par_grab))
        {
            x        += 0.5;
            animation = "GRAB_SHIMMY";
        }
        else if (input_left && place_meeting(x - sprite_width / 2, y, par_grab))
        {
            x        -= 0.5;
            animation = "GRAB_SHIMMY";
        }
        else
        {
            animation       = "GRAB_SHIMMY";
            animation_frame = 0;
        }
    }
    if (grab_type == GRAB_DISTANCE)
    {
        if (grab_moving == 0)
        {
            if (input_right && place_meeting(x + grab_distance, y, par_grab))
            {
                with (par_grab)
                {
                    if (place_meeting(x - other.grab_distance, y, other))
                    {
                        if (type == GRAB_DISTANCE)
                        {
                            other.grab_moving = 1;
                        }
                    }
                }
            }
            if (input_left && place_meeting(x - grab_distance, y, par_grab))
            {
                with (par_grab)
                {
                    if (place_meeting(x + other.grab_distance, y, other))
                    {
                        if (type == GRAB_DISTANCE)
                        {
                            other.grab_moving = -1;
                        }
                    }
                }
            }
        }
        else
        {
            if (x < grab_x + grab_distance && grab_moving == 1)
            {
                animation_direction = 1;
                animation           = "GRAB_MOVE";
                x                  += 1.2;
            }
            else if (x > grab_x - grab_distance && grab_moving == -1)
            {
                animation_direction = -1;
                animation           = "GRAB_MOVE";
                x                  -= 1.2;
            }
            else
            {
                grab_moving = 0;
                grab_x      = x;
                if (!place_meeting(x + grab_distance, y, par_grab) || !place_meeting(x - grab_distance, y, par_grab))
                {
                    animation = "GRAB";
                }
                if (!input_left && !input_right)
                {
                    animation = "GRAB";
                }
                with (par_grab)
                {
                    if (place_meeting(x, y, other))
                    {
                        other.x = x;
                    }
                }
            }
        }
    }

    // Disable vertical speed.
    y_speed = 0;

    // Fix y position:
    if (grab_y != 0)
    {
        y = grab_y;
    }

    // Jump:
    if (input_action_pressed)
    {
        state          = STATE_JUMP;
        grab_timer     = 6;
        jump_completed = false;
        y_speed        = jump_strength;
        shield_usable  = true;
        audio_play_sound(SFX._player_jump, global.sfx_volume, 1, 0, 0);
    }
}

// Reduce grab timer.
if (grab_timer > 0)
{
    grab_timer -= 1;
}

// Make sure the moving variable is being set to false.
if (state != STATE_GRAB)
{
    grab_moving = 0;
}
