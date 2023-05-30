/// player_state_respawn(trigger_flag)
// Used for AI players to respawn.

// Trigger respawn.
if (argument0 == 1)
{
    state               = STATE_RESPAWN;
    angle               = 0;
    animation_angle     = 0;
    tails_tail_angle    = 0;
    invincibility       = 1;
    invincibility_timer = -1;
    animation_frame     = 0;
    tunnel_lock         = false;
}

// Don't run if not respawning.
if (state != STATE_RESPAWN) exit;

// Reposition.
if (state == STATE_RESPAWN)
{
    if (x < view_xview - 96)
    {
        x = view_xview - 50;
        y = view_yview - 50;
        player_state_respawn(1);
    }
    else if (x > view_xview + view_wview + 96)
    {
        x = view_xview + view_wview + 50;
        y = view_yview - 50;
        player_state_respawn(1);
    }
}

// Respawn (Sonic):
if (instance_exists(obj_player) && player_index == CHAR_SONIC)
{
    if (!obj_player.tunnel_lock)
    {
        x       = obj_player.x;
        y       = obj_player.y;
        x_speed = obj_player.x_speed;
        y_speed = obj_player.y_speed;
        angle   = obj_player.angle;
        state   = obj_player.state;
        depth   = obj_player.depth + 1;
        
        if (player_index == CHAR_SONIC && (obj_player.state == STATE_FLY || obj_player.state == STATE_FLYDROP))
        {
            state = STATE_ROLL;
        }
    }
}

// Respawn (Tails/Knuckles):
if (instance_exists(obj_player) && (player_index == CHAR_TAILS || player_index == CHAR_KNUCKLES))
{
    // Move towards player.
    var _dir;
    _dir  = point_direction(x, y, obj_player.x, obj_player.y);
    x    += lengthdir_x(3, _dir);
    y    += lengthdir_y(3, _dir);

    // Disable movement flags.
    x_allow     = false;
    y_allow     = false;
    tunnel_lock = false;

    // Reset speeds.
    x_speed = 0;
    y_speed = 0;

    // Finish respawn.
    if (obj_player.ground && !obj_player.tunnel_lock)
    {
        if (distance_to_object(obj_player) <= 0.5 && place_free(x, y) && in_view())
        {
            if (player_index == CHAR_TAILS)
            {
                state = STATE_ROLL;
            }
            else
            {
                state = STATE_GLIDE_DROP;
            }
            
            depth       = obj_player.depth + 1;
            x_allow     = true;
            y_allow     = true;
            tunnel_lock = false;
        }
    }
    else if (!obj_player.ground)
    {
        if (instance_place(x, y, obj_player) && in_view())
        {
            if (player_index == CHAR_TAILS)
            {
                state = STATE_ROLL;
            }
            else
            {
                state = STATE_GLIDE_DROP;
            }
            
            depth       = obj_player.depth + 1;
            x_allow     = true;
            y_allow     = true;
            tunnel_lock = false;
        }
    }
    else
    {
        state = STATE_RESPAWN;
    }
}
