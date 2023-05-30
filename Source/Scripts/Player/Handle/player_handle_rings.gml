/// player_handle_rings()
// Used to collect rings.
var ring, magnetized_ring;
ring            = player_collision_check(COL_MAIN_OBJECT, x, y, obj_ring);
magnetized_ring = player_collision_check(COL_MAIN_OBJECT, x, y, obj_ring_magnetized);

// Run if the player/AI is not hurt:
if (obj_player.state != STATE_HURT && state != STATE_HURT)
{
    if (ring != noone)
    {
        // Collect ring:
        with (ring)
        {
            dummy_effect_create(spr_ring_sparkle, 0.4, x, y, -10, 0);
            instance_destroy();
        }
        global.player_rings += 1;
        if (player_type == IS_CPU)
        {
            ai_ring += 1;
        }

        // Play ring sound:
        global.ring_pan *= -1;
        if (global.ring_pan == -1)
        {
            audio_play_sound(SFX._general_ring_left, global.sfx_volume, 1, 0, 0);
        }
        else
        {
            audio_play_sound(SFX._general_ring_right, global.sfx_volume, 1, 0, 0);
        }
    }
    if (magnetized_ring != noone)
    {
        // Collect ring:
        with (magnetized_ring)
        {
            dummy_effect_create(spr_ring_sparkle, 0.4, x, y, -10, 0);
            instance_destroy();
        }
        global.player_rings += 1;
        if (player_type == IS_CPU)
        {
            ai_ring += 1;
        }

        // Play ring sound:
        global.ring_pan *= -1;
        if (global.ring_pan == -1)
        {
            audio_play_sound(SFX._general_ring_left, global.sfx_volume, 1, 0, 0);
        }
        else
        {
            audio_play_sound(SFX._general_ring_right, global.sfx_volume, 1, 0, 0);
        }
    }
}
