///@func __tweener_runner__(tweener, timeUnits, mode)
///@param tweener
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var selector = argument0[GMTWERK_TWEENER.SELECTOR];
		if (gmtwerk_var_exists(selector)) {
			var tweenKernel = argument0[GMTWERK_TWEENER.TWEEN];
			var tweenKernelArgs = argument0[GMTWERK_TWEENER.TWEEN_ARGS];
			var memory = argument0[GMTWERK_TWEENER.MEMORY];
			var src = argument0[GMTWERK_TWEENER.SOURCE_VALUE];
			var tgt = argument0[GMTWERK_TWEENER.TARGET_VALUE];
			gmtwerk_var_set(selector, script_execute(tweenKernel, tweenKernelArgs, memory, 1, src, tgt, argument1));
			if (script_execute(tweenKernel, tweenKernelArgs, memory, 2, src, tgt, undefined)) {
				argument0[@ GMTWERK_TWEENER.STATE] = GMTWERK_STATE.DONE;
				__gmtwerk_payload__(argument0, GMTWERK_TWEENER.ON_DONE);
			}
		} else {
			argument0[@ GMTWERK_TWEENER.STATE] = GMTWERK_STATE.LOST;
			__gmtwerk_payload__(argument0, GMTWERK_TWEENER.ON_LOST);
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_TWEENER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_TWEENER.ON_INTERRUPT);
		if (argument0[GMTWERK_TWEENER.SNAP_ON_INTERRUPT]) {
			gmtwerk_var_set(argument0[GMTWERK_TWEENER.SELECTOR], argument0[GMTWERK_TWEENER.TARGET_VALUE]);
		}
		argument0[@ GMTWERK_TWEENER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
