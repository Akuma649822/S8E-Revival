// joy_r(id)
//Returns the position (from -1 to 1) of the fourth axis on the joystick.

return external_call(global.ljoyAxis, argument0, 3);

//  NOTE THAT JOY'S IDs START FROM ZERO AND NOT ONE!!!
