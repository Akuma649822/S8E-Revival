/// player_state_dropdash()
// Sonic's dropdash ability.

// Trigger dropdash.
if (state == STATE_JUMP && shield == 0)
{
    if (input_special_pressed && shield_usable)
    {
        dropdash_flag = 1;
    }
    if (input_special && dropdash_flag == 1)
    {
        if (dropdash_timer > 0)
        {
            dropdash_timer -= 1;
        }
        else
        {
            dropdash_flag = 2;
            audio_play_sound(SFX._player_dropdash, global.sfx_volume, 1, 0, 0);
        }
    }

    // Cancel dropdash.
    if (!input_special && !ground && dropdash_flag >= 1)
    {
        if (dropdash_flag == 2)
        {
            shield_usable = false;
        }
        dropdash_flag  = 0;
        dropdash_timer = 20;
        audio_stop(SFX._player_dropdash);
    }
}

// Release.
if (ground && dropdash_flag == 2)
{
    // Reset dropdash flag and change state.
    dropdash_flag  = 0;
    dropdash_timer = 20;
    state          = STATE_ROLL;
    
    // Play dropdash sound.
    audio_play_sound(SFX._player_spindash_release, global.sfx_volume, 1, 0, 0);
    audio_stop(SFX._player_dropdash);
    
    // Create dust effect.
    with (instance_create(xprevious, y + 8, obj_skid_dust))
    {
        image_xscale = other.animation_direction;
    }
    
    // Set release speed based on animation direction, angle and current speed (backported from Harinezumi).
    if (animation_direction == 1)
    {
        if (x_speed >= 0)
        {
            x_speed = dropdash_speed + (x_speed / 4);
        }
        else if (angle != 0)
        {
            x_speed = dropdash_speed + (x_speed / 2);
        }
        else
        {
            x_speed = dropdash_speed;
        }
    }
    if (animation_direction == -1)
    {
        if (x_speed <= 0)
        {
            x_speed = -dropdash_speed + (x_speed / 4);
        }
        else if (angle != 0)
        {
            x_speed = -dropdash_speed + (x_speed / 2);
        }
        else
        {
            x_speed = -dropdash_speed;
        }
    }
}

// Cancel.
if ((ground && dropdash_timer < 20) || shield != 0 || state != STATE_JUMP)
{
    dropdash_flag  = 0;
    dropdash_timer = 20;
    audio_stop(SFX._player_dropdash);
}
