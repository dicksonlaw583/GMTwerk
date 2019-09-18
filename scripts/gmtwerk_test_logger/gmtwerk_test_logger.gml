///@func gmtwerk_test_logger()

var got, expected, logger;

#region Test builder 1
global.__gmtwerk_log_value__ = " ";
expected = [
	__logger_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GMTWERK_LOGGER_MODE.PERIODIC, //mode
	10, //time
	10, //resetTime
	GlobalVar("__gmtwerk_log_value__"), //selector
	3, //size
	0, //logIndex
	[" ", "", ""], //logArray
	gmtwerk_suite_callback, //onLog
	undefined, //onLogArgs
	undefined, //onLost
	undefined, //onLostArgs
	undefined, //onInterrupt
	undefined //onInterruptArgs
];
got = __logger_builder__(GMTWERK_LOGGER_MODE.PERIODIC, 10, GlobalVar("__gmtwerk_log_value__"), "", 3, gmtwerk_suite_callback, undefined, undefined);
assert_equal(got, expected, "Logger builder test 1 failed");
assert_equal(gmtwerk_logger_get(got, 0), " ", "Logger builder test 1 base value failed");
assert_equal(gmtwerk_logger_get(got, 1), "", "Logger builder test 1 base value failed");
assert_equal(gmtwerk_logger_get(got, 2), "", "Logger builder test 1 base value failed");
#endregion

#region Test builder 2
global.__gmtwerk_log_value__ = "X";
expected = [
	__logger_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GMTWERK_LOGGER_MODE.CHANGE_ONLY, //mode
	15, //time
	15, //resetTime
	GlobalVar("__gmtwerk_log_value__"), //selector
	2, //size
	0, //logIndex
	["X", "x"], //logArray
	undefined, //onLog
	undefined, //onLogArgs
	gmtwerk_suite_callback, //onLost
	undefined, //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	"ghi" //onInterruptArgs
];
got = __logger_builder__(GMTWERK_LOGGER_MODE.CHANGE_ONLY, 15, GlobalVar("__gmtwerk_log_value__"), "x", 2, undefined, gmtwerk_suite_callback, [gmtwerk_suite_callback, "ghi"]);
assert_equal(got, expected, "Logger builder test 1 failed");
assert_equal(gmtwerk_logger_get(got, 0), "X", "Logger builder test 2 base value failed");
assert_equal(gmtwerk_logger_get(got, 1), "x", "Logger builder test 2 base value failed");
#endregion

#region Test builder 3
global.__gmtwerk_log_value__ = "Y";
expected = [
	__logger_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GMTWERK_LOGGER_MODE.PERIODIC_CHANGE_ONLY, //mode
	20, //time
	20, //resetTime
	GlobalVar("__gmtwerk_log_value__"), //selector
	3, //size
	0, //logIndex
	["Y", "y", "y"], //logArray
	gmtwerk_suite_callback, //onLog
	"abc", //onLogArgs
	gmtwerk_suite_callback, //onLost
	"def", //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	undefined //onInterruptArgs
];
got = __logger_builder__(GMTWERK_LOGGER_MODE.PERIODIC_CHANGE_ONLY, 20, GlobalVar("__gmtwerk_log_value__"), "y", 3, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], gmtwerk_suite_callback);
assert_equal(got, expected, "Logger builder test 3 failed");
assert_equal(gmtwerk_logger_get(got, 0), "Y", "Logger builder test 3 base value failed");
assert_equal(gmtwerk_logger_get(got, 1), "y", "Logger builder test 3 base value failed");
assert_equal(gmtwerk_logger_get(got, 2), "y", "Logger builder test 3 base value failed");
#endregion

