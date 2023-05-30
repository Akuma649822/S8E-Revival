/// player_handle_platforms()
// Script to handle moving terrain.

// Get platform IDs:
platform_id = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_moving_platform);
swing_id    = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_swing);

// Handle collapsing terrain:
var collapse_id;
collapse_id = instance_nearest(x, y, par_collision_collapse);
if (player_collision_check(COL_BOTTOM_OBJECT, MASK_THINBLOCK, x, y - y_speed, angle, collapse_id))
{
    if (collapse_id.alarm[0] == -1)
    {
        collapse_id.alarm[0] = 45;
    }
}
