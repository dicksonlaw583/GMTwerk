///@func Collector(n, onTrigger, ...)
///@param n Number of listening slots (0 through n-1)
///@param onTrigger

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);

var n = args[0];
var onTrigger = args[1];
var onInterrupt = undefined;
var forceHelper = false;
var orMode = false;
var keepAlive = false;
var runOnInterrupt = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "keepAlive":
			keepAlive = true;
		break;
		case "forceHelper":
			forceHelper = true;
		break;
		case "and":
			orMode = false;
		break;
		case "or":
			orMode = true;
		break;
		case "runOnInterrupt":
			runOnInterrupt = true;
		break;
	}
}

// Insert worker made to order
__gmtwerk_insert__(__collector_builder__(n, orMode, keepAlive, onTrigger, onInterrupt, runOnInterrupt), forceHelper);
