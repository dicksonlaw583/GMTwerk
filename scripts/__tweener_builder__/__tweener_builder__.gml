///@func __tweener_builder__(selector, targetValue, tween, onDone, onLost, onInterrupt, snapOnInterrupt)
///@param selector
///@param targetValue
///@param tween
///@param onDone
///@param onLost
///@param onInterrupt
///@param snapOnInterrupt

enum GMTWERK_TWEENER {
	TYPE,
	STATE,
	SELECTOR,
	SOURCE_VALUE,
	TARGET_VALUE,
	MEMORY,
	TWEEN,
	TWEEN_ARGS,
	ON_DONE,
	ON_DONE_ARGS,
	ON_LOST,
	ON_LOST_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS,
	SNAP_ON_INTERRUPT
}

// Boot the actor's memory
var _memory =  [];
var _tween = is_array(argument2) ? argument2[0] : argument2;
var _tweenArgs = is_array(argument2) ? argument2[1] : undefined;
var _sourceValue = gmtwerk_var_get(argument0);
script_execute(_tween, _tweenArgs, _memory, 0, _sourceValue, argument1, undefined);

// Build the actor
return [
	__tweener_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	argument0, //selector
	_sourceValue, //sourceValue
	argument1, //targetValue
	_memory, //memory
	_tween, //tween
	_tweenArgs, //tweenArgs
	is_array(argument3) ? argument3[0] : argument3, //onDone
	is_array(argument3) ? argument3[1] : undefined, //onDoneArgs
	is_array(argument4) ? argument4[0] : argument4, //onLost
	is_array(argument4) ? argument4[1] : undefined, //onLostArgs
	is_array(argument5) ? argument5[0] : argument5, //onInterrupt
	is_array(argument5) ? argument5[1] : undefined, //onInterruptArgs
	argument6 //snapOnInterrupt
];
