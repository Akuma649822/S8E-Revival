/// player_collision(x, y, layer)
// Checks if we collide with a piece of terrain.

// Solid:
if (place_meeting(argument0, argument1, par_solid))
{
    return true;
}

// Platform:
if (ground)
{
    if (place_meeting(argument0, argument1, par_platform))
    {
        if (!platform_check)
        {
            if (angle == 0)
            {
                platform_check = true;
                return true;
            }
        }
        else
        {
            return true;
        }
    }
}

// Layers:
if (argument2 == 0)
{
    return place_meeting(argument0, argument1, par_layer_low);
}
if (argument2 == 1)
{
    return place_meeting(argument0, argument1, par_layer_high);
}
