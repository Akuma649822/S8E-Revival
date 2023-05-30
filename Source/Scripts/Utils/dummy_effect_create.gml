/// dummy_effect_create(sprite_index, image_speed, x, y, depth, loop_times)
// Creates a dummy effect with the given properties.
with (instance_create(argument2, argument3, obj_dummy_effect))
{
    sprite_index    = argument0;
    image_speed     = argument1;
    depth           = argument4;
    loop_times      = argument5;
}
