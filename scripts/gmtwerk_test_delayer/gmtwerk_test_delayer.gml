///@func gmtwerk_test_delayer()

var got, expected, delayer;

// Test builder 1
expected = [
	__delayer_runner__,
	GMTWERK_STATE.ACTIVE, //state
	100, //timeUnits
	gmtwerk_suite_callback, //payload
	undefined, //payloadArgs
	true, //runOnInterrupt
	undefined, //onInterrupt
	undefined //onInterruptArgs
];
got = __delayer_builder__(100, gmtwerk_suite_callback, undefined, true);
assert_equal(got, expected, "Delayer builder test 1 failed");

// Test builder 2
expected = [
	__delayer_runner__,
	GMTWERK_STATE.ACTIVE, //state
	250, //timeUnits
	gmtwerk_suite_callback, //payload
	"abc", //payloadArgs
	true, //runOnInterrupt
	gmtwerk_suite_callback, //onInterrupt
	"def" //onInterruptArgs
];
got = __delayer_builder__(250, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(got, expected, "Delayer builder test 2 failed");

// Test simple run with callback
gmtwerk_suite_callreset();
delayer = __delayer_builder__(2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 1 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 1 step 0");
__delayer_runner__(delayer, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 1 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 1 step 1");
__delayer_runner__(delayer, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Delayer test run 1 step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 1 step 2");
assert_equal(delayer[GMTWERK_DELAYER.TIME], 0, "Delayer test run 1 step 2 time");
assert_equal(delayer[GMTWERK_DELAYER.STATE], GMTWERK_STATE.DONE, "Delayer test run 1 step 2 state");

// Test interrupted run with callback
gmtwerk_suite_callreset();
delayer = __delayer_builder__(2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 2 step 0");
__delayer_runner__(delayer, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 2 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 2 step 1");
__delayer_runner__(delayer, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 2 step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Delayer test run 2 step 2");
assert_equal(delayer[GMTWERK_DELAYER.TIME], 1, "Delayer test run 2 step 2 time");
assert_equal(delayer[GMTWERK_DELAYER.STATE], GMTWERK_STATE.INTERRUPTED, "Delayer test run 2 step 2 state");

// Test interrupted run with callback and payload trigger
gmtwerk_suite_callreset();
delayer = __delayer_builder__(2, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 3 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 3 step 0");
__delayer_runner__(delayer, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Delayer test run 3 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Delayer test run 3 step 1");
__delayer_runner__(delayer, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Delayer test run 3 step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Delayer test run 3 step 2");
assert_equal(delayer[GMTWERK_DELAYER.TIME], 1, "Delayer test run 3 step 2 time");
assert_equal(delayer[GMTWERK_DELAYER.STATE], GMTWERK_STATE.INTERRUPTED, "Delayer test run 3 step 2 state");
