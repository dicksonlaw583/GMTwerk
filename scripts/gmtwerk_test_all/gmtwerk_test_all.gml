///@func gmtwerk_test_all()
var time_a, time_b;
time_a = current_time;
global.__gmtwerk_suite_callbacks__ = ds_map_create();
gmtwerk_test_delayer();
gmtwerk_test_repeater();
gmtwerk_test_timekeeper();
ds_map_destroy(global.__gmtwerk_suite_callbacks__);
time_b = current_time;
show_debug_message("GMTwerk tests done in " + string(time_b-time_a) + "ms.");
