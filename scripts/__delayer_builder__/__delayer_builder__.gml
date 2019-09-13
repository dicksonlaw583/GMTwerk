///@func __delayer_builder__(timeUnits, payload, onInterrupt, runOnInterrupt)
///@param timeUnits
///@param payload
///@param onInterrupt
///@param runOnInterrupt

enum GMTWERK_DELAYER {
	TYPE,
	STATE,
	TIME,
	PAYLOAD,
	PAYLOAD_ARGS,
	RUN_ON_INTERRUPT,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS
}

return [
	__delayer_runner__,
	GMTWERK_STATE.ACTIVE, //state
	argument0, //timeUnits
	is_array(argument1) ? argument1[0] : argument1, //payload
	is_array(argument1) ? argument1[1] : undefined, //payloadArgs
	argument3, //runOnInterrupt
	is_array(argument2) ? argument2[0] : argument2, //onInterrupt
	is_array(argument2) ? argument2[1] : undefined //onInterruptArgs
];
