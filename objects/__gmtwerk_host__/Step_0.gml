///@description Run twerks if active
if (global.__gmtwerk_host_speed__ > 0) {
	twerk(global.__gmtwerk_host_speed__);
} else if (global.__gmtwerk_host_speed__ < 0) {
	twerk(delta_time);
}
