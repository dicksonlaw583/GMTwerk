///@func gmtwerk_test_timekeeper()

var got, expected, timekeeper;

// Test builder 1
expected = [
	__timekeeper_runner__,
	GMTWERK_STATE.ACTIVE, //state
	0, //timeUnits
	true, //countup
	[30, gmtwerk_suite_callback, undefined, 60, gmtwerk_suite_callback, "ABC"], //payloads
	true, //keepGoing
	undefined, //onInterrupt
	undefined //onInterruptArgs
];
got = __timekeeper_builder__(0, true, [30, gmtwerk_suite_callback, 60, [gmtwerk_suite_callback, "ABC"]], true, undefined);
assert_equal(got, expected, "Timekeeper builder test 1 failed");

// Test builder 2
expected = [
	__timekeeper_runner__,
	GMTWERK_STATE.ACTIVE, //state
	300, //timeUnits
	false, //countup
	[100, gmtwerk_suite_callback, "1", 60, gmtwerk_suite_callback, "2"], //payloads
	false, //keepGoing
	gmtwerk_suite_callback, //onInterrupt
	"3" //onInterruptArgs
];
got = __timekeeper_builder__(300, false, [100, [gmtwerk_suite_callback, "1"], 60, [gmtwerk_suite_callback, "2"]], false, [gmtwerk_suite_callback, "3"]);
assert_equal(got, expected, "Timekeeper builder test 2 failed");

// Test simple countup with callback and keep going
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(0, true, [2, [gmtwerk_suite_callback, "abc"], 3, [gmtwerk_suite_callback, "def"]], true, undefined);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 1 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 1 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 1 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 1 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 1 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 1 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 2, "Timekeeper test run 1 step 2 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 1 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 1 step 3");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 1 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 3, "Timekeeper test run 1 step 3 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 1 step 3 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 1 step 4");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 1 step 4");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 4, "Timekeeper test run 1 step 4 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 1 step 4 state");

// Test simple countup with callback and no keep going
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(0, true, [2, [gmtwerk_suite_callback, "abc"], 3, [gmtwerk_suite_callback, "def"]], false, undefined);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 2 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 2 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 2 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 2 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 2 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 2, "Timekeeper test run 2 step 2 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 2 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 2 step 3");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 2 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 3, "Timekeeper test run 2 step 3 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.DONE, "Timekeeper test run 2 step 3 state");

// Test simple countup with interrupt
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(0, true, [2, [gmtwerk_suite_callback, "abc"], 4, [gmtwerk_suite_callback, "def"]], false, [gmtwerk_suite_callback, "ghi"]);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 3 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 3 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 3 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 3 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 3 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 3 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 3 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 3 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 3 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 3 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 3 step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 3 step 3");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Timekeeper test run 3 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.INTERRUPTED, "Timekeeper test run 3 step 3 state");

// Test simple countdown with callback and keep going
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(4, false, [2, [gmtwerk_suite_callback, "abc"], 1, [gmtwerk_suite_callback, "def"]], true, undefined);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 4 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 4 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 4 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 4 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 4 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 4 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 2, "Timekeeper test run 4 step 2 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 4 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 4 step 3");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 4 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 1, "Timekeeper test run 4 step 3 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 4 step 3 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 4 step 4");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 4 step 4");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 0, "Timekeeper test run 4 step 4 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 4 step 4 state");

// Test simple countdown with callback and no keep going
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(4, false, [2, [gmtwerk_suite_callback, "abc"], 1, [gmtwerk_suite_callback, "def"]], false, undefined);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 5 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 5 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 5 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 5 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 5 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 5 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 2, "Timekeeper test run 5 step 2 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 5 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 5 step 3");
assert_equal(gmtwerk_suite_calls("def"), 1, "Timekeeper test run 5 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.TIME], 1, "Timekeeper test run 5 step 3 time");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.DONE, "Timekeeper test run 5 step 3 state");

// Test simple countdown with interrupt
gmtwerk_suite_callreset();
timekeeper = __timekeeper_builder__(4, false, [2, [gmtwerk_suite_callback, "abc"], 1, [gmtwerk_suite_callback, "def"]], false, [gmtwerk_suite_callback, "ghi"]);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 6 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 6 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 6 step 0");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Timekeeper test run 6 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 6 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 6 step 1");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 6 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 6 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Timekeeper test run 6 step 2");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.ACTIVE, "Timekeeper test run 6 step 2 state");
__timekeeper_runner__(timekeeper, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Timekeeper test run 6 step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Timekeeper test run 6 step 3");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Timekeeper test run 6 step 3");
assert_equal(timekeeper[GMTWERK_TIMEKEEPER.STATE], GMTWERK_STATE.INTERRUPTED, "Timekeeper test run 6 step 3 state");
