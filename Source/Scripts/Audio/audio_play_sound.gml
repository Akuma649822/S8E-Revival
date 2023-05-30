/// audio_play_sound(index, volume, pitch, loop, duplicate)
// Plays a sound effect with a given volume and pitch value. If duplicate is 0 it will stop the given sound first if it's already playing.
if (argument4 == 0)
{
    if (caster_is_playing(argument0))
    {
        caster_stop(argument0);
    }
}

if (argument3 == 0)
{
    caster_play(argument0, argument1, argument2);
}
else
{
    caster_loop(argument0, argument1, argument2);
}
