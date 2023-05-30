/// player_state_balance()
// The player's balancing state.

// Trigger the balancing state on tile edges.
if (ground && x_speed == 0 && y_speed == 0 && angle == 0)
{
    if (state == STATE_DEFAULT || state == STATE_CROUCH || state == STATE_LOOKUP || state == STATE_BALANCE)
    {
        // Change animations.
        if (player_collision_check(COL_LEFT_EDGE, x, y, 8) && !player_collision_check(COL_RIGHT_EDGE, x, y, 350))
        {
            state = STATE_BALANCE;
            if (animation_direction == 1)
            {
                if (animation != "BALANCE_1")
                {
                    animation = "BALANCE_1";
                }
            }
            if (animation_direction == -1)
            {
                if (animation != "BALANCE_2")
                {
                    animation = "BALANCE_2";
                }
            }
        }
        else if (!player_collision_check(COL_LEFT_EDGE, x, y, 8) && player_collision_check(COL_RIGHT_EDGE, x, y, 350))
        {
            state = STATE_BALANCE;
            if (animation_direction == 1)
            {
                if (animation != "BALANCE_2")
                {
                    animation = "BALANCE_2";
                }
            }
            if (animation_direction == -1)
            {
                if (animation != "BALANCE_1")
                {
                    animation = "BALANCE_1";
                }
            }
        }
    }
}

// Stop wobbling.
if (x_speed != 0 || y_speed != 0)
{
    if (state == STATE_BALANCE)
    {
        state = STATE_DEFAULT;
    }
}
