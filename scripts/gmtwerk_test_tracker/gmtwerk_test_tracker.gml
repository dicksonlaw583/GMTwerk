///@func gmtwerk_test_tracker()

var got, expected, tracker;

#region Test builder 1
global.__gmtwerk_tracker_value__ = 6;
global.__gmtwerk_log_value__ = 6;
expected = [
	__tracker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_tracker_value__"), //sourceSelector
	GlobalVar("__gmtwerk_log_value__"), //targetSelector
	undefined, //sourceValue
	undefined, //targetValue
	undefined, //memory
	tn_normal, //tween
	[te_swing, 3], //tweenArgs
	gmtwerk_suite_callback, //onNudge
	"move", //onNudgeArgs
	gmtwerk_suite_callback, //onDone
	"done", //onDoneArgs
	gmtwerk_suite_callback, //onLost
	"lost", //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	"stop", //onInterruptArgs
	false //snapOnInterrupt
];
got = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_normal, [te_swing, 3]], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
assert_equal(got, expected, "Tracker builder test 1 failed");
#endregion

#region Test builder 2
global.__gmtwerk_tracker_value__ = 7;
global.__gmtwerk_log_value__ = 7;
expected = [
	__tracker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_tracker_value__"), //sourceSelector
	GlobalVar("__gmtwerk_log_value__"), //targetSelector
	undefined, //sourceValue
	undefined, //targetValue
	undefined, //memory
	tn_snap, //tween
	undefined, //tweenArgs
	gmtwerk_suite_callback, //onNudge
	undefined, //onNudgeArgs
	gmtwerk_suite_callback, //onDone
	undefined, //onDoneArgs
	gmtwerk_suite_callback, //onLost
	undefined, //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), tn_snap, gmtwerk_suite_callback, gmtwerk_suite_callback, gmtwerk_suite_callback, gmtwerk_suite_callback, true);
assert_equal(got, expected, "Tracker builder test 2 failed");
#endregion

#region Test builder 3
global.__gmtwerk_tracker_value__ = 8;
global.__gmtwerk_log_value__ = 8;
expected = [
	__tracker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_tracker_value__"), //sourceSelector
	GlobalVar("__gmtwerk_log_value__"), //targetSelector
	undefined, //sourceValue
	undefined, //targetValue
	undefined, //memory
	tn_snap, //tween
	undefined, //tweenArgs
	undefined, //onNudge
	undefined, //onNudgeArgs
	undefined, //onDone
	undefined, //onDoneArgs
	undefined, //onLost
	undefined, //onLostArgs
	undefined, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), tn_snap, undefined, undefined, undefined, undefined, true);
assert_equal(got, expected, "Tracker builder test 3 failed");
#endregion

#region Tracker run to completion
global.__gmtwerk_tracker_value__ = 5;
global.__gmtwerk_log_value__ = 7;
gmtwerk_suite_callreset();
tracker = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_fixed, 1], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
assert_equal(gmtwerk_suite_calls("move"), 0, "Tracker run to completion step 0");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run to completion step 0");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 0");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 0");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run to completion step 0");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 0");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run to completion step 1");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run to completion step 1");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 1");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 1");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run to completion step 1");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 1");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run to completion step 2");
assert_equal(gmtwerk_suite_calls("done"), 1, "Tracker run to completion step 2");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 2");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 2");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run to completion step 2");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 2");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run to completion step 3");
assert_equal(gmtwerk_suite_calls("done"), 1, "Tracker run to completion step 3");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 3");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 3");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run to completion step 3");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 3");
global.__gmtwerk_log_value__ = 5;
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 2, "Tracker run to completion step 4");
assert_equal(gmtwerk_suite_calls("done"), 1, "Tracker run to completion step 4");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 4");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 4");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run to completion step 4");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 4");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 2, "Tracker run to completion step 5");
assert_equal(gmtwerk_suite_calls("done"), 2, "Tracker run to completion step 5");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run to completion step 5");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run to completion step 5");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run to completion step 5");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run to completion step 5");
#endregion

