///@func gmtwerk_test_twerker()

var got, expected, twerker;

#region Test builder 1
global.__gmtwerk_log_value__ = 1;
expected = [
	__twerker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	1, //sourceValue
	10, //targetValue
	5, //times
	[15, true, 0], //memory
	tk_flash, //twerkType
	[15, 15], //twerkTypeArgs
	gmtwerk_suite_callback, //onDone
	"done", //onDoneArgs
	gmtwerk_suite_callback, //onLost
	"lost", //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	"stop", //onInterruptArgs
	true //snapOnInterrupt
];
got = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 10, 5, [tk_flash, [15, 15]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
assert_equal(got, expected, "Twerker builder test 1 failed");
#endregion

#region Test builder 2
global.__gmtwerk_log_value__ = 2;
expected = [
	__twerker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	2, //sourceValue
	11, //targetValue
	6, //times
	[0, 0], //memory
	tk_shake, //twerkType
	[60, false, te_quadratic_out], //twerkTypeArgs
	gmtwerk_suite_callback, //onDone
	undefined, //onDoneArgs
	gmtwerk_suite_callback, //onLost
	undefined, //onLostArgs
	gmtwerk_suite_callback, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 11, 6, [tk_shake, [60, false, te_quadratic_out]], gmtwerk_suite_callback, gmtwerk_suite_callback, gmtwerk_suite_callback, true);
assert_equal(got, expected, "Twerker builder test 2 failed");
#endregion

#region Test builder 3
global.__gmtwerk_log_value__ = 3;
expected = [
	__twerker_runner__, //type
	GMTWERK_STATE.ACTIVE, //state
	GlobalVar("__gmtwerk_log_value__"), //selector
	3, //sourceValue
	12, //targetValue
	undefined, //times
	[0, 60, 0], //memory
	tk_composite, //twerkType
	[te_circ_out, 30, 1, te_bounce_out, 30, 0], //twerkTypeArgs
	undefined, //onDone
	undefined, //onDoneArgs
	undefined, //onLost
	undefined, //onLostArgs
	undefined, //onInterrupt
	undefined, //onInterruptArgs
	true //snapOnInterrupt
];
got = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 12, undefined, [tk_composite, [te_circ_out, 30, 1, te_bounce_out, 30, 0]], undefined, undefined, undefined, true);
assert_equal(got, expected, "Twerker builder test 3 failed");
#endregion

#region Twerker infinite run with done
global.__gmtwerk_log_value__ = 4;
gmtwerk_suite_callreset();
twerker = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 8, undefined, [tk_wave_triangle, [4, false]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
for (var i = 1; i <= 18; i++) {
	__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.ACTIVE, "Twerker infinite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker infinite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker infinite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker infinite run step " + string(i));
	switch (i % 4) {
		case 1: assert_equal(global.__gmtwerk_log_value__, 8, "Twerker infinite run step " + string(i)); break;
		case 3: assert_equal(global.__gmtwerk_log_value__, 0, "Twerker infinite run step " + string(i)); break;
		default: assert_equal(global.__gmtwerk_log_value__, 4, "Twerker infinite run step " + string(i)); break;
	}
}
__twerker_runner__(twerker, 1, GMTWERK_STATE.DONE);
assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.DONE, "Twerker infinite run step 19");
assert_equal(gmtwerk_suite_calls("done"), 1, "Twerker infinite run step 19");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker infinite run step 19");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker infinite run step 19");
assert_equal(global.__gmtwerk_log_value__, 4, "Twerker infinite run step 19");
#endregion

#region Twerker finite run with self-done
global.__gmtwerk_log_value__ = 4;
gmtwerk_suite_callreset();
twerker = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 8, 5, [tk_wave_triangle, [4, false]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
for (var i = 1; i <= 19; i++) {
	__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.ACTIVE, "Twerker finite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker finite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker finite run step " + string(i));
	assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker finite run step " + string(i));
	switch (i % 4) {
		case 1: assert_equal(global.__gmtwerk_log_value__, 8, "Twerker finite run step " + string(i)); break;
		case 3: assert_equal(global.__gmtwerk_log_value__, 0, "Twerker finite run step " + string(i)); break;
		default: assert_equal(global.__gmtwerk_log_value__, 4, "Twerker finite run step " + string(i)); break;
	}
}
__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.DONE, "Twerker finite run step 20");
assert_equal(gmtwerk_suite_calls("done"), 1, "Twerker finite run step 20");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker finite run step 20");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker finite run step 20");
assert_equal(global.__gmtwerk_log_value__, 4, "Twerker finite run step 20");
#endregion

