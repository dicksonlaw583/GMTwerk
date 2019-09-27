///@func gmtwerk_test_tweener()

var got, expected, tweener;

#region Test builder 1
global.__gmtwerk_log_value__ = 6;
expected = [
	__tweener_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	6, //sourceValue
	10, //targetValue
	[0], //memory
	tn_normal, //tween
	[te_swing, 3], //tweenArgs
	gmtwerk_suite_callback, //onDone
	"abc", //onDoneArgs
	gmtwerk_suite_callback, //onLost
	"def", //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	"ghi", //onInterruptArgs
	false //snapOnInterrupt
];
got = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 10, [tn_normal, [te_swing, 3]], [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(got, expected, "Tweener builder test 1 failed");
#endregion

#region Test builder 2
global.__gmtwerk_log_value__ = 7;
expected = [
	__tweener_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	7, //sourceValue
	11, //targetValue
	[7], //memory
	tn_zenos, //tween
	[0.5, 1], //tweenArgs
	undefined, //onDone
	undefined, //onDoneArgs
	undefined, //onLost
	undefined, //onLostArgs
	undefined, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 11, [tn_zenos, [0.5, 1]], undefined, undefined, undefined, true);
assert_equal(got, expected, "Tweener builder test 2 failed");
#endregion

#region Test builder 3
global.__gmtwerk_log_value__ = 8;
expected = [
	__tweener_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	8, //sourceValue
	12, //targetValue
	[false], //memory
	tn_snap, //tween
	undefined, //tweenArgs
	gmtwerk_suite_callback, //onDone
	undefined, //onDoneArgs
	gmtwerk_suite_callback, //onLost
	undefined, //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 12, tn_snap, gmtwerk_suite_callback, gmtwerk_suite_callback, gmtwerk_suite_callback, true);
assert_equal(got, expected, "Tweener builder test 3 failed");
#endregion

#region Tweener run to completion
global.__gmtwerk_log_value__ = 6;
gmtwerk_suite_callreset();
tweener = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 10, [tn_normal, [te_linear, 2]], [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run to completion step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run to completion step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run to completion step 0");
assert_equal(global.__gmtwerk_log_value__, 6, "Tweener run to completion step 0");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run to completion step 0");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run to completion step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run to completion step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run to completion step 1");
assert_equal(global.__gmtwerk_log_value__, 8, "Tweener run to completion step 1");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run to completion step 1");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Tweener run to completion step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run to completion step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run to completion step 2");
assert_equal(global.__gmtwerk_log_value__, 10, "Tweener run to completion step 2");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.DONE, "Tweener run to completion step 2");
#endregion

#region Tweener run interrupted with snap
global.__gmtwerk_log_value__ = 6;
gmtwerk_suite_callreset();
tweener = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 14, [tn_normal, [te_linear, 4]], [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], true);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapful interrupt step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapful interrupt step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapful interrupt step 0");
assert_equal(global.__gmtwerk_log_value__, 6, "Tweener run with snapful interrupt step 0");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapful interrupt step 0");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapful interrupt step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapful interrupt step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapful interrupt step 1");
assert_equal(global.__gmtwerk_log_value__, 8, "Tweener run with snapful interrupt step 1");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapful interrupt step 1");
__tweener_runner__(tweener, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapful interrupt step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapful interrupt step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Tweener run with snapful interrupt step 2");
assert_equal(global.__gmtwerk_log_value__, 14, "Tweener run with snapful interrupt step 2");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.INTERRUPTED, "Tweener run with snapful interrupt step 2");
#endregion

#region Tweener run interrupted without snap
global.__gmtwerk_log_value__ = 6;
gmtwerk_suite_callreset();
tweener = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 14, [tn_normal, [te_linear, 4]], [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(global.__gmtwerk_log_value__, 6, "Tweener run with snapless interrupt step 0");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapless interrupt step 0");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(global.__gmtwerk_log_value__, 8, "Tweener run with snapless interrupt step 1");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapless interrupt step 1");
__tweener_runner__(tweener, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Tweener run with snapless interrupt step 2");
assert_equal(global.__gmtwerk_log_value__, 8, "Tweener run with snapless interrupt step 2");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.INTERRUPTED, "Tweener run with snapless interrupt step 2");
#endregion

#region Tweener run loss
global.__gmtwerk_log_value__ = 6;
gmtwerk_suite_callreset();
tweener = __tweener_builder__(GlobalVar("__gmtwerk_log_value__"), 14, [tn_normal, [te_linear, 4]], [gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], [gmtwerk_suite_callback, "ghi"], false);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapless interrupt step 0");
assert_equal(global.__gmtwerk_log_value__, 6, "Tweener run with snapless interrupt step 0");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapless interrupt step 0");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapless interrupt step 1");
assert_equal(global.__gmtwerk_log_value__, 8, "Tweener run with snapless interrupt step 1");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.ACTIVE, "Tweener run with snapless interrupt step 1");
tweener[@ GMTWERK_TWEENER.SELECTOR] = GlobalVar("__gmtwerk_doesnt_exist__");
__tweener_runner__(tweener, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Tweener run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Tweener run with snapless interrupt step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Tweener run with snapless interrupt step 2");
assert_equal(tweener[GMTWERK_TWEENER.STATE], GMTWERK_STATE.LOST, "Tweener run with snapless interrupt step 2");
#endregion

// Cleanup
gmtwerk_suite_callreset();
