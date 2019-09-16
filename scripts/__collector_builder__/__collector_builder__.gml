///@func __collector_builder__(n, orMode, keepAlive, onTrigger, onInterrupt, runOnInterrupt)
///@param n
///@param orMode
///@param keepAlive
///@param onTrigger
///@param onInterrupt
///@param runOnInterrupt

enum GMTWERK_COLLECTOR {
	TYPE,
	STATE,
	N,
	TRIGGER_BANK,
	OR_MODE,
	KEEP_ALIVE,
	ON_TRIGGER,
	ON_TRIGGER_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS,
	RUN_ON_INTERRUPT
}

return [
	__collector_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	argument0, //n
	(argument0 <= 30) ? int64(0) : array_create(argument0, false), //triggerBank
	argument1, //orMode
	argument2, //keepAlive
	is_array(argument3) ? argument3[0] : argument3, //onTrigger
	is_array(argument3) ? argument3[1] : undefined, //onTriggerArgs
	is_array(argument4) ? argument4[0] : argument4, //onInterrupt
	is_array(argument4) ? argument4[1] : undefined, //onInterruptArgs
	argument5 //runOnInterrupt
];
