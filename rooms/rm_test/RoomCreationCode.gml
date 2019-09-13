gmtwerk_test_all();
var beep = [gmtwerk_suite_play_sound, snd_0];
gmtwerk_suite_play_sound(snd_0);
Delayer(1*room_speed, beep);
Repeater(2*room_speed, beep, "times", 3);
Timekeeper(0, [3*room_speed, beep, 5*room_speed, beep]);
Timekeeper(8*room_speed, [1*room_speed, beep, 0*room_speed, beep]);
assert_equal(__gmtwerk_host__.__gmtwerk__, [
	__delayer_builder__(1*room_speed, beep, undefined, false),
	__repeater_builder__(2*room_speed, 3, 2*room_speed, beep, undefined, false),
	__timekeeper_builder__(0, true, [3*room_speed, beep, 5*room_speed, beep], false, undefined),
	__timekeeper_builder__(8*room_speed, false, [1*room_speed, beep, 0*room_speed, beep], false, undefined)
]);
