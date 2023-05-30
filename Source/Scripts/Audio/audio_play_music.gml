/// audio_play_music(index)
// Plays a music track.
if (!caster_is_playing(argument0))
{
    global.bgm_id = caster_loop(argument0, global.bgm_volume, 1);
}
