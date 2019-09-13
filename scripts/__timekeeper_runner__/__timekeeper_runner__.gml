///@func __timekeeper_runner__(timekeeper, timeUnits, mode)
///@param timekeeper
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var oldTime = argument0[@ GMTWERK_TIMEKEEPER.TIME];
		var newTime = oldTime+(argument0[GMTWERK_TIMEKEEPER.COUNTUP] ? argument1 : -argument1);
		var payloads = argument0[GMTWERK_TIMEKEEPER.PAYLOADS];
		var payloadsArraySize = array_length_1d(payloads);
		var allOver = true;
		argument0[@ GMTWERK_TIMEKEEPER.TIME] = newTime;
		if (argument0[GMTWERK_TIMEKEEPER.COUNTUP]) {
			for (var i = 0; i < payloadsArraySize; i += 3) {
				var payloadTime = payloads[i];
				if (payloadTime <= newTime) {
					if (payloadTime > oldTime) {
						__gmtwerk_payload__(payloads, i+1);
					}
				}	else {
					allOver = false;
				}
			}
			if (allOver && !argument0[@ GMTWERK_TIMEKEEPER.KEEP_GOING]) {
				argument0[@ GMTWERK_TIMEKEEPER.STATE] = GMTWERK_STATE.DONE;
			}
		} else {
			for (var i = 0; i < payloadsArraySize; i += 3) {
				var payloadTime = payloads[i];
				if (payloadTime >= newTime) {
					if (payloadTime < oldTime) {
						__gmtwerk_payload__(payloads, i+1);
					}
				} else {
					allOver = false;
				}
			}
			if (allOver && !argument0[@ GMTWERK_TIMEKEEPER.KEEP_GOING]) {
				argument0[@ GMTWERK_TIMEKEEPER.STATE] = GMTWERK_STATE.DONE;
			}
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_TIMEKEEPER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_TIMEKEEPER.ON_INTERRUPT);
		argument0[@ GMTWERK_TIMEKEEPER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
