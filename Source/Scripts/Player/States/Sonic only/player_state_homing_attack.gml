/// player_state_homing_attack()
// Sonic's homing attack ability.

// Create target.
if (state != STATE_HOMING && shield == 0 && shield_obj == noone)
{
    // Reset homing target flag.
    
    // If the target id exists but the actual target does not:
    if (homing_target != noone)
    {
        if (!instance_exists(homing_target))
        {
            homing_target = noone;
        }
    }
    
    // If we've changed state:
    if (ground || state != STATE_JUMP)
    {
        if (homing_target != noone)
        {
            if (instance_exists(homing_target))
            {
                with (homing_target) instance_destroy();
            }
            homing_target = noone;
        }
    }

    // If we're far away from the target, we're not facing the target, or we're below the target:
    if (instance_exists(homing_target))
    {
        if (distance_to_object(homing_target) > homing_distance
        || sign(homing_target.x - x) != animation_direction
        || (homing_target.target != homing_target_id[2] && y > homing_target.bbox_bottom)
        || (homing_target.target == homing_target_id[2] && y > homing_target.y - 16))
        {
            if (homing_target != noone)
            {
                if (instance_exists(homing_target))
                {
                    with (homing_target) instance_destroy();
                }
                homing_target = noone;
            }
        }
    }

    // Find nearest target.
    if (animation_direction == 1)
    {
        homing_target_id[0] = instance_nearest_dir_x(x, y, par_enemy,     ">=");
        homing_target_id[1] = instance_nearest_dir_x(x, y, obj_monitor,   ">=");
        homing_target_id[2] = instance_nearest_dir_x(x, y, obj_spring_up, ">=");
    }
    else if (animation_direction == -1)
    {
        homing_target_id[0] = instance_nearest_dir_x(x, y, par_enemy,     "<=");
        homing_target_id[1] = instance_nearest_dir_x(x, y, obj_monitor,   "<=");
        homing_target_id[2] = instance_nearest_dir_x(x, y, obj_spring_up, "<=");
    }

    // Target a monitor:
    if (homing_target_id[0] != noone)
    {
        if (shield_usable && state == STATE_JUMP && dropdash_flag == 0)
        {
            if (distance_to_object(homing_target_id[0]) < homing_distance && sign(homing_target_id[0].x - x) == animation_direction && y < homing_target_id[0].bbox_bottom)
            {
                if (homing_target == noone && !instance_exists(homing_target))
                {
                    homing_target        = instance_create(homing_target_id[0].x, homing_target_id[0].y, obj_homing_target);
                    homing_target.target = homing_target_id[0];
                }
            }
        }
    }
    else if (homing_target_id[1] != noone) // Target an enemy.
    {
        if (shield_usable && state == STATE_JUMP && dropdash_flag == 0)
        {
            if (distance_to_object(homing_target_id[1]) < homing_distance && sign(homing_target_id[1].x - x) == animation_direction && y < homing_target_id[1].bbox_bottom)
            {
                if (homing_target == noone && !instance_exists(homing_target))
                {
                    homing_target        = instance_create(homing_target_id[1].x, homing_target_id[1].y, obj_homing_target);
                    homing_target.target = homing_target_id[1];
                }
            }
        }
    }
    else if (homing_target_id[2] != noone) // Target a spring.
    {
        if (shield_usable && state == STATE_JUMP && dropdash_flag == 0)
        {
            if (homing_target_id[2].spring_direction == "UP")
            {
                if (distance_to_object(homing_target_id[2]) < homing_distance && sign(homing_target_id[2].x - x) == animation_direction && y < homing_target_id[2].y - 16)
                {
                    if (homing_target == noone && !instance_exists(homing_target))
                    {
                        homing_target        = instance_create(homing_target_id[2].x, homing_target_id[2].y, obj_homing_target);
                        homing_target.target = homing_target_id[2];
                    }
                }
            }
        }
    }

    // Trigger homing attack.
    if (homing_target != noone && instance_exists(homing_target))
    {
        if (input_action_pressed && shield_usable && state == STATE_JUMP && dropdash_flag == 0 && homing_target.visible)
        {
            state         = STATE_HOMING;
            shield_usable = false;
            audio_play_sound(SFX._player_spindash_release, global.sfx_volume, 1, 0, 0);
        }
    }

    // Trigger homing dash.
    if (homing_target == noone)
    {
        if (input_action_pressed && shield_usable && state == STATE_JUMP && dropdash_flag == 0)
        {
            shield_usable = false;
            audio_play_sound(SFX._player_spindash_release, global.sfx_volume, 1, 0, 0);
            
            if (homing_mode == 1)
            {
                x_speed = clamp(animation_direction * (abs(x_speed) + 4), -12, 12);
            }
            else
            {
                x_speed = animation_direction * 8;
            }
            
            y_speed = 0;
        }
    }
    else if (instance_exists(homing_target))
    {
        if (input_action_pressed && shield_usable && state == STATE_JUMP && dropdash_flag == 0 && !homing_target.visible)
        {
            shield_usable = false;
            audio_play_sound(SFX._player_spindash_release, global.sfx_volume, 1, 0, 0);
            
            if (homing_mode == 1)
            {
                x_speed = clamp(animation_direction * (abs(x_speed) + 4), -12, 12);
            }
            else
            {
                x_speed = animation_direction * 8;
            }
            
            y_speed = 0;
        }
    }
}
else if (state == STATE_HOMING)
{
    if (homing_target != noone && instance_exists(homing_target))
    {
        var _dir;
        _dir    = point_direction(x, y, homing_target.x, homing_target.y);
        x_speed = lengthdir_x(homing_speed, _dir);
        y_speed = lengthdir_y(homing_speed, _dir);
    }
    else
    {
        state = STATE_JUMP;
    }
}

// Reset homing target if a shield is active.
if (shield != 0)
{
    if (homing_target != noone)
    {
        if (instance_exists(homing_target))
        {
            with (homing_target) instance_destroy();
        }
        homing_target = noone;
    }
}
