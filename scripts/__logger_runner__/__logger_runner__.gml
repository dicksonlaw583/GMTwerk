///@func __logger_runner__(logger, timeUnits, mode)
///@param logger
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var selector = argument0[GMTWERK_LOGGER.SELECTOR];
		if (gmtwerk_var_exists(selector)) {
			switch (argument0[GMTWERK_LOGGER.MODE]) {
				case GMTWERK_LOGGER_MODE.PERIODIC:
					argument0[@ GMTWERK_LOGGER.TIME] -= argument1;
					while (argument0[GMTWERK_LOGGER.TIME] <= 0) {
						var currentValue = gmtwerk_var_get(selector);
						var logArray = argument0[GMTWERK_LOGGER.LOG_ARRAY];
						var insertIndex = (argument0[GMTWERK_LOGGER.LOG_INDEX]+1) mod argument0[GMTWERK_LOGGER.SIZE];
						logArray[@ insertIndex] = currentValue;
						argument0[@ GMTWERK_LOGGER.LOG_INDEX] = insertIndex;
						if (!is_undefined(argument0[GMTWERK_LOGGER.ON_LOG])) {
							script_execute(argument0[GMTWERK_LOGGER.ON_LOG], currentValue, argument0[GMTWERK_LOGGER.ON_LOG_ARGS]);
						}
						argument0[@ GMTWERK_LOGGER.TIME] += argument0[GMTWERK_LOGGER.RESET_TIME];
					}
				break;
				case GMTWERK_LOGGER_MODE.CHANGE_ONLY:
					var currentValue = gmtwerk_var_get(selector);
					var logArray = argument0[GMTWERK_LOGGER.LOG_ARRAY];
					if (currentValue != logArray[argument0[GMTWERK_LOGGER.LOG_INDEX]]) {
						var insertIndex = (argument0[GMTWERK_LOGGER.LOG_INDEX]+1) mod argument0[GMTWERK_LOGGER.SIZE];
						logArray[@ insertIndex] = currentValue;
						argument0[@ GMTWERK_LOGGER.LOG_INDEX] = insertIndex;
						if (!is_undefined(argument0[GMTWERK_LOGGER.ON_LOG])) {
							script_execute(argument0[GMTWERK_LOGGER.ON_LOG], currentValue, argument0[GMTWERK_LOGGER.ON_LOG_ARGS]);
						}
					}
				break;
				case GMTWERK_LOGGER_MODE.PERIODIC_CHANGE_ONLY:
					argument0[@ GMTWERK_LOGGER.TIME] -= argument1;
					while (argument0[GMTWERK_LOGGER.TIME] <= 0) {
						var currentValue = gmtwerk_var_get(selector);
						var logArray = argument0[GMTWERK_LOGGER.LOG_ARRAY];
						if (currentValue != logArray[argument0[GMTWERK_LOGGER.LOG_INDEX]]) {
							var insertIndex = (argument0[GMTWERK_LOGGER.LOG_INDEX]+1) mod argument0[GMTWERK_LOGGER.SIZE];
							logArray[@ insertIndex] = currentValue;
							argument0[@ GMTWERK_LOGGER.LOG_INDEX] = insertIndex;
							if (!is_undefined(argument0[GMTWERK_LOGGER.ON_LOG])) {
								script_execute(argument0[GMTWERK_LOGGER.ON_LOG], currentValue, argument0[GMTWERK_LOGGER.ON_LOG_ARGS]);
							}
						}
						argument0[@ GMTWERK_LOGGER.TIME] += argument0[GMTWERK_LOGGER.RESET_TIME];
					}
				break;
			}
		} else {
			__gmtwerk_payload__(argument0, GMTWERK_LOGGER.ON_LOST);
		}
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_LOGGER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_LOGGER.ON_INTERRUPT);
		argument0[@ GMTWERK_LOGGER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
