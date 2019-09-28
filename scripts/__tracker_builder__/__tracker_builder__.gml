///@func __tracker_builder__(sourceSelector, targetSelector, tween, onNudge, onDone, onLost, onInterrupt, snapOnInterrupt)
///@param sourceSelector
///@param targetSelector
///@param tween
///@param onNudge
///@param onDone
///@param onLost
///@param onInterrupt
///@param snapOnInterrupt

enum GMTWERK_TRACKER {
	TYPE,
	STATE,
	SOURCE_SELECTOR,
	TARGET_SELECTOR,
	SOURCE_VALUE,
	TARGET_VALUE,
	MEMORY,
	TWEEN,
	TWEEN_ARGS,
	ON_NUDGE,
	ON_NUDGE_ARGS,
	ON_DONE,
	ON_DONE_ARGS,
	ON_LOST,
	ON_LOST_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS,
	SNAP_ON_INTERRUPT
}

return [
	__tracker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	argument0, //sourceSelector
	argument1, //targetSelector
	undefined, //sourceValue
	undefined, //targetValue
	undefined, //memory
	is_array(argument2) ? argument2[0] : argument2, //tween
	is_array(argument2) ? argument2[1] : undefined, //tweenArgs
	is_array(argument3) ? argument3[0] : argument3, //onNudge
	is_array(argument3) ? argument3[1] : undefined, //onNudgeArgs
	is_array(argument4) ? argument4[0] : argument4, //onDone
	is_array(argument4) ? argument4[1] : undefined, //onDoneArgs
	is_array(argument5) ? argument5[0] : argument5, //onLost
	is_array(argument5) ? argument5[1] : undefined, //onLostArgs
	is_array(argument6) ? argument6[0] : argument6, //onInterrupt
	is_array(argument6) ? argument6[1] : undefined, //onInterruptArgs
	argument7 //snapOnInterrupt
];
