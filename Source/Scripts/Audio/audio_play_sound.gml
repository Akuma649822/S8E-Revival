/// audio_play_sound(index, [volume], [pitch], [loop], [duplicate])
// Plays a sound effect with a given volume and pitch value. If duplicate is 0 it will stop the given sound first if it's already playing.

// Set up default argument variables:
var index, volume, pitch, loop, duplicate;
volume    = global.sfx_volume;
pitch     = 1;
loop      = 0;
duplicate = 0;

// If the number of given arguments is greater than 0, change the value of each variable.
switch (argument_count)
{
    case 5: duplicate = argument[4];
    case 4: loop = argument[3];
    case 3: pitch = argument[2];
    case 2: volume = argument[1];
    default: index = argument[0];
}

// Stop duplicates of the sound if necessary.
if (duplicate == 0)
{
    if (caster_is_playing(index))
    {
        caster_stop(index);
    }
}

// Play/loop the given sound.
if (loop == 0)
{
    caster_play(index, volume, pitch);
}
else
{
    caster_loop(index, volume, pitch);
}