#region Logger periodic run
global.__gmtwerk_log_value__ = "begin";
gmtwerk_suite_callreset();
logger = __logger_builder__(GMTWERK_LOGGER_MODE.PERIODIC, 2, GlobalVar("__gmtwerk_log_value__"), "", 2, gmtwerk_suite_callback, undefined, [gmtwerk_suite_callback, "int"]);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic run step 0");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic run step 0");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic run step 0");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic run step 1");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic run step 1");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic run step 1");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic run step 2");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic run step 2");
assert_equal(gmtwerk_suite_calls("begin"), 1, "Logger periodic run step 2");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic run step 3");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic run step 3");
assert_equal(gmtwerk_suite_calls("begin"), 1, "Logger periodic run step 3");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic run step 4");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic run step 4");
assert_equal(gmtwerk_suite_calls("begin"), 1, "Logger periodic run step 4");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger periodic run step 4");
global.__gmtwerk_log_value__ = "begin3";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic run step 5");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic run step 5");
assert_equal(gmtwerk_suite_calls("begin"), 1, "Logger periodic run step 5");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger periodic run step 5");
assert_equal(gmtwerk_suite_calls("begin3"), 0, "Logger periodic run step 5");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic run step 6");
assert_equal(gmtwerk_logger_get(logger, 1), "begin2", "Logger periodic run step 6");
assert_equal(gmtwerk_suite_calls("begin"), 1, "Logger periodic run step 6");
assert_equal(gmtwerk_suite_calls("begin2"), 2, "Logger periodic run step 6");
assert_equal(gmtwerk_suite_calls("begin3"), 0, "Logger periodic run step 6");
#endregion

#region Logger on-change run
global.__gmtwerk_log_value__ = "begin";
gmtwerk_suite_callreset();
logger = __logger_builder__(GMTWERK_LOGGER_MODE.CHANGE_ONLY, 0, GlobalVar("__gmtwerk_log_value__"), "", 2, gmtwerk_suite_callback, undefined, [gmtwerk_suite_callback, "int"]);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger on-change run step 0");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger on-change run step 0");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 0");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger on-change run step 1");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger on-change run step 1");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 1");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger on-change run step 2");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger on-change run step 2");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 2");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger on-change run step 3");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger on-change run step 3");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 3");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger on-change run step 3");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger on-change run step 4");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger on-change run step 4");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 4");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger on-change run step 4");
global.__gmtwerk_log_value__ = "begin3";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin3", "Logger on-change run step 5");
assert_equal(gmtwerk_logger_get(logger, 1), "begin2", "Logger on-change run step 5");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 5");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger on-change run step 5");
assert_equal(gmtwerk_suite_calls("begin3"), 1, "Logger on-change run step 5");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger on-change run step 6");
assert_equal(gmtwerk_logger_get(logger, 1), "begin3", "Logger on-change run step 6");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger on-change run step 6");
assert_equal(gmtwerk_suite_calls("begin2"), 2, "Logger on-change run step 6");
assert_equal(gmtwerk_suite_calls("begin3"), 1, "Logger on-change run step 6");
#endregion

#region Logger periodic on-change run
global.__gmtwerk_log_value__ = "begin";
gmtwerk_suite_callreset();
logger = __logger_builder__(GMTWERK_LOGGER_MODE.PERIODIC_CHANGE_ONLY, 2, GlobalVar("__gmtwerk_log_value__"), "", 2, gmtwerk_suite_callback, undefined, [gmtwerk_suite_callback, "int"]);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic-change run step 0");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic-change run step 0");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 0");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic-change run step 1");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic-change run step 1");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 1");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic-change run step 2");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic-change run step 2");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 2");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin", "Logger periodic-change run step 3");
assert_equal(gmtwerk_logger_get(logger, 1), "", "Logger periodic-change run step 3");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 3");
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic-change run step 4");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic-change run step 4");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 4");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger periodic-change run step 4");
global.__gmtwerk_log_value__ = "begin3";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic-change run step 5");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic-change run step 5");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 5");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger periodic-change run step 5");
assert_equal(gmtwerk_suite_calls("begin3"), 0, "Logger periodic-change run step 5");
global.__gmtwerk_log_value__ = "begin2";
__logger_runner__(logger, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_logger_get(logger, 0), "begin2", "Logger periodic-change run step 6");
assert_equal(gmtwerk_logger_get(logger, 1), "begin", "Logger periodic-change run step 6");
assert_equal(gmtwerk_suite_calls("begin"), 0, "Logger periodic-change run step 6");
assert_equal(gmtwerk_suite_calls("begin2"), 1, "Logger periodic-change run step 6");
assert_equal(gmtwerk_suite_calls("begin3"), 0, "Logger periodic-change run step 6");
#endregion

// Cleanup
gmtwerk_suite_callreset();
