///@func gmtwerk_test_collector()

var got, expected, collector;

#region Test builder 1 (flag-based)
expected = [
	__collector_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	5, //n
	int64(0), //triggerBank
	true, //orMode
	false, //keepAlive
	gmtwerk_suite_callback, //onTrigger
	undefined, //onTriggerArgs
	undefined, //onInterrupt
	undefined, //onInterruptArgs
	false //runOnInterrupt
];
got = __collector_builder__(5, true, false, gmtwerk_suite_callback, undefined, false);
assert_equal(got, expected, "Collector builder test 1 failed");
#endregion

#region Test builder 2 (array-based)
expected = [
	__collector_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	32, //n
	array_create(32, false), //triggerBank
	false, //orMode
	true, //keepAlive
	gmtwerk_suite_callback, //onTrigger
	"abc", //onTriggerArgs
	gmtwerk_suite_callback, //onInterrupt
	"def", //onInterruptArgs
	true //runOnInterrupt
];
got = __collector_builder__(32, false, true, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(got, expected, "Collector builder test 2 failed");
#endregion

#region Test small or (keep alive and interrupt)
gmtwerk_suite_callreset();
collector = __collector_builder__(2, true, true, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector small or step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small or step 0");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small or step 0");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector small or step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small or step 1");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small or step 1");
gmtwerk_collector_notify([collector, 0]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Collector small or step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small or step 2");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small or step 2");
gmtwerk_collector_notify([collector, 0]);
gmtwerk_collector_notify([collector, 1]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Collector small or step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small or step 3");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small or step 3");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Collector small or step 4");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small or step 4");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small or step 4");
__collector_runner__(collector, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Collector small or step 5");
assert_equal(gmtwerk_suite_calls("def"), 1, "Collector small or step 5");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.INTERRUPTED, "Collector small or step 5");
#endregion

#region Test small and (no keep alive)
gmtwerk_suite_callreset();
collector = __collector_builder__(2, false, false, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector small and step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small and step 0");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small and step 0");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector small and step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small and step 1");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small and step 1");
gmtwerk_collector_notify([collector, 0]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector small and step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small and step 2");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector small and step 2");
gmtwerk_collector_notify([collector, 1]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Collector small and step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector small and step 3");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.DONE, "Collector small and step 3");
#endregion

#region Test big or (keep alive and interrupt with runOnTrigger)
gmtwerk_suite_callreset();
collector = __collector_builder__(35, true, true, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector big or step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big or step 0");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big or step 0");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector big or step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big or step 1");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big or step 1");
gmtwerk_collector_notify([collector, 0]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Collector big or step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big or step 2");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big or step 2");
gmtwerk_collector_notify([collector, 7]);
gmtwerk_collector_notify([collector, 11]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Collector big or step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big or step 3");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big or step 3");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Collector big or step 4");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big or step 4");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big or step 4");
__collector_runner__(collector, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 3, "Collector big or step 5");
assert_equal(gmtwerk_suite_calls("def"), 1, "Collector big or step 5");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.INTERRUPTED, "Collector big or step 5");
#endregion

#region Test big and (no keep alive)
gmtwerk_suite_callreset();
collector = __collector_builder__(35, false, false, [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector big and step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big and step 0");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big and step 0");
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector big and step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big and step 1");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big and step 1");
for (var i = 33; i >= 0; i--) {
	gmtwerk_collector_notify([collector, i]);
	__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(gmtwerk_suite_calls("abc"), 0, "Collector big and step 2");
	assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big and step 2");
	assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.ACTIVE, "Collector big and step 2");
}
gmtwerk_collector_notify([collector, 34]);
__collector_runner__(collector, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Collector big and step 3");
assert_equal(gmtwerk_suite_calls("def"), 0, "Collector big and step 3");
assert_equal(collector[GMTWERK_COLLECTOR.STATE], GMTWERK_STATE.DONE, "Collector big and step 3");
#endregion 

// Cleanup
gmtwerk_suite_callreset();
