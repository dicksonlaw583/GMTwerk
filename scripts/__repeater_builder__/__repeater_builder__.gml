///@func __repeater_builder__(timeUnits, times, reloadTime, payload, onInterrupt, runOnInterrupt)
///@param timeUnits
///@param times
///@param reloadTime
///@param payload
///@param onInterrupt
///@param runOnInterrupt

enum GMTWERK_REPEATER {
	TYPE,
	STATE,
	TIME,
	TIMES,
	RELOAD_TIME,
	PAYLOAD,
	PAYLOAD_ARGS,
	RUN_ON_INTERRUPT,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS
}

return [
	__repeater_runner__,
	GMTWERK_STATE.ACTIVE, //state
	argument0, //timeUnits
	argument1, //times
	argument2, //reloadTime
	is_array(argument3) ? argument3[0] : argument3, //payload
	is_array(argument3) ? argument3[1] : undefined, //payloadArgs
	argument5, //runOnInterrupt
	is_array(argument4) ? argument4[0] : argument4, //onInterrupt
	is_array(argument4) ? argument4[1] : undefined //onInterruptArgs
];