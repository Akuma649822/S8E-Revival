/// player_handle_corkscrews()
// Script to handle corkscrew movement from STH2.

// Find corkscrew:
var cork_handle;
cork_handle = player_collision_check(COL_MAIN_OBJECT, x, y, par_corkscrew);

if (state == STATE_CORKSCREW || state == STATE_CORKSCREW_ROLL)
{
    // Perform Corkscrew move:
    if (abs(x_speed) >= 4 && cork_handle != noone)
    {
        // Set relative position and angle.
        var relativeX, corkAngle;
        relativeX = x - cork_handle.x;
        corkAngle = degtorad((relativeX / 384) * 360);

        // Set y possition according to the relative position.
        y = cork_handle.y + 26 + (1 + cos(corkAngle)) * 75 * 0.5;

        // Change animation frame.
        if (state == STATE_CORKSCREW)
        {
            animation       = "CORKSCREW";
            animation_frame = abs((radtodeg(corkAngle) / 360 * 11) mod 12);
        }

        // Set ground flag.
        ground = true;
    }
    else
    {
        // Revert back to normal state.
        if (state == STATE_CORKSCREW)
        {
            state = STATE_DEFAULT;
        }
        if (state == STATE_CORKSCREW_ROLL)
        {
            state     = STATE_ROLL;
            animation = "WALK";
        }
    }
}
else
{
    // Trigger corkscrew state.
    if (abs(x_speed) >= 4 && ground)
    {
        if (cork_handle != noone)
        {
            if (state != STATE_ROLL)
            {
                state = STATE_CORKSCREW;
            }
            else
            {
                state = STATE_CORKSCREW_ROLL;
            }
            ground = false;
            player_set_angle(0);
        }
    }
}

// Cork animation.
if (animation == "CORKSCREW")
{
    animation_frame += 0.05;
}
