/// save_global_load()
// Load a save file containing settings.

// Open/Create ini.
ini_open("settings.ini");
global.screen_scale = ini_read_real("Display",  "Scale",      1);
global.bgm_volume   = ini_read_real("Audio",    "BGMVolume",  1);
global.sfx_volume   = ini_read_real("Audio",    "SFXVolume",  1);
global.key_up       = ini_read_real("Keyboard", "KeyUp",      vk_up);
global.key_down     = ini_read_real("Keyboard", "KeyDown",    vk_down);
global.key_left     = ini_read_real("Keyboard", "KeyLeft",    vk_left);
global.key_right    = ini_read_real("Keyboard", "KeyRight",   vk_right);
global.key_action   = ini_read_real("Keyboard", "KeyAction",  ord("Z"));
global.key_special  = ini_read_real("Keyboard", "KeySpecial", ord("X"));
global.key_start    = ini_read_real("Keyboard", "KeyStart",   vk_enter);
global.gmp_action   = ini_read_real("Gamepad",  "GMPAction",  -1);
global.gmp_special  = ini_read_real("Gamepad",  "GMPSpecial", -1);
global.gmp_start    = ini_read_real("Gamepad",  "GMPStart",   -1);
ini_close();

// Set volume.
SFX.backup_bgm_volume = global.bgm_volume;
SFX.backup_sfx_volume = global.sfx_volume;

// Set screen resolution.
window_resize();