#region Tracker run with done
global.__gmtwerk_tracker_value__ = 5;
global.__gmtwerk_log_value__ = 10;
gmtwerk_suite_callreset();
tracker = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_fixed, 1], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
assert_equal(gmtwerk_suite_calls("move"), 0, "Tracker run with done step 0");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with done step 0");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 0");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 0");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run with done step 0");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 0");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with done step 1");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with done step 1");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 1");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 1");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run with done step 1");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 1");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with done step 2");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with done step 2");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 2");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 2");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with done step 2");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 2");
gmtwerk_tracker_snap(tracker);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with done step 3");
assert_equal(gmtwerk_suite_calls("done"), 1, "Tracker run with done step 3");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 3");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 3");
assert_equal(global.__gmtwerk_tracker_value__, 10, "Tracker run with done step 3");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 3");
global.__gmtwerk_log_value__ = 8;
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 2, "Tracker run with done step 4");
assert_equal(gmtwerk_suite_calls("done"), 1, "Tracker run with done step 4");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 4");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 4");
assert_equal(global.__gmtwerk_tracker_value__, 9, "Tracker run with done step 4");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 4");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 2, "Tracker run with done step 5");
assert_equal(gmtwerk_suite_calls("done"), 2, "Tracker run with done step 5");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with done step 5");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with done step 5");
assert_equal(global.__gmtwerk_tracker_value__, 8, "Tracker run with done step 5");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with done step 5");
#endregion

#region Tracker run with snapful interrupt
global.__gmtwerk_tracker_value__ = 5;
global.__gmtwerk_log_value__ = 10;
gmtwerk_suite_callreset();
tracker = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_fixed, 1], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
assert_equal(gmtwerk_suite_calls("move"), 0, "Tracker run with snapful interrupt step 0");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapful interrupt step 0");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapful interrupt step 0");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapful interrupt step 0");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run with snapful interrupt step 0");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapful interrupt step 0");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapful interrupt step 1");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapful interrupt step 1");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapful interrupt step 1");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapful interrupt step 1");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run with snapful interrupt step 1");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapful interrupt step 1");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapful interrupt step 2");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapful interrupt step 2");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapful interrupt step 2");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapful interrupt step 2");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with snapful interrupt step 2");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapful interrupt step 2");
__tracker_runner__(tracker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapful interrupt step 3");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapful interrupt step 3");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapful interrupt step 3");
assert_equal(gmtwerk_suite_calls("stop"), 1, "Tracker run with snapful interrupt step 3");
assert_equal(global.__gmtwerk_tracker_value__, 10, "Tracker run with snapful interrupt step 3");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.INTERRUPTED, "Tracker run with snapful interrupt step 3");
#endregion

#region Tracker run with snapless interrupt
global.__gmtwerk_tracker_value__ = 5;
global.__gmtwerk_log_value__ = 10;
gmtwerk_suite_callreset();
tracker = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_fixed, 1], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
assert_equal(gmtwerk_suite_calls("move"), 0, "Tracker run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapless interrupt step 0");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run with snapless interrupt step 0");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapless interrupt step 0");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapless interrupt step 1");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run with snapless interrupt step 1");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapless interrupt step 1");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with snapless interrupt step 2");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with snapless interrupt step 2");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with snapless interrupt step 2");
__tracker_runner__(tracker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with snapless interrupt step 3");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with snapless interrupt step 3");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with snapless interrupt step 3");
assert_equal(gmtwerk_suite_calls("stop"), 1, "Tracker run with snapless interrupt step 3");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with snapless interrupt step 3");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.INTERRUPTED, "Tracker run with snapless interrupt step 3");
#endregion

#region Tracker run with loss
global.__gmtwerk_tracker_value__ = 5;
global.__gmtwerk_log_value__ = 10;
gmtwerk_suite_callreset();
tracker = __tracker_builder__(GlobalVar("__gmtwerk_tracker_value__"), GlobalVar("__gmtwerk_log_value__"), [tn_fixed, 1], [gmtwerk_suite_callback, "move"], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
assert_equal(gmtwerk_suite_calls("move"), 0, "Tracker run with loss step 0");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with loss step 0");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with loss step 0");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with loss step 0");
assert_equal(global.__gmtwerk_tracker_value__, 5, "Tracker run with loss step 0");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with loss step 0");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with loss step 1");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with loss step 1");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with loss step 1");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with loss step 1");
assert_equal(global.__gmtwerk_tracker_value__, 6, "Tracker run with loss step 1");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with loss step 1");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with loss step 2");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with loss step 2");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Tracker run with loss step 2");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with loss step 2");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with loss step 2");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.ACTIVE, "Tracker run with loss step 2");
tracker[@ GMTWERK_TRACKER.SOURCE_SELECTOR] = GlobalVar("__gmtwerk_invalidated__");
__tracker_runner__(tracker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("move"), 1, "Tracker run with loss step 3");
assert_equal(gmtwerk_suite_calls("done"), 0, "Tracker run with loss step 3");
assert_equal(gmtwerk_suite_calls("lost"), 1, "Tracker run with loss step 3");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Tracker run with loss step 3");
assert_equal(global.__gmtwerk_tracker_value__, 7, "Tracker run with loss step 3");
assert_equal(tracker[GMTWERK_TRACKER.STATE], GMTWERK_STATE.LOST, "Tracker run with loss step 3");
#endregion

// Cleanup
gmtwerk_suite_callreset();
