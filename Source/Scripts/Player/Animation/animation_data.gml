/// animation_data()
// Gets the animation data of each character.

// Sonic:
if (player_index == CHAR_SONIC)
{
    animation_add("IDLE",        spr_sonic_idle,        0, 0,  0, 0,     0, 0, "",          0);
    animation_add("BORED_1",     spr_sonic_idle_bored,  0, 3,  2, 0.10,  1, 0, "",          0);
    animation_add("CROUCH",      spr_sonic_crouch,      0, 1,  0, 0.15,  0, 0, "",          0);
    animation_add("LOOK_UP",     spr_sonic_lookup,      0, 1,  0, 0.15,  0, 0, "",          0);
    animation_add("WALK",        spr_sonic_walk,        0, 7,  0, 0.125, 1, 0, "",          0);
    animation_add("RUN",         spr_sonic_run,         0, 3,  0, 0.50,  1, 0, "",          0);
    animation_add("PEELOUT",     spr_sonic_peelout,     0, 3,  0, 0,     1, 0, "",          0);
    animation_add("ROLL",        spr_sonic_roll,        0, 7,  0, 0.2,   1, 0, "",          0);
    animation_add("DROPDASH",    spr_sonic_dropdash,    0, 5,  0, 0.5,   1, 0, "",          0);
    animation_add("SPINDASH",    spr_sonic_spindash,    0, 5,  0, 0.8,   1, 0, "",          0);
    animation_add("SPRING",      spr_sonic_spring,      0, 0,  0, 0,     0, 0, "",          0);
    animation_add("SKID",        spr_sonic_skid,        0, 2,  2, 0.25,  0, 0, "SKID_TURN", 0);
    animation_add("SKID_TURN",   spr_sonic_skid_turn,   0, 0,  0, 0.25,  0, 0, "",          0);
    animation_add("PUSH",        spr_sonic_push,        0, 4,  1, 0.10,  1, 0, "",          0);
    animation_add("GRAB",        spr_sonic_grab,        0, 3,  0, 0.06,  1, 0, "",          0);
    animation_add("GRAB_MOVE",   spr_sonic_grab_move,   0, 5,  0, 0.10,  1, 0, "",          0);
    animation_add("GRAB_SHIMMY", spr_sonic_grab_shimmy, 0, 1,  0, 0.15,  1, 0, "",          0);
    animation_add("CORKSCREW",   spr_sonic_corkscrew,   0, 11, 0, 0,     0, 0, "",          0);
    animation_add("BALANCE_1",   spr_sonic_balance,     0, 2,  0, 0.15,  1, 0, "",          0);
    animation_add("BALANCE_2",   spr_sonic_balance_alt, 0, 2,  0, 0.12,  1, 0, "",          0);
    animation_add("HURT",        spr_sonic_hurt,        0, 1,  0, 0.10,  1, 0, "",          0);
    animation_add("BREATHE",     spr_sonic_breath,      0, 0,  0, 0,     0, 0, "",          0);
    animation_add("DEATH",       spr_sonic_die,         0, 0,  0, 0,     0, 0, "",          0);
    animation_add("DROWN",       spr_sonic_drown,       0, 0,  0, 0,     0, 0, "",          0);
}

// Tails:
if (player_index == CHAR_TAILS)
{
    animation_add("IDLE",        spr_tails_idle,           0, 0,  0, 0,     0, 0, "",          0);
    animation_add("BORED_1",     spr_tails_idle_bored,     0, 0,  0, 0.05,  0, 5, "BORED_2",   0);
    animation_add("BORED_2",     spr_tails_idle_bored,     1, 12, 1, 0.15,  0, 0, "BORED_1",   0);
    animation_add("CROUCH",      spr_tails_crouch,         0, 0,  0, 0,     0, 0, "",          0);
    animation_add("LOOK_UP",     spr_tails_lookup,         0, 0,  0, 0,     0, 0, "",          0);
    animation_add("WALK",        spr_tails_walk,           0, 7,  0, 0.10,  1, 0, "",          0);
    animation_add("RUN",         spr_tails_run,            0, 2,  0, 0.125, 1, 0, "",          0);
    animation_add("ROLL",        spr_tails_roll,           0, 2,  0, 0.2,   1, 0, "",          0);
    animation_add("SPINDASH",    spr_tails_spindash,       0, 2,  0, 0.5,   1, 0, "",          0);
    animation_add("SPRING",      spr_tails_spring,         0, 1,  0, 0.1,   1, 0, "",          0);
    animation_add("SKID",        spr_tails_skid,           0, 1,  1, 0.25,  0, 0, "SKID_TURN", 0);
    animation_add("SKID_TURN",   spr_tails_skid,           0, 1,  0, 0.25,  0, 0, "",          0);
    animation_add("PUSH",        spr_tails_push,           0, 4,  1, 0.10,  1, 0, "",          0);
    animation_add("GRAB",        spr_tails_grab,           0, 3,  0, 0.06,  1, 0, "",          0);
    animation_add("GRAB_MOVE",   spr_tails_grab_move,      0, 5,  0, 0.10,  1, 0, "",          0);
    animation_add("GRAB_SHIMMY", spr_tails_grab_shimmy,    0, 1,  0, 0.15,  1, 0, "",          0);
    animation_add("CORKSCREW",   spr_tails_corkscrew,      0, 11, 0, 0,     0, 0, "",          0);
    animation_add("FLY",         spr_tails_fly,            0, 0,  0, 0,     0, 0, "",          0);
    animation_add("FLY_DROP",    spr_tails_fly_exhausted,  0, 4,  0, 0.045, 1, 0, "",          0);
    animation_add("SWIM",        spr_tails_swim,           0, 3,  0, 0.25,  1, 0, "",          0);
    animation_add("SWIM_DROP",   spr_tails_swim_exhausted, 0, 2,  0, 0.10,  1, 0, "",          0);
    animation_add("BALANCE_1",   spr_tails_balance,        0, 1,  0, 0.15,  1, 0, "",          0);
    animation_add("BALANCE_2",   spr_tails_balance,        0, 1,  0, 0.15,  1, 0, "",          0);
    animation_add("HURT",        spr_tails_hurt,           0, 1,  0, 0.10,  1, 0, "",          0);
    animation_add("BREATHE",     spr_tails_breath,         0, 0,  0, 0,     0, 0, "",          0);
    animation_add("DEATH",       spr_tails_die,            0, 0,  0, 0,     0, 0, "",          0);
    animation_add("DROWN",       spr_tails_drown,          0, 0,  0, 0,     0, 0, "",          0);
}

