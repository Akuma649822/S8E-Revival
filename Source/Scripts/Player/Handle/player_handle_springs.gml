/// player_handle_springs()
// Used to handle collision with various springs.

// Find nearest spring.
var spring;
spring = instance_nth_nearest(x, y, par_spring, 1);

// Check if we collide with spring:
if (spring != noone)
{
    // Horizontal springs:
    if (spring.spring_direction == "LEFT")
    {
        if (!player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, spring) && player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring))
        {
            // Set spring frame:
            spring.spring_frame = 1;

            // Reset angle:
            player_set_angle(0);

            // Set input lock and speed.
            input_lock_s        = true;
            lock_timer          = 16;
            x_speed             = -spring.spring_strength;
            animation_direction = -1;

            // Revert to the default state if gliding, dropping or sliding.
            if (state == STATE_GLIDE || state == STATE_GLIDE_DROP || state == STATE_SLIDE)
            {
                state = STATE_DEFAULT;
                if (!ground) animation = "RUN";
            }

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }
    if (spring.spring_direction == "RIGHT")
    {
        if (!player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, spring) && player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring))
        {
            // Set spring frame:
            spring.spring_frame = 1;

            // Reset angle:
            player_set_angle(0);

            // Set input lock and speed.
            input_lock_s        = true;
            lock_timer          = 16;
            x_speed             = spring.spring_strength;
            animation_direction = 1;

            // Revert to the default state if gliding, dropping or sliding.
            if (state == STATE_GLIDE || state == STATE_GLIDE_DROP || state == STATE_SLIDE)
            {
                state = STATE_DEFAULT;
                if (!ground) animation = "RUN";
            }

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }

    // Vertical springs:
    if (spring.spring_direction == "UP")
    {
        if (player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, spring) && y_speed >= 0)
        {
            // Stop homing target.
            if (state == STATE_HOMING)
            {
                if (instance_exists(obj_homing_target))
                {
                    if (instance_place(x, y, obj_homing_target))
                    {
                        with (obj_homing_target) instance_destroy();
                        if (homing_mode == 0)
                        {
                            x_speed = 0;
                        }
                        else
                        {
                            x_speed *= 0.5;
                        }
                    }
                }
            }

            // Set spring frame:
            spring.spring_frame = 1;

            // Disable ground flag and change state.
            ground = false;
            state  = STATE_SPRING;

            // Set speed.
            y_speed = -spring.spring_strength;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);

            // Reset bubble shield state:
            if (shield == SHIELD_BUBBLE && shield_state > 0)
            {
                shield_state            = 0;
                shield_obj.sprite_index = spr_shield_bubble;
            }


        }
    }
    if (spring.spring_direction == "DOWN")
    {
        if (ground && player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring) && angle != 0)
        {
            // Set spring frame:
            spring.spring_frame = 1;

            // Set speed.
            x_speed    = spring.spring_strength;
            lock_timer = 15;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
        else if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, spring))
        {
            // Set spring frame:
            spring.spring_frame = 1;

            // Set speed.
            y_speed = spring.spring_strength;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }
}

// Find nearest diagonal spring.
var spring_diagonal;
spring_diagonal = instance_nth_nearest(x, y, par_spring_diagonal, 1);

// Check if we collide with a spring.
if (spring_diagonal != noone)
{
    // Diagonal Up Right:
    if (spring_diagonal.spring_direction == "UP_RIGHT")
    {
        // Check if we collide with it:
        if ((player_collision_check(COL_BOTTOM_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
        {
            // Trigger spring alarm.
            spring_diagonal.alarm[0] = 5;

            // Reset angle and disable ground flag.
            player_set_angle(0);
            ground = false;

            // Set speed and state.
            x_speed             =  spring_diagonal.spring_strength;
            y_speed             = -spring_diagonal.spring_strength;
            animation_direction =  1;
            state               =  STATE_SPRING;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }

    // Diagonal Up left:
    if (spring_diagonal.spring_direction == "UP_LEFT")
    {
        // Check if we collide with it:
        if ((player_collision_check(COL_BOTTOM_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
        {
            // Trigger spring alarm.
            spring_diagonal.alarm[0] = 5;

            // Reset angle and disable ground flag.
            player_set_angle(0);
            ground = false;

            // Set speed and state.
            x_speed             = -spring_diagonal.spring_strength;
            y_speed             = -spring_diagonal.spring_strength;
            animation_direction = -1;
            state               =  STATE_SPRING;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }

    // Diagonal Down Right:
    if (spring_diagonal.spring_direction == "DOWN_RIGHT")
    {
        // Check if we collide with it:
        if ((player_collision_check(COL_TOP_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
        {
            // Trigger spring alarm.
            spring_diagonal.alarm[0] = 5;

            // Reset angle and disable ground flag.
            player_set_angle(0);
            ground = false;

            // Set speed and state.
            x_speed             = spring_diagonal.spring_strength;
            y_speed             = spring_diagonal.spring_strength;
            animation_direction = 1;
            state               = STATE_SPRING;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }

    // Diagonal Down left:
    if (spring_diagonal.spring_direction == "DOWN_LEFT")
    {
        // Check if we collide with it:
        if ((player_collision_check(COL_TOP_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
        {
            // Trigger spring alarm.
            spring_diagonal.alarm[0] = 5;

            // Reset angle and disable ground flag.
            player_set_angle(0);
            ground = false;

            // Set speed and state.
            x_speed             = -spring_diagonal.spring_strength;
            y_speed             =  spring_diagonal.spring_strength;
            animation_direction = -1;
            state               =  STATE_SPRING;

            // Play spring sound:
            audio_play_sound(SFX._general_spring, global.sfx_volume, 1, 0, 0);
        }
    }
}
