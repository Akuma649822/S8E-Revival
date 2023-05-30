/// player_handle_monitors()
// Handles the collision between monitors and the player.

// Only run when we're not an AI player.
if (player_type == IS_PLAYER)
{
    // Find nearest monitor:
    var monitor;
    monitor = instance_nearest(x, y, obj_monitor);
    if (monitor != noone)
    {
        // Check if we collide with the top:
        if (y_speed >= 0 && (state == STATE_JUMP && !ground || state == STATE_ROLL && !ground || animation == "ROLL" && !ground || shield_state == 1 || state == STATE_HOMING) && player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, monitor))
        {
            // Destroy monitor:
            monitor.parent = id;
            with (monitor) instance_destroy();
    
            // Rebound:
            if (state != STATE_HOMING)
            {
                if (input_action)
                {
                    y_speed       *= -1;
                    ground         = false;
                    jump_completed = false;
                }
                else
                {
                    y_speed        = max(-4, y_speed * -1);
                    ground         = false;
                    jump_completed = false;
                }
            }
            else
            {
                shield_usable  = true;
                ground         = false;
                state          = STATE_JUMP;
                x_speed        = 0;
                y_speed        = -6;
                jump_completed = false;
            }
    
            // Reset bubble shield:
            if (shield == SHIELD_BUBBLE && shield_state > 0)
            {
                shield_state            = 0;
                shield_usable           = true;
                shield_obj.sprite_index = spr_shield_bubble;
            }
        }
    
        // Check if we collide with the side: 
        if ((state == STATE_ROLL || shield_state == 1 || state == STATE_GLIDE || state == STATE_SLIDE || state == STATE_HOMING) && (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, monitor) || player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, monitor)))
        {
            // Destroy monitor:
            monitor.parent = id;
            with (monitor) instance_destroy();
    
            // Rebound (homing attack):
            if (state == STATE_HOMING)
            {
                shield_usable  = true;
                ground         = false;
                state          = STATE_JUMP;
                x_speed        = 0;
                y_speed        = -6;
                jump_completed = false;
            }
        }
        
        // Check if we collide with the bottom:
        if (y_speed <= 0 && (state == STATE_JUMP || state == STATE_ROLL || animation == "ROLL" || state == STATE_HOMING) && player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, monitor))
        {
            if (state != STATE_HOMING)
            {
                monitor.bumped  = true;
                monitor.y_speed = -2;
            }
            else
            {
                // Destroy monitor:
                shield_usable  = true;
                ground         = false;
                state          = STATE_JUMP;
                monitor.parent = obj_player;
                with (monitor) instance_destroy();
            }
            angle = 0;
            if (y_speed < 0)
            {
                y_speed *= -1;
            }
        }
    
        // Allow monitor to bounce on our head.
        if (y_speed == 0 && state != STATE_CLIMB && (state != STATE_JUMP || state != STATE_ROLL || animation != "ROLL"))
        {
            if (state != STATE_CROUCH && state != STATE_SPINDASH)
            {
                if (player_collision_check(COL_TOP_OBJECT, MASK_MAIN, x, y, angle, monitor))
                {
                    monitor.bumped  = true;
                    monitor.y_speed = -2;
                    angle           = 0;
                }
            }
            else if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y + 10, angle, monitor))
            {
                if (state == STATE_SPINDASH)
                {
                    // Destroy monitor:
                    monitor.parent = id;
                    with (monitor) instance_destroy();
                }
                else
                {
                    monitor.bumped  = true;
                    monitor.y_speed = -2;
                    angle           = 0;
                }
            }
        }
    }
}
