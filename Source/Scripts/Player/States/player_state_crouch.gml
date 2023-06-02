/// player_state_crouch()
// The player's crouching state.

// Crouch down when the character is quiet on the ground:
if (ground && x_speed == 0 && y_speed == 0 && (state == STATE_DEFAULT || state == STATE_GLIDE_DROP) && allow_look && input_down)
{
    state                  = STATE_CROUCH;
    animation_frames_count = 0;
    timer_down             = 0;
    x_speed                = 0;
}

// Check if crouching:
if (state == STATE_CROUCH)
{
    // Increase camera timer.
    timer_down += 1;

    // Reset state:
    if (x_speed != 0)
    {
        x_speed = 0;
        state   = STATE_DEFAULT;
    }

    if (y_speed != 0)
    {
        state = STATE_DEFAULT;
    }

    // Stop crouching:
    if (ground && !input_down)
    {
        state                  = STATE_DEFAULT;
        timer_down             = 0;
        animation_frames_count = 0;
    }
}