// Knuckles:
if (player_index == CHAR_KNUCKLES)
{
    animation_add("IDLE",        spr_knuckles_idle,        0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("BORED_1",     spr_knuckles_idle_bored,  0, 1,  0, 0.10,  0, 11, "BORED_2",   0);
    animation_add("BORED_2",     spr_knuckles_idle_bored,  2, 41, 2, 0.15,  1, 0,  "",          0);
    animation_add("CROUCH",      spr_knuckles_crouch,      0, 1,  0, 0.15,  0, 0,  "",          0);
    animation_add("LOOK_UP",     spr_knuckles_lookup,      0, 1,  0, 0.15,  0, 0,  "",          0);
    animation_add("WALK",        spr_knuckles_walk,        0, 7,  0, 0.125, 1, 0,  "",          0);
    animation_add("RUN",         spr_knuckles_run,         0, 3,  0, 0.50,  1, 0,  "",          0);
    animation_add("ROLL",        spr_knuckles_roll,        0, 7,  0, 0.2,   1, 0,  "",          0);
    animation_add("SPINDASH",    spr_knuckles_spindash,    0, 5,  0, 0.8,   1, 0,  "",          0);
    animation_add("SPRING",      spr_knuckles_spring,      0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("SKID",        spr_knuckles_skid,        0, 1,  1, 0.25,  0, 0,  "SKID_TURN", 0);
    animation_add("SKID_TURN",   spr_knuckles_skid,        1, 1,  1, 0.25,  0, 0,  "",          0);
    animation_add("PUSH",        spr_knuckles_push,        0, 4,  1, 0.10,  1, 0,  "",          0);
    animation_add("GRAB",        spr_knuckles_grab,        0, 3,  0, 0.06,  1, 0,  "",          0);
    animation_add("GRAB_MOVE",   spr_knuckles_grab_move,   0, 5,  0, 0.10,  1, 0,  "",          0);
    animation_add("GRAB_SHIMMY", spr_knuckles_grab_shimmy, 0, 1,  0, 0.15,  1, 0,  "",          0);
    animation_add("CORKSCREW",   spr_knuckles_corkscrew,   0, 11, 0, 0,     0, 0,  "",          0);
    animation_add("BALANCE_1",   spr_knuckles_balance,     0, 11, 8, 0.15,  1, 0,  "",          0);
    animation_add("BALANCE_2",   spr_knuckles_balance,     0, 11, 8, 0.15,  1, 0,  "",          0);
    animation_add("GLIDE",       spr_knuckles_glide,       0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("GLIDE_DROP",  spr_knuckles_glide_drop,  0, 1,  0, 0.15,  0, 0,  "",          0);
    animation_add("SLIDE",       spr_knuckles_slide,       0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("CLIMB",       spr_knuckles_climb,       0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("CLIMB_LEDGE", spr_knuckles_ledge,       0, 3,  0, 0.20,  0, 0,  "",          0);
    animation_add("HURT",        spr_knuckles_hurt,        0, 1,  0, 0.10,  1, 0,  "",          0);
    animation_add("BREATHE",     spr_knuckles_breath,      0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("DEATH",       spr_knuckles_die,         0, 0,  0, 0,     0, 0,  "",          0);
    animation_add("DROWN",       spr_knuckles_drown,       0, 0,  0, 0,     0, 0,  "",          0);
}
