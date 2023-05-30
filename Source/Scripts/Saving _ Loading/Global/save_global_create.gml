/// save_global_create()
// Creates a save file containing game settings.

// Open/Create ini.
ini_open("settings.ini");
ini_write_real("Display",  "Scale",      global.screen_scale);
ini_write_real("Audio",    "BGMVolume",  global.bgm_volume);
ini_write_real("Audio",    "SFXVolume",  global.sfx_volume);
ini_write_real("Keyboard", "KeyUp",      global.key_up);
ini_write_real("Keyboard", "KeyDown",    global.key_down);
ini_write_real("Keyboard", "KeyLeft",    global.key_left);
ini_write_real("Keyboard", "KeyRight",   global.key_right);
ini_write_real("Keyboard", "KeyAction",  global.key_action);
ini_write_real("Keyboard", "KeySpecial", global.key_special);
ini_write_real("Keyboard", "KeyStart",   global.key_start);
ini_write_real("Gamepad",  "GMPAction",  global.gmp_action);
ini_write_real("Gamepad",  "GMPSpecial", global.gmp_special);
ini_write_real("Gamepad",  "GMPStart",   global.gmp_start);
ini_close();

// Set volume.
SFX.backup_bgm_volume = global.bgm_volume;
SFX.backup_sfx_volume = global.sfx_volume;

// Set screen resolution.
window_resize();
