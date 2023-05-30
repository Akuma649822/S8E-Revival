/// player_state_insta_shield()
// This is used for the insta shield.

// Sonic's insta shield.
if (player_index == CHAR_SONIC && shield_usable && shield == 0 && shield_obj == noone && allow_instashield)
{
    if (input_action_pressed)
    {
        if (!instance_exists(obj_insta_shield))
        {
            shield_usable = false;
            instance_create(x, y, obj_insta_shield);
        }
    }
}
