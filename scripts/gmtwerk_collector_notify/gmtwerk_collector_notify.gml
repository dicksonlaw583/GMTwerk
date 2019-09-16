///@func gmtwerk_collector_notify([collector;n])
///@param [collector;n] 2-tuple of collector and slot number
var collector = argument0[0],
		n = argument0[1],
		triggerBank = collector[GMTWERK_COLLECTOR.TRIGGER_BANK];
if (is_array(triggerBank)) {
	triggerBank[@ n] = true;
} else {
	collector[@ GMTWERK_COLLECTOR.TRIGGER_BANK] = triggerBank | (1<<n);
}
