/// player_state_slide()
// Script to handle Knuckles' sliding.

// Only run while sliding.
if (state == STATE_SLIDE)
{
    // Slide sound.
    if (!audio_is_playing(SFX._player_slide))
    {
        audio_play_sound(SFX._player_slide, global.sfx_volume, 1, 1, 1);
    }

    // Decelerate.
    if (x_speed > 0)
    {
        x_speed = max(x_speed - 0.125, 0);
    }
    else if (x_speed < 0)
    {
        x_speed = min(x_speed + 0.125, 0);
    }

    // Dust effect.
    if (animation_frame_count mod 5 == 0 && x_speed != 0)
    {
        instance_create(x, y + 13, obj_skid_dust);
    }

    // Get up.
    if (x_speed == 0)
    {
        if (animation_frame == 0)
        {
            animation_frame = 1;
        }
        
        if (animation_frame < 2)
        {
            animation_frame += 0.10;
        }
        else
        {
            state = STATE_DEFAULT;
        }
    }

    // Cancel, if no longer grounded.
    if (!ground) state = STATE_ROLL;
}

// Stop slide sound.
if (audio_is_playing(SFX._player_slide) && state != STATE_SLIDE)
{
    audio_stop(SFX._player_slide);
}
