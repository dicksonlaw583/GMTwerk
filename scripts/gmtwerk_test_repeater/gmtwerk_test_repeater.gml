///@func gmtwerk_test_repeater()

var got, expected, repeater;

// Test builder 1
expected = [
	__repeater_runner__,
	GMTWERK_STATE.ACTIVE, //state
	100, //timeUnits
	-1, //times
	100, //reloadTime
	gmtwerk_suite_callback, //payload
	undefined, //payloadArgs
	false, //runOnInterrupt
	undefined, //onInterrupt
	undefined //onInterruptArgs
];
got = __repeater_builder__(100, -1, 100, gmtwerk_suite_callback, undefined, false);
assert_equal(got, expected, "Repeater builder test 1 failed");

// Test builder 2
expected = [
	__repeater_runner__,
	GMTWERK_STATE.ACTIVE, //state
	100, //timeUnits
	2, //times
	200, //reloadTime
	gmtwerk_suite_callback, //payload
	"abc", //payloadArgs
	true, //runOnInterrupt
	gmtwerk_suite_callback, //onInterrupt
	"def" //onInterruptArgs
];
got = __repeater_builder__(100, 2, 200, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(got, expected, "Repeater builder test 2 failed");

// Test simple run with callback
gmtwerk_suite_callreset();
repeater = __repeater_builder__(2, 2, 2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 1 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 1 step 0");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 1 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 1 step 1");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 1 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 1 step 2");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 2, "Repeater test run 1 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 1, "Repeater test run 1 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.ACTIVE, "Repeater test run 1 step 2 state");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 1 step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 1 step 3");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Repeater test run 1 step 4");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 1 step 4");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 0, "Repeater test run 1 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 0, "Repeater test run 1 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.DONE, "Repeater test run 1 step 4 state");

// Test simple interrupted run with callback
gmtwerk_suite_callreset();
repeater = __repeater_builder__(2, 2, 2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 2 step 0");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 2 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 2 step 1");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 2 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 2 step 2");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 2, "Repeater test run 2 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 1, "Repeater test run 2 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.ACTIVE, "Repeater test run 2 step 2 state");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 2 step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 2 step 3");
__repeater_runner__(repeater, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 2 step 4");
assert_equal(gmtwerk_suite_calls("def"), 1, "Repeater test run 2 step 4");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 1, "Repeater test run 2 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 1, "Repeater test run 2 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.INTERRUPTED, "Repeater test run 2 step 4 state");

// Test simple interrupted run with callback and payload
gmtwerk_suite_callreset();
repeater = __repeater_builder__(2, 2, 2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 3 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 3 step 0");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Repeater test run 3 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 3 step 1");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 3 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 3 step 2");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 2, "Repeater test run 3 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 1, "Repeater test run 3 step 2 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.ACTIVE, "Repeater test run 3 step 2 state");
__repeater_runner__(repeater, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Repeater test run 3 step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Repeater test run 3 step 3");
__repeater_runner__(repeater, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Repeater test run 3 step 4");
assert_equal(gmtwerk_suite_calls("def"), 1, "Repeater test run 3 step 4");
assert_equal(repeater[GMTWERK_REPEATER.TIME], 1, "Repeater test run 3 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.TIMES], 1, "Repeater test run 3 step 4 time");
assert_equal(repeater[GMTWERK_REPEATER.STATE], GMTWERK_STATE.INTERRUPTED, "Repeater test run 3 step 4 state");
