/// player_handle_obstacles()
// Makes sure to keep the player's angle at zero when colliding with obstacles.
if (player_collision_check(COL_BOTTOM_OBJECT, MASK_MAIN, x, y, angle, par_obstacles))
{
    player_set_angle(0);
}