#region Twerker loss run
global.__gmtwerk_log_value__ = 4;
gmtwerk_suite_callreset();
twerker = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 8, 5, [tk_wave_triangle, [4, false]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
for (var i = 1; i <= 11; i++) {
	__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.ACTIVE, "Twerker loss run step " + string(i));
	assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker loss run step " + string(i));
	assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker loss run step " + string(i));
	assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker loss run step " + string(i));
	switch (i % 4) {
		case 1: assert_equal(global.__gmtwerk_log_value__, 8, "Twerker loss run step " + string(i)); break;
		case 3: assert_equal(global.__gmtwerk_log_value__, 0, "Twerker loss run step " + string(i)); break;
		default: assert_equal(global.__gmtwerk_log_value__, 4, "Twerker loss run step " + string(i)); break;
	}
}
twerker[@ GMTWERK_TWERKER.SELECTOR] = GlobalVar("__gmtwerk_does_not_exist__");
__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.LOST, "Twerker loss run step 12");
assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker loss run step 12");
assert_equal(gmtwerk_suite_calls("lost"), 1, "Twerker loss run step 12");
assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker loss run step 12");
assert_equal(global.__gmtwerk_log_value__, 0, "Twerker loss run step 12");
#endregion

#region Twerker interrupted run with snap
global.__gmtwerk_log_value__ = 4;
gmtwerk_suite_callreset();
twerker = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 8, 5, [tk_wave_triangle, [4, false]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], true);
for (var i = 1; i <= 11; i++) {
	__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.ACTIVE, "Twerker snapful interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker snapful interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker snapful interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker snapful interrupted run step " + string(i));
	switch (i % 4) {
		case 1: assert_equal(global.__gmtwerk_log_value__, 8, "Twerker snapful interrupted run step " + string(i)); break;
		case 3: assert_equal(global.__gmtwerk_log_value__, 0, "Twerker snapful interrupted run step " + string(i)); break;
		default: assert_equal(global.__gmtwerk_log_value__, 4, "Twerker snapful interrupted run step " + string(i)); break;
	}
}
__twerker_runner__(twerker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.INTERRUPTED, "Twerker snapful interrupted run step 12");
assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker snapful interrupted run step 12");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker snapful interrupted run step 12");
assert_equal(gmtwerk_suite_calls("stop"), 1, "Twerker snapful interrupted run step 12");
assert_equal(global.__gmtwerk_log_value__, 4, "Twerker snapful interrupted run step 12");
#endregion

#region Twerker interrupted run without snap
global.__gmtwerk_log_value__ = 4;
gmtwerk_suite_callreset();
twerker = __twerker_builder__(GlobalVar("__gmtwerk_log_value__"), 8, 5, [tk_wave_triangle, [4, false]], [gmtwerk_suite_callback, "done"], [gmtwerk_suite_callback, "lost"], [gmtwerk_suite_callback, "stop"], false);
for (var i = 1; i <= 11; i++) {
	__twerker_runner__(twerker, 1, GMTWERK_STATE.ACTIVE);
	assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.ACTIVE, "Twerker snapless interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker snapless interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker snapless interrupted run step " + string(i));
	assert_equal(gmtwerk_suite_calls("stop"), 0, "Twerker snapless interrupted run step " + string(i));
	switch (i % 4) {
		case 1: assert_equal(global.__gmtwerk_log_value__, 8, "Twerker snapless interrupted run step " + string(i)); break;
		case 3: assert_equal(global.__gmtwerk_log_value__, 0, "Twerker snapless interrupted run step " + string(i)); break;
		default: assert_equal(global.__gmtwerk_log_value__, 4, "Twerker snapless interrupted run step " + string(i)); break;
	}
}
__twerker_runner__(twerker, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(twerker[GMTWERK_TWERKER.STATE], GMTWERK_STATE.INTERRUPTED, "Twerker snapless interrupted run step 12");
assert_equal(gmtwerk_suite_calls("done"), 0, "Twerker snapless interrupted run step 12");
assert_equal(gmtwerk_suite_calls("lost"), 0, "Twerker snapless interrupted run step 12");
assert_equal(gmtwerk_suite_calls("stop"), 1, "Twerker snapless interrupted run step 12");
assert_equal(global.__gmtwerk_log_value__, 0, "Twerker snapless interrupted run step 12");
#endregion
