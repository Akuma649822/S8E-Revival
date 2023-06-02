/// player_state_skid()
// The player's skidding state.

// When the input is locked, disable skidding:
if (input_lock_l || input_lock_r)
{
    if (state == STATE_SKID) state = STATE_DEFAULT;
    exit;
}

// Trigger skidding:
if (ground && !input_lock_s && state == STATE_DEFAULT && input_alarm <= 0)
{
    if (angle_relative < 45 || angle_relative > 315)
    {
        if (((x_speed <= -4.5 && input_right) || (x_speed >= 4.5 && input_left)) && sign(x_speed) == animation_direction)
        {
            if (state != STATE_SKID)
            {
                state          = STATE_SKID;
                skid_direction = sign(x_speed);
                animation      = "SKID";
                audio_play_sound(SFX._player_skidding, global.sfx_volume, 1, 0, 1);
            }
        }
    }
}

// While skidding, check some stuff:
if (state == STATE_SKID)
{
    // Return to the default state:
    if (animation == "SKID_TURN" && animation_flags_finished)
    {
        if (!input_left && !input_right)
        {
            state       = STATE_DEFAULT;
            input_alarm = 10;
        }
    }
    if (skid_direction == 1)
    {
        if (input_left)
        {
            if (x_speed > 0)
            {
                x_speed -= x_acceleration * 6;
                if (animation_frame_count mod 5 == 0)
                {
                    instance_create(x, y + 13, obj_skid_dust);
                }
            }
            else
            {
                x_speed             = 0;
                animation_direction = -skid_direction;
                state               = STATE_DEFAULT;
            }
        }
        else if (input_right)
        {
            state       = STATE_DEFAULT;
            input_alarm = 10;
        }
    }
    if (skid_direction == -1)
    {
        if (input_right)
        {
            if (x_speed < 0)
            {
                x_speed += x_acceleration * 6;
                if (animation_frame_count mod 5 == 0)
                {
                    instance_create(x, y + 13, obj_skid_dust);
                }
            }
            else
            {
                x_speed             = 0;
                animation_direction = skid_direction;
                state               = STATE_DEFAULT;
            }
        }
        else if (input_left)
        {
            state       = STATE_DEFAULT;
            input_alarm = 10;
        }
    }

    if (!ground)
    {
        state = STATE_DEFAULT;
        
        // Change to the running animation.
        if (animation == "SKID" || animation == "SKID_TURN")
        {
            animation = "RUN";
        }
    }
}
