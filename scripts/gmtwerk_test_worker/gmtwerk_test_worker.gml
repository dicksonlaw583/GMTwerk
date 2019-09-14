///@func gmtwerk_test_worker()

var got, expected, worker;

#region Test builder 1
expected = [
	__worker_runner__,
	GMTWERK_STATE.ACTIVE,
	gmtwerk_suite_callback,
	undefined,
	[],
	undefined,
	undefined,
	undefined,
	undefined,
	false
];
got = __worker_builder__(gmtwerk_suite_callback, [], undefined, undefined, false);
assert_equal(got, expected, "Worker builder test 1 failed");
#endregion

#region Test builder 2
expected = [
	__worker_runner__,
	GMTWERK_STATE.ACTIVE,
	gmtwerk_suite_callback,
	"abc",
	[],
	gmtwerk_suite_callback,
	"def",
	gmtwerk_suite_callback,
	"ghi",
	true
];
got = __worker_builder__([gmtwerk_suite_callback, "abc"], [], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], true);
assert_equal(got, expected, "Worker builder test 2 failed");
#endregion

#region Test normal run 1
gmtwerk_suite_callreset();
gmtwerk_suite_workdone(false);
worker = __worker_builder__([gmtwerk_suite_work, "abc"], [], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Worker run 1 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 1 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 1 step 0");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 1 step 0");
__worker_runner__(worker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Worker run 1 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 1 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 1 step 1");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 1 step 1");
gmtwerk_suite_workdone(true);
__worker_runner__(worker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Worker run 1 step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Worker run 1 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 1 step 2");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.DONE, "Worker run 1 step 2");
#endregion

#region Test interrupted run (with cleanup)
gmtwerk_suite_callreset();
gmtwerk_suite_workdone(false);
worker = __worker_builder__([gmtwerk_suite_work, "abc"], [], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], true);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 2 step 0");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 2 step 0");
__worker_runner__(worker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Worker run 2 step 1");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 2 step 1");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 2 step 1");
gmtwerk_suite_workdone(true);
__worker_runner__(worker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Worker run 2 step 2");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 1, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Worker run 2 step 2");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.INTERRUPTED, "Worker run 2 step 2");
#endregion

#region Test interrupted run (without cleanup)
gmtwerk_suite_callreset();
gmtwerk_suite_workdone(false);
worker = __worker_builder__([gmtwerk_suite_work, "abc"], [], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 2 step 0");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 2 step 0");
__worker_runner__(worker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Worker run 2 step 1");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Worker run 2 step 1");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.ACTIVE, "Worker run 2 step 1");
gmtwerk_suite_workdone(true);
__worker_runner__(worker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Worker run 2 step 2");
assert_equal(gmtwerk_suite_calls("abc-interrupt"), 0, "Worker run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Worker run 2 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Worker run 2 step 2");
assert_equal(worker[GMTWERK_WORKER.STATE], GMTWERK_STATE.INTERRUPTED, "Worker run 2 step 2");
#endregion

// Cleanup
gmtwerk_suite_workdone(false);
gmtwerk_suite_callreset();
