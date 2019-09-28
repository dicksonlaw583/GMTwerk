///@func __tracker_runner__(tracker, timeUnits, mode)
///@param tracker
///@param timeUnits
///@param mode (1=run, 0=suspend, -1=done, -2=interrupt)

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var sourceSelector = argument0[GMTWERK_TRACKER.SOURCE_SELECTOR];
		var targetSelector = argument0[GMTWERK_TRACKER.TARGET_SELECTOR];
		if (gmtwerk_var_exists(sourceSelector) && gmtwerk_var_exists(targetSelector)) {
			var tweenKernel = argument0[GMTWERK_TRACKER.TWEEN];
			var tweenKernelArgs = argument0[GMTWERK_TRACKER.TWEEN_ARGS];
			var memory = argument0[GMTWERK_TRACKER.MEMORY];
			var src = argument0[GMTWERK_TRACKER.SOURCE_VALUE];
			var tgt = argument0[GMTWERK_TRACKER.TARGET_VALUE];
			// If not already tweening
			if (is_undefined(memory)) {
				// If source selector and target selector values differ
				var sourceSelectorValue = gmtwerk_var_get(sourceSelector);
				var targetSelectorValue = gmtwerk_var_get(targetSelector);
				if (sourceSelectorValue != targetSelectorValue) {
					// Boot tweening memory
					argument0[@ GMTWERK_TRACKER.MEMORY] = [];
					memory = argument0[GMTWERK_TRACKER.MEMORY];
					argument0[@ GMTWERK_TRACKER.SOURCE_VALUE] = sourceSelectorValue;
					argument0[@ GMTWERK_TRACKER.TARGET_VALUE] = targetSelectorValue;
					src = sourceSelectorValue;
					tgt = targetSelectorValue;
					script_execute(tweenKernel, tweenKernelArgs, memory, 0, sourceSelectorValue, targetSelectorValue, undefined);
					// Run onNudge
					__gmtwerk_payload__(argument0, GMTWERK_TRACKER.ON_NUDGE);
				}
			// If already tweening or starting (yin-yang if block is intentional, want same-step trigger)
			}
			if (!is_undefined(memory)) {
				gmtwerk_var_set(sourceSelector, script_execute(tweenKernel, tweenKernelArgs, memory, 1, src, tgt, argument1));	
				if (script_execute(tweenKernel, tweenKernelArgs, memory, 2, src, tgt, undefined)) {
					__gmtwerk_payload__(argument0, GMTWERK_TRACKER.ON_DONE);
					argument0[@ GMTWERK_TRACKER.MEMORY] = undefined;
				}
			}
		} else {
			argument0[@ GMTWERK_TRACKER.STATE] = GMTWERK_STATE.LOST;
			__gmtwerk_payload__(argument0, GMTWERK_TRACKER.ON_LOST);
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_TRACKER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.DONE:
		gmtwerk_var_set(argument0[GMTWERK_TRACKER.SOURCE_SELECTOR], argument0[GMTWERK_TRACKER.TARGET_VALUE]);
		__gmtwerk_payload__(argument0, GMTWERK_TRACKER.ON_DONE);
		argument0[@ GMTWERK_TRACKER.MEMORY] = undefined;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_TRACKER.ON_INTERRUPT);
		if (argument0[GMTWERK_TRACKER.SNAP_ON_INTERRUPT]) {
			gmtwerk_var_set(argument0[GMTWERK_TRACKER.SOURCE_SELECTOR], argument0[GMTWERK_TRACKER.TARGET_VALUE]);
		}
		argument0[@ GMTWERK_TRACKER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
