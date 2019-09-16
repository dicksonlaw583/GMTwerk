///@func __collector_runner__(collector, timeUnits, mode)
///@param collector
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
var timeUnits = argument1; // Inert for this actor type

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var triggered = false,
				triggerBank = argument0[GMTWERK_COLLECTOR.TRIGGER_BANK];
		if (is_array(triggerBank)) {
			if (argument0[GMTWERK_COLLECTOR.OR_MODE]) {
				triggered = false;
				for (var i = argument0[GMTWERK_COLLECTOR.N]-1; i >= 0; i--) {
					if (triggerBank[i]) {
						triggered = true;
						break;
					}
				}
			} else {
				triggered = true;
				for (var i = argument0[GMTWERK_COLLECTOR.N]-1; i >= 0; i--) {
					if (!triggerBank[i]) {
						triggered = false;
						break;
					}
				}
			}
		} else {
			if (argument0[GMTWERK_COLLECTOR.OR_MODE]) {
				triggered = triggerBank != 0;
			} else {
				triggered = triggerBank == (1<<argument0[GMTWERK_COLLECTOR.N])-1;
			}
		}
		if (triggered) {
			__gmtwerk_payload__(argument0, GMTWERK_COLLECTOR.ON_TRIGGER);
			if (argument0[GMTWERK_COLLECTOR.KEEP_ALIVE]) {
				if (is_array(triggerBank)) {
					for (var i = argument0[GMTWERK_COLLECTOR.N]-1; i >= 0; i--) {
						triggerBank[@ i] = false;
					}
				} else {
					argument0[@ GMTWERK_COLLECTOR.TRIGGER_BANK] = 0;
				}
			} else {
				argument0[@ GMTWERK_COLLECTOR.STATE] = GMTWERK_STATE.DONE;
			}
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_COLLECTOR.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		if (argument0[GMTWERK_COLLECTOR.RUN_ON_INTERRUPT]) {
			__gmtwerk_payload__(argument0, GMTWERK_COLLECTOR.ON_TRIGGER);
		}
		__gmtwerk_payload__(argument0, GMTWERK_COLLECTOR.ON_INTERRUPT);
		argument0[@ GMTWERK_COLLECTOR.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
