///@func __timekeeper_builder__(timeUnits, countup, payloads, keepGoing, onInterrupt)
///@param timeUnits
///@param countup
///@param payloads
///@param keepGoing
///@param onInterrupt

enum GMTWERK_TIMEKEEPER {
	TYPE,
	STATE,
	TIME,
	COUNTUP,
	PAYLOADS,
	KEEP_GOING,
	ON_INTERRUPT,
	ON_INTERRUPT_ARGS
}

// Flatten the payloads argument
var payloadsCount = array_length_1d(argument2);
var payloads = array_create(3*(payloadsCount div 2));
var ii = 0;
for (var i = 0; i < payloadsCount; i += 2) {
	var payload = argument2[i+1];
	payloads[ii] = argument2[i];
	payloads[ii+1] = is_array(payload) ? payload[0] : payload;
	payloads[ii+2] = is_array(payload) ? payload[1] : undefined;
	ii += 3;
}

return [
	__timekeeper_runner__,
	GMTWERK_STATE.ACTIVE, //state
	argument0, //timeUnits
	argument1, //countup
	payloads, //payloads
	argument3, //keepGoing
	is_array(argument4) ? argument4[0] : argument4, //onInterrupt
	is_array(argument4) ? argument4[1] : undefined //onInterruptArgs
];
