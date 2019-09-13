///@func __repeater_runner__(repeater, timeUnits, mode)
///@param repeater
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		argument0[@ GMTWERK_REPEATER.TIME] -= argument1;
		while (argument0[GMTWERK_REPEATER.TIME] <= 0 && argument0[GMTWERK_REPEATER.TIMES] != 0) {
			__gmtwerk_payload__(argument0, GMTWERK_REPEATER.PAYLOAD);
			if (argument0[GMTWERK_REPEATER.TIMES] > 0 && --argument0[@ GMTWERK_REPEATER.TIMES] == 0) {
				argument0[@ GMTWERK_REPEATER.STATE] = GMTWERK_STATE.DONE;
			} else {
				argument0[@ GMTWERK_REPEATER.TIME] += argument0[GMTWERK_REPEATER.RELOAD_TIME];	
			}
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_REPEATER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		if (argument0[@ GMTWERK_REPEATER.RUN_ON_INTERRUPT]) {
			__gmtwerk_payload__(argument0, GMTWERK_REPEATER.PAYLOAD);
		}
		__gmtwerk_payload__(argument0, GMTWERK_REPEATER.ON_INTERRUPT);
		argument0[@ GMTWERK_REPEATER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
