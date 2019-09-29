///@func __twerker_builder__(selector, targetValue, times, twerkType, onDone, onLost, onInterrupt, snapOnInterrupt)
///@param selector
///@param targetValue
///@param times
///@param twerkType
///@param onDone
///@param onLost
///@param onInterrupt
///@param snapOnInterrupt

enum GMTWERK_TWERKER {
	TYPE,
	STATE,
	SELECTOR,
	SOURCE_VALUE,
	TARGET_VALUE,
	TIMES,
	MEMORY,
	TWERK_TYPE,
	TWERK_TYPE_ARGS,
	ON_DONE,
	ON_DONE_ARGS,
	ON_LOST,
	ON_LOST_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS,
	SNAP_ON_INTERRUPT
}

var twerkType = is_array(argument3) ? argument3[0] : argument3;
var twerkTypeArgs = is_array(argument3) ? argument3[1] : undefined;
var sourceValue = gmtwerk_var_get(argument0);
var memory = [];
script_execute(twerkType, twerkTypeArgs, memory, 0, sourceValue, argument1, undefined);

return [
	__twerker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	argument0, //selector
	sourceValue, //sourceValue
	argument1, //targetValue
	argument2, //times
	memory, //memory
	twerkType, //twerkType
	twerkTypeArgs, //twerkTypeArgs
	is_array(argument4) ? argument4[0] : argument4, //onDone
	is_array(argument4) ? argument4[1] : undefined, //onDoneArgs
	is_array(argument5) ? argument5[0] : argument5, //onLost
	is_array(argument5) ? argument5[1] : undefined, //onLostArgs
	is_array(argument6) ? argument6[0] : argument6, //onInterrupt
	is_array(argument6) ? argument6[1] : undefined, //onInterruptArgs
	argument7 //snapOnInterrupt
];
