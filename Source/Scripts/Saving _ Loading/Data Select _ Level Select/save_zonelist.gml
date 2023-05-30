/// save_zonelist()
// This is used to load the proper stage after selecting a saved game.
// Make sure to add global.zone_id to the room's creation code (this should only be done in the first act).
if (global.zone_id == 0) room_goto(global.first_zone);
if (global.zone_id == 1) room_goto(rm_playground);
