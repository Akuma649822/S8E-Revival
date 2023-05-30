/// player_state_fly()
// Script to handle Tails' flying.

// While flying...
if (state == STATE_FLY)
{
    // Set/Get fly timer:
    tails_flight_timer = min(tails_flight_timer + 1, tails_flight_duration);

    // Drop if we flew too long:
    if (tails_flight_timer == tails_flight_duration)
    {
        state = STATE_FLYDROP;
        if (y_speed == 0 || y_speed < 0)
        {
            y_speed = 0.03125;
        }
        y_acceleration = 0.03125;
    }

    // Gain height:
    if (state != STATE_FLYDROP)
    {
        if (input_action_pressed && y_speed > -1)
        {
            y_acceleration = -0.125;
        }
        else if (y_speed < -1)
        {
            y_acceleration = 0.03125;
        }
    }

    // Prevent getting stuck inside terrain.
    if (player_collision_check(COL_TOP, MASK_MAIN, x, y, angle) && y_speed == 0)
    {
        y_acceleration = 0.03125;
    }
}

// Trigger fly:
if (state == STATE_JUMP && input_action_pressed && shield_usable)
{
    state              = STATE_FLY;
    angle              = 0;
    animation_angle    = 0;
    tails_tail_angle   = 0;
    tails_flight_timer = 0;
    y_acceleration     = 0.03125;
}

// Sound effects.
if (state == STATE_FLY)
{
    if (physic_mode == 0)
    {
        if (!audio_is_playing(SFX._player_flying))
        {
            audio_play_sound(SFX._player_flying, global.sfx_volume, 1, 1, 1);
        }
    }
    else
    {
        if (audio_is_playing(SFX._player_flying))
        {
            audio_stop(SFX._player_flying);
        }
    }
}

if (state == STATE_FLYDROP)
{
    if (physic_mode == 0)
    {
        if (!audio_is_playing(SFX._player_flying_drop))
        {
            audio_play_sound(SFX._player_flying_drop, global.sfx_volume, 1, 1, 1);
        }
    }
    else
    {
        if (audio_is_playing(SFX._player_flying_drop))
        {
            audio_stop(SFX._player_flying_drop);
        }
    }
}

if (state != STATE_FLY)
{
    if (audio_is_playing(SFX._player_flying))
    {
        audio_stop(SFX._player_flying);
    }
}

if (state != STATE_FLYDROP)
{
    if (audio_is_playing(SFX._player_flying_drop))
    {
        audio_stop(SFX._player_flying_drop);
    }
}
