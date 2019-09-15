///@func gmtwerk_test_responder()

var got, expected, responder;

#region Test builder 1
expected = [
	GMTWERK_STATE.ACTIVE, //state
	false, //lastcondition
	gmtwerk_suite_callback, //conditionPayload
	undefined, //conditionPayloadArgs
	false, //keepAlive
	gmtwerk_suite_callback, //onTrigger
	"abc", //onTriggerArgs
	undefined, //onUntrigger
	undefined, //onUntriggerArgs
	undefined, //onInterrupt
	undefined //onInterruptArgs
];
got = __responder_builder__(gmtwerk_suite_callback, [gmtwerk_suite_callback, "abc"], false, undefined, undefined);
assert_equal(got, expected, "Responder builder test 1 failed");
#endregion

#region Test builder 2
expected = [
	GMTWERK_STATE.ACTIVE, //state
	false, //lastcondition
	gmtwerk_suite_callback, //conditionPayload
	"abc", //conditionPayloadArgs
	true, //keepAlive
	gmtwerk_suite_callback, //onTrigger
	"def", //onTriggerArgs
	gmtwerk_suite_callback, //onUntrigger
	"ghi", //onUntriggerArgs
	gmtwerk_suite_callback, //onInterrupt
	"jkl" //onInterruptArgs
];
got = __responder_builder__([gmtwerk_suite_callback, "abc"], [gmtwerk_suite_callback, "def"], true, [gmtwerk_suite_callback, "ghi"], [gmtwerk_suite_callback, "jkl"]);
assert_equal(got, expected, "Responder builder test 2 failed");
#endregion

#region Responder normal run 1 (normal trigger)
gmtwerk_suite_callreset();
gmtwerk_suite_workdone(false);
responder = __responder_builder__([gmtwerk_suite_work, "abc"], [gmtwerk_suite_callback, "def"], false, undefined, undefined);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Responder normal run 1 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Responder normal run 1 step 0");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 1 step 0");
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Responder normal run 1 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Responder normal run 1 step 1");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 1 step 1");
gmtwerk_suite_workdone();
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Responder normal run 1 step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 1 step 2");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.DONE, "Responder normal run step 2");
#endregion

#region Responder normal run 2 (trigger and untrigger and interrupt)
gmtwerk_suite_callreset();
gmtwerk_suite_workdone(false);
responder = __responder_builder__([gmtwerk_suite_work, "abc"], [gmtwerk_suite_callback, "def"], true, [gmtwerk_suite_callback, "ghi"], [gmtwerk_suite_callback, "jkl"]);
assert_equal(gmtwerk_suite_calls("abc"), 0, "Responder normal run 2 step 0");
assert_equal(gmtwerk_suite_calls("def"), 0, "Responder normal run 2 step 0");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Responder normal run 2 step 0");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 0");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 0");
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 1, "Responder normal run 2 step 1");
assert_equal(gmtwerk_suite_calls("def"), 0, "Responder normal run 2 step 1");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Responder normal run 2 step 1");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 1");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 1");
gmtwerk_suite_workdone();
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 2, "Responder normal run 2 step 2");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 2 step 2");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Responder normal run 2 step 2");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 2");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 2");
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 3, "Responder normal run 2 step 3");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 2 step 3");
assert_equal(gmtwerk_suite_calls("ghi"), 0, "Responder normal run 2 step 3");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 3");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 3");
gmtwerk_suite_workdone(false);
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 4, "Responder normal run 2 step 4");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 2 step 4");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Responder normal run 2 step 4");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 4");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 4");
__responder_runner__(responder, 1, GMTWERK_STATE.ACTIVE);
assert_equal(gmtwerk_suite_calls("abc"), 5, "Responder normal run 2 step 5");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 2 step 5");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Responder normal run 2 step 5");
assert_equal(gmtwerk_suite_calls("jkl"), 0, "Responder normal run 2 step 5");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.ACTIVE, "Responder normal run 2 step 5");
__responder_runner__(responder, 1, GMTWERK_STATE.INTERRUPTED);
assert_equal(gmtwerk_suite_calls("abc"), 5, "Responder normal run 2 step 6");
assert_equal(gmtwerk_suite_calls("def"), 1, "Responder normal run 2 step 6");
assert_equal(gmtwerk_suite_calls("ghi"), 1, "Responder normal run 2 step 6");
assert_equal(gmtwerk_suite_calls("jkl"), 1, "Responder normal run 2 step 6");
assert_equal(responder[GMTWERK_RESPONDER.STATE], GMTWERK_STATE.INTERRUPTED, "Responder normal run 2 step 6");
#endregion
