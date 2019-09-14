///@func Worker(work, ...)
///@param work Payload that does things and then returns whether it is finished

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);
var work = args[0];
var memory = [];
var onDone = undefined;
var onInterrupt = undefined;
var forceHelper = false;
var cleanOnInterrupt = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "memory":
			memory = args[++i];
		break;
		case "onDone":
			onDone = args[++i];
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "cleanOnInterrupt":
			cleanOnInterrupt = true;
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert worker made to order
__gmtwerk_insert__(__worker_builder__(work, memory, onDone, onInterrupt, cleanOnInterrupt), forceHelper);
