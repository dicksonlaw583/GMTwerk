///@func __logger_builder__(captureMode, time, selector, startValue, size, onLog, onLost, onInterrupt)
///@param captureMode
///@param time
///@param selector
///@param startValue
///@param size
///@param onLog
///@param onLost
///@param onInterrupt

enum GMTWERK_LOGGER_MODE {
	PERIODIC = 1,
	CHANGE_ONLY = 0,
	PERIODIC_CHANGE_ONLY = -1
}

enum GMTWERK_LOGGER {
	TYPE,
	STATE,
	MODE,
	TIME,
	RESET_TIME,
	SELECTOR,
	SIZE,
	LOG_INDEX,
	LOG_ARRAY,
	ON_LOG,
	ON_LOG_ARGS,
	ON_LOST,
	ON_LOST_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS
}

var selectorValue = gmtwerk_var_get(argument2);
var logArray = array_create(argument4, argument3);
logArray[@ 0] = selectorValue;

return [
	__logger_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	argument0, //mode
	argument1, //time
	argument1, //resetTime
	argument2, //selector
	argument4, //size
	0, //logIndex
	logArray, //logArray
	is_array(argument5) ? argument5[0] : argument5, //onLog
	is_array(argument5) ? argument5[1] : undefined, //onLogArgs
	is_array(argument6) ? argument6[0] : argument6, //onLost
	is_array(argument6) ? argument6[1] : undefined, //onLostArgs
	is_array(argument7) ? argument7[0] : argument7, //onInterrupt
	is_array(argument7) ? argument7[1] : undefined //onInterruptArgs
];
