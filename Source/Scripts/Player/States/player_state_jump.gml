/// player_state_jump()
// The player's jumping state.

// Variable jump:
if (!input_action && y_speed < jump_release && state == STATE_JUMP && !jump_completed)
{
    y_speed = jump_release;
}

// Full jump:
if ((ground || state == STATE_CORKSCREW || state == STATE_CORKSCREW_ROLL) && !player_collision_check(COL_TOP, MASK_BIG, x, y - 6, angle) && input_action_pressed)
{
    if (state != STATE_CROUCH && state != STATE_SPINDASH && state != STATE_PEELOUT && !tunnel_lock)
    {
        // Set horizontal and vertical speed.
        x_speed =  (dcos(angle_relative) * g_speed) - (dsin(angle_relative) * -jump_strength);
        y_speed = -(dsin(angle_relative) * g_speed) - (dcos(angle_relative) * -jump_strength);

        // Jump lock (currently disabled):
        // jump_lock = (state == STATE_ROLL);

        // Change flags:
        ground        = false;
        state         = STATE_JUMP;
        shield_usable = true;
        player_set_angle(0);

        // Play sound effect:
        audio_play_sound(SFX._player_jump, global.sfx_volume, 1, 0, 0);

        // Sprite rendering speed:
        animation_rendering_speed = (1 / max(5 - abs(x_speed), 1));
    }
}

// Complete jump:
if (y_speed > 0)
{
    if (!jump_completed)
    {
        jump_completed = true;
    }
}

// Disable flags.
if (ground || state == STATE_GRAB)
{
    jump_completed          = false;
    jump_lock               = false;
    shield_usable           = false;
    global.player_score_mtp = 0;
}
