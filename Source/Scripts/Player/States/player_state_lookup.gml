/// player_state_lookup()
// The player's looking up state.

// Look up when the character is quiet on the ground:
if (ground && x_speed == 0 && y_speed == 0 && state == STATE_DEFAULT && allow_look && input_up && state != STATE_BALANCE)
{
    state                  = STATE_LOOKUP;
    animation_frames_count = 0;
    timer_up               = 0;
    x_speed                = 0;
}

// Check if looking up:
if (state == STATE_LOOKUP)
{
    // Increase camera timer.
    timer_up += 1;

    // Stop horizontal speed.
    x_speed = 0;

    // Stop looking up:
    if (ground && !input_up)
    {
        state                  = STATE_DEFAULT;
        timer_up               = 0;
        animation_frames_count = 0;
    }
}
