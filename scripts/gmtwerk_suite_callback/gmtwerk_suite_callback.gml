///@func gmtwerk_suite_callback(tag)
if (ds_map_exists(global.__gmtwerk_suite_callbacks__, argument0)) {
	global.__gmtwerk_suite_callbacks__[? argument0]++;
} else {
	global.__gmtwerk_suite_callbacks__[? argument0] = 1;
}
