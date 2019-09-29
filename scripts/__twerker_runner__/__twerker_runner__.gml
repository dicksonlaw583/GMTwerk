///@func __twerker_runner__(twerker, timeUnits, mode)
///@param twerker
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var selector = argument0[GMTWERK_TWERKER.SELECTOR];
		var times = argument0[GMTWERK_TWERKER.TIMES];
		if (gmtwerk_var_exists(selector)) {
			var twerkKernel = argument0[GMTWERK_TWERKER.TWERK_TYPE];
			var twerkKernelArgs = argument0[GMTWERK_TWERKER.TWERK_TYPE_ARGS];
			var memory = argument0[GMTWERK_TWERKER.MEMORY];
			var src = argument0[GMTWERK_TWERKER.SOURCE_VALUE];
			var tgt = argument0[GMTWERK_TWERKER.TARGET_VALUE];
			gmtwerk_var_set(selector, script_execute(twerkKernel, twerkKernelArgs, memory, 1, src, tgt, argument1));
			if (!is_undefined(times) && script_execute(twerkKernel, twerkKernelArgs, memory, 2, src, tgt, undefined) >= times) {
				argument0[@ GMTWERK_TWERKER.STATE] = GMTWERK_STATE.DONE;
				__gmtwerk_payload__(argument0, GMTWERK_TWERKER.ON_DONE);
			}
		} else {
			argument0[@ GMTWERK_TWERKER.STATE] = GMTWERK_STATE.LOST;
			__gmtwerk_payload__(argument0, GMTWERK_TWERKER.ON_LOST);
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_TWERKER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.DONE:
		gmtwerk_var_set(argument0[GMTWERK_TWERKER.SELECTOR], argument0[GMTWERK_TWERKER.SOURCE_VALUE]);
		argument0[@ GMTWERK_TWERKER.STATE] = GMTWERK_STATE.DONE;
		__gmtwerk_payload__(argument0, GMTWERK_TWERKER.ON_DONE);
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_TWERKER.ON_INTERRUPT);
		if (argument0[GMTWERK_TWERKER.SNAP_ON_INTERRUPT]) {
			gmtwerk_var_set(argument0[GMTWERK_TWERKER.SELECTOR], argument0[GMTWERK_TWERKER.SOURCE_VALUE]);
		}
		argument0[@ GMTWERK_TWERKER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
