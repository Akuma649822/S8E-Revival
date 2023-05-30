/// audio_initialize()
// Loads sounds and music used in the game. This script should be used frames after the game has loaded to prevent crashes or freezes.
// To play a sound effect, use audio_play_sound(SFX.filename, volume, pitch, duplicate). Adding SFX. infront of the filename is IMPORTANT!
// To play music, use audio_play_music(SFX.filename).

// Variables:
var sound_id, sound_id_name, sound_file;

// ########################################################################################################################## //

// Player Sounds:
sound_id      = file_find_first(working_directory + "\data\audio\sound\player\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = caster_load(working_directory + "\data\audio\sound\player\" + string(sound_id));
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// General Sounds:
sound_id      = file_find_first(working_directory + "\data\audio\sound\general\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = caster_load(working_directory + "\data\audio\sound\general\" + string(sound_id));
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Shields:
sound_id      = file_find_first(working_directory + "\data\audio\sound\shield\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = caster_load(working_directory + "\data\audio\sound\shield\" + string(sound_id));
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Jingles:
sound_id      = file_find_first(working_directory + "\data\audio\sound\jingle\*.ogg", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = caster_load(working_directory + "\data\audio\sound\jingle\" + string(sound_id));
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Music:
sound_id      = file_find_first(working_directory + "\data\audio\music\*.ogg", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = caster_load(working_directory + "\data\audio\music\" + string(sound_id));
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //
