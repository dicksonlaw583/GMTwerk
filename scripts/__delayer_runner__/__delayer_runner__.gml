///@func __delayer_runner__(delayer, timeUnits, mode)
///@param delayer
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		argument0[@ GMTWERK_DELAYER.TIME] -= argument1;
		if (argument0[GMTWERK_DELAYER.TIME] <= 0) {
			__gmtwerk_payload__(argument0, GMTWERK_DELAYER.PAYLOAD);
			argument0[@ GMTWERK_DELAYER.STATE] = GMTWERK_STATE.DONE;
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_DELAYER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		if (argument0[@ GMTWERK_DELAYER.RUN_ON_INTERRUPT]) {
			__gmtwerk_payload__(argument0, GMTWERK_DELAYER.PAYLOAD);
		}
		__gmtwerk_payload__(argument0, GMTWERK_DELAYER.ON_INTERRUPT);
		argument0[@ GMTWERK_DELAYER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
