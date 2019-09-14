///@func __worker_runner__(worker, timeUnits, mode)
///@param worker
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
var timeUnits = argument1; // Inert for this actor type
switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var workResult = script_execute(argument0[GMTWERK_WORKER.WORK], argument0[GMTWERK_WORKER.WORK_ARGS], argument0[GMTWERK_WORKER.MEMORY], false);
		if (workResult) {
			argument0[@ GMTWERK_WORKER.STATE] = GMTWERK_STATE.DONE;
			__gmtwerk_payload__(argument0, GMTWERK_WORKER.ON_DONE);
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_WORKER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		if (argument0[GMTWERK_WORKER.CLEAN_ON_INTERRUPT]) {
			script_execute(argument0[GMTWERK_WORKER.WORK], argument0[GMTWERK_WORKER.WORK_ARGS], argument0[GMTWERK_WORKER.MEMORY], true);
		}
		__gmtwerk_payload__(argument0, GMTWERK_WORKER.ON_INTERRUPT);
		argument0[@ GMTWERK_WORKER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
