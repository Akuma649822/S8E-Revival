/// player_handle_spikes()
// Used to handle collision with spikes.

// Top:
var spike_top;
spike_top = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, 0, obj_spike_top);
if (spike_top != noone && ground)
{
    if (state != STATE_HURT && invincibility == 0 && invincibility_timer <= 0)
    {
        player_state_hurt(spike_top, true);
    }
}

// Bottom:
var spike_bottom;
spike_bottom = player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, 0, obj_spike_bottom);
if (spike_bottom != noone)
{
    if (state != STATE_HURT && invincibility == 0 && invincibility_timer <= 0)
    {
        player_state_hurt(spike_bottom, true);
    }
}

// Left:
var spike_left;
spike_left = player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, 0, obj_spike_left);
if (spike_left != noone)
{
    if (state != STATE_HURT && invincibility == 0 && invincibility_timer <= 0)
    {
        player_state_hurt(spike_left, true);
    }
}

// Right:
var spike_right;
spike_right = player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, 0, obj_spike_right);
if (spike_right != noone)
{
    if (state != STATE_HURT && invincibility == 0 && invincibility_timer <= 0)
    {
        player_state_hurt(spike_right, true);
    }
}

// GHZ Log:
var spike_log;
spike_log = player_collision_check(COL_MAIN_OBJECT, x, y, obj_spike_log_harm);
if (spike_log != noone)
{
    if (state != STATE_HURT && invincibility == 0 && invincibility_timer <= 0)
    {
        player_state_hurt(spike_log, true);
    }
}
