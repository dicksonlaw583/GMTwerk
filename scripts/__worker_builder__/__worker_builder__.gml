///@func __worker_builder__(work, memory, onDone, onInterrupt)
///@param work
///@param memory
///@param onDone
///@param onInterrupt
///@param cleanOnInterrupt

enum GMTWERK_WORKER {
	TYPE,
	STATE,
	WORK,
	WORK_ARGS,
	MEMORY,
	ON_DONE,
	ON_DONE_ARGS,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS,
	CLEAN_ON_INTERRUPT
}

return [
	__worker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	is_array(argument0) ? argument0[0] : argument0, //work
	is_array(argument0) ? argument0[1] : undefined, //workArgs
	argument1, //memory
	is_array(argument2) ? argument2[0] : argument2, //onDone
	is_array(argument2) ? argument2[1] : undefined, //onDoneArgs
	is_array(argument3) ? argument3[0] : argument3, //onInterrupt
	is_array(argument3) ? argument3[1] : undefined, //onInterruptArgs
	argument4
];
