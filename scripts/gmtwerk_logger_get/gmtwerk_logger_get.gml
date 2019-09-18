///@func gmtwerk_logger_get(logger, n)
///@param logger
///@param n

// Capture arguments
var arg;
var logger, n;
if (argument_count == 1) {
	arg = argument[0];
	logger = arg[0];
	n = arg[1];
} else {
	logger = argument[0];
	n = argument[1];
}

// Return backwards from log
var logSize = logger[GMTWERK_LOGGER.SIZE];
var logArray = logger[GMTWERK_LOGGER.LOG_ARRAY];
return logArray[(logger[GMTWERK_LOGGER.LOG_INDEX]+logSize-n) mod logSize];
