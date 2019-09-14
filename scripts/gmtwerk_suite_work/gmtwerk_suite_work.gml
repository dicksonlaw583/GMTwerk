///@func gmtwerk_suite_work(tag, memory, interrupting)
gml_pragma("global", "global.__gmtwerk_suite_work__ = false;");
var callbackTag = argument[0] + (argument[2] ? "-interrupt" : "");
if (ds_map_exists(global.__gmtwerk_suite_callbacks__, callbackTag)) {
	global.__gmtwerk_suite_callbacks__[? callbackTag]++;
} else {
	global.__gmtwerk_suite_callbacks__[? callbackTag] = 1;
}
return global.__gmtwerk_suite_work__;
