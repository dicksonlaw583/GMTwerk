///@func __responder_builder__(conditionPayload, onTrigger, keepAlive, onUntrigger, onInterrupt)
///@param conditionPayload
///@param onTrigger
///@param keepAlive
///@param onUntrigger
///@param onInterrupt

enum GMTWERK_RESPONDER {
	STATE,
	LAST_CONDITION,
	CONDITION_PAYLOAD,
	CONDITION_PAYLOAD_ARGS,
	KEEP_ALIVE,
	ON_TRIGGER,
	ON_TRIGGER_ARGS,
	ON_UNTRIGGER,
	ON_UNTRIGGER_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS
}

return [
	GMTWERK_STATE.ACTIVE, //state
	false, //lastcondition
	is_array(argument0) ? argument0[0] : argument0, //conditionPayload
	is_array(argument0) ? argument0[1] : undefined, //conditionPayloadArgs
	argument2, //keepAlive
	is_array(argument1) ? argument1[0] : argument1, //onTrigger
	is_array(argument1) ? argument1[1] : undefined, //onTriggerArgs
	is_array(argument3) ? argument3[0] : argument3, //onUntrigger
	is_array(argument3) ? argument3[1] : undefined, //onUntriggerArgs
	is_array(argument4) ? argument4[0] : argument4, //onInterrupt
	is_array(argument4) ? argument4[1] : undefined //onInterruptArgs
];
