# S8E-V3.1
This is an edited version of the 3.0 build of the S8E framework (https://drive.google.com/file/d/1NCz-Uax4JcLz3-trludktemMbF2GelRi/view) originally created by AleksNB. It is primarily comprised of bug fixes backported from the Harinezumi framework, my own fixes for issues in S8E specifically, and a few minor feature additions ported from the Flicky 8 and Sonic MAX engines.

To load the project, you need to have the Standard edition of Game Maker 8.1.141. Older versions won't work as the project uses the clamp() and lerp() functions that were introduced in that version.

# Changes
For the list of changes between S8E V3.0 and V3.1, see the changelog:
https://github.com/Akuma649822/S8E-V3.1/blob/main/Changelog.txt

# Building Guide
You can either download the .gm81 file from the "Releases section", or use GmkSplitter to compile the "Source" folder from the main branch back into a .gm81: https://github.com/Medo42/Gmk-Splitter.

Make sure you have the Caster audio extension downloaded and installed in GM8.1, as well as placing Caster's DLLs and JoyDLL's DLLs in the project's directory (all of which can be found in the "Required Files" folder of the main branch, or the .zip included in the "Releases" section).

# GameMaker: Studio Compatibility
S8E V3.1 is mostly compatible with GameMaker: Studio, however, you'll need to make some changes with audio playback and controller handling before importing the project.

For audio playback:
- You'll have to add each sound and music file from the "data\audio" directory into the project, and you'll need to delete the audio_initialize() script.
- The audio_play_sound() and audio_play_music() scripts need to be renamed as they conflict with Studio's audio functions of the same names.
- The audio_is_playing() script needs to be deleted.
- For the audio_stop() script, you have 2 choices:
  1. You can replace the calls for audio_stop() with Studio's audio_stop_sound() function (but if the argument is "all", you'll need to replace it with audio_stop_all()).
  2. You can simply add the following code to the script:
     ```
     if (argument0 != all) audio_stop_sound(argument0);
     else audio_stop_all();
     ```
- You'll also need to re-write the audio scripts to use Studio's audio functions (it's more convenient + I don't think Caster works with Studio).

For controller handling:
- You'll have to rename the scripts in the "joydll-transparent" group since they conflict with the joystick_* functions of the same names.
- If you're using a version of Studio older than 1.4.1772, you'll need to remove the line that references the variable_global_exists() function in the joy_init() script.
- You may or may not choose to use Studio's gamepad functions instead of JoyDLL.

# Known Issues
- The player is unable to grab onto slopes at specific angles.
- The player is prone to slipping off corners of flat tiles that connect with ramps, and shooting past downward-curved slopes. Unfortunately, these would prove difficult to fix, as the player's various hitboxes are circular, which means precise collisions are not always guaranteed.

# Credits
- Coding: AleksNB, F4LK, John-Kun, Tpot, Akuma649822.
  > Additional credits to those that helped with the development of the Sonic MAX, GMate, Flicky/8, S8E and Harinezumi frameworks as well since S8E was a re-write of those engines (excl. HZ), and S8E V3.1 uses some code from them.
- Beta testing: somerandomusername.
- GmkSplitter: Medo42.
- DBGHelp.dll / Debugger Helper: omicronrex.
- Caster: MoaCube and Marius Utheim.
- JoyDLL: Evan Balster.
- Game Maker 8.1: Mark Overmars, YoYo Games.
- Sonic the Hedgehog: SEGA.
