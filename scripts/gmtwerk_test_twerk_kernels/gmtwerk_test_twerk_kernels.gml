///@func gmtwerk_test_twerk_kernels()

var memory;

#region Test composite
var composition = [te_linear, 2, 0.25, te_linear, 2, 1, te_linear, 1, 0.5, te_linear, 1, 0];
memory = [];
tk_composite(composition, memory, 0, 1, 9, undefined);
assert_equal(memory, [0, 6, 0], "Composite twerk init failed");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 2, "Composite twerk step 1");
assert_equal(memory, [1, 6, 0], "Composite twerk step 1 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 3, "Composite twerk step 2");
assert_equal(memory, [2, 6, 0], "Composite twerk step 2 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 6, "Composite twerk step 3");
assert_equal(memory, [3, 6, 0], "Composite twerk step 3 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 9, "Composite twerk step 4");
assert_equal(memory, [4, 6, 0], "Composite twerk step 4 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 5, "Composite twerk step 5");
assert_equal(memory, [5, 6, 0], "Composite twerk step 5 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 1, "Composite twerk step 6");
assert_equal(memory, [0, 6, 1], "Composite twerk step 6 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 2, "Composite twerk step 7");
assert_equal(memory, [1, 6, 1], "Composite twerk step 7 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 3, "Composite twerk step 8");
assert_equal(memory, [2, 6, 1], "Composite twerk step 8 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 6, "Composite twerk step 9");
assert_equal(memory, [3, 6, 1], "Composite twerk step 9 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 9, "Composite twerk step 10");
assert_equal(memory, [4, 6, 1], "Composite twerk step 10 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 5, "Composite twerk step 11");
assert_equal(memory, [5, 6, 1], "Composite twerk step 11 memory");
assert_equal(tk_composite(composition, memory, 1, 1, 9, 1), 1, "Composite twerk step 12");
assert_equal(memory, [0, 6, 2], "Composite twerk step 12 memory");
#endregion

#region Test composite with angle blend
var composition = [te_linear, 2, 0.25, te_linear, 2, 1, te_linear, 1, 0.5, te_linear, 1, 0, tb_angle];
memory = [];
tk_composite(composition, memory, 0, 2, 354, undefined);
assert_equal(memory, [0, 6, 0], "Composite angle twerk init failed");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 1, "Composite angle twerk step 1");
assert_equal(memory, [1, 6, 0], "Composite angle twerk step 1 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 0, "Composite angle twerk step 2");
assert_equal(memory, [2, 6, 0], "Composite angle twerk step 2 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 357, "Composite angle twerk step 3");
assert_equal(memory, [3, 6, 0], "Composite angle twerk step 3 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 354, "Composite angle twerk step 4");
assert_equal(memory, [4, 6, 0], "Composite angle twerk step 4 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 358, "Composite angle twerk step 5");
assert_equal(memory, [5, 6, 0], "Composite angle twerk step 5 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 2, "Composite angle twerk step 6");
assert_equal(memory, [0, 6, 1], "Composite angle twerk step 6 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 1, "Composite angle twerk step 7");
assert_equal(memory, [1, 6, 1], "Composite angle twerk step 7 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 0, "Composite angle twerk step 8");
assert_equal(memory, [2, 6, 1], "Composite angle twerk step 8 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 357, "Composite angle twerk step 9");
assert_equal(memory, [3, 6, 1], "Composite angle twerk step 9 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 354, "Composite angle twerk step 10");
assert_equal(memory, [4, 6, 1], "Composite angle twerk step 10 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 358, "Composite angle twerk step 11");
assert_equal(memory, [5, 6, 1], "Composite angle twerk step 11 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 2, "Composite angle twerk step 12");
assert_equal(memory, [0, 6, 2], "Composite angle twerk step 12 memory");
#endregion

#region Test composite with wrap blend
var composition = [te_linear, 2, 0.25, te_linear, 2, 1, te_linear, 1, 0.5, te_linear, 1, 0, tb_wrap, [0, 360]];
memory = [];
tk_composite(composition, memory, 0, 2, 354, undefined);
assert_equal(memory, [0, 6, 0], "Composite wrap twerk init failed");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 1, "Composite wrap twerk step 1");
assert_equal(memory, [1, 6, 0], "Composite wrap twerk step 1 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 0, "Composite wrap twerk step 2");
assert_equal(memory, [2, 6, 0], "Composite wrap twerk step 2 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 357, "Composite wrap twerk step 3");
assert_equal(memory, [3, 6, 0], "Composite wrap twerk step 3 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 354, "Composite wrap twerk step 4");
assert_equal(memory, [4, 6, 0], "Composite wrap twerk step 4 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 358, "Composite wrap twerk step 5");
assert_equal(memory, [5, 6, 0], "Composite wrap twerk step 5 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 2, "Composite wrap twerk step 6");
assert_equal(memory, [0, 6, 1], "Composite wrap twerk step 6 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 1, "Composite wrap twerk step 7");
assert_equal(memory, [1, 6, 1], "Composite wrap twerk step 7 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 0, "Composite wrap twerk step 8");
assert_equal(memory, [2, 6, 1], "Composite wrap twerk step 8 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 357, "Composite wrap twerk step 9");
assert_equal(memory, [3, 6, 1], "Composite wrap twerk step 9 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 354, "Composite wrap twerk step 10");
assert_equal(memory, [4, 6, 1], "Composite wrap twerk step 10 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 358, "Composite wrap twerk step 11");
assert_equal(memory, [5, 6, 1], "Composite wrap twerk step 11 memory");
assert_equal(tk_composite(composition, memory, 1, 2, 354, 1), 2, "Composite wrap twerk step 12");
assert_equal(memory, [0, 6, 2], "Composite wrap twerk step 12 memory");
#endregion

#region Test path
var pathArg = [pth_test_segmented, 0, -128, 4];
memory = [];
tk_path(pathArg, memory, 0, 1, 9, undefined);
assert_equal(memory, [0, 0], "Path twerk init failed");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 5, "Path twerk step 1");
assert_equal(memory, [1, 0], "Path twerk step 1 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 9, "Path twerk step 2");
assert_equal(memory, [2, 0], "Path twerk step 2 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 5, "Path twerk step 3");
assert_equal(memory, [3, 0], "Path twerk step 3 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 1, "Path twerk step 4");
assert_equal(memory, [0, 1], "Path twerk step 4 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 5, "Path twerk step 5");
assert_equal(memory, [1, 1], "Path twerk step 5 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 9, "Path twerk step 6");
assert_equal(memory, [2, 1], "Path twerk step 6 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 5, "Path twerk step 7");
assert_equal(memory, [3, 1], "Path twerk step 7 memory");
assert_equal(tk_path(pathArg, memory, 1, 1, 9, 1), 1, "Path twerk step 8");
assert_equal(memory, [0, 2], "Path twerk step 8 memory");
#endregion

#region Test path with angle blend
var pathArg = [pth_test_segmented, 0, -128, 4, tb_angle];
memory = [];
tk_path(pathArg, memory, 0, 350, 30, undefined);
assert_equal(memory, [0, 0], "Path angle twerk init failed");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path angle twerk step 1");
assert_equal(memory, [1, 0], "Path angle twerk step 1 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 30, "Path angle twerk step 2");
assert_equal(memory, [2, 0], "Path angle twerk step 2 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path angle twerk step 3");
assert_equal(memory, [3, 0], "Path angle twerk step 3 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 350, "Path angle twerk step 4");
assert_equal(memory, [0, 1], "Path angle twerk step 4 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path angle twerk step 5");
assert_equal(memory, [1, 1], "Path angle twerk step 5 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 30, "Path angle twerk step 6");
assert_equal(memory, [2, 1], "Path angle twerk step 6 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path angle twerk step 7");
assert_equal(memory, [3, 1], "Path angle twerk step 7 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 350, "Path angle twerk step 8");
assert_equal(memory, [0, 2], "Path angle twerk step 8 memory");
#endregion

#region Test path with wrap blend
var pathArg = [pth_test_segmented, 0, -128, 4, tb_wrap, [0, 360]];
memory = [];
tk_path(pathArg, memory, 0, 350, 30, undefined);
assert_equal(memory, [0, 0], "Path wrap twerk init failed");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path wrap twerk step 1");
assert_equal(memory, [1, 0], "Path wrap twerk step 1 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 30, "Path wrap twerk step 2");
assert_equal(memory, [2, 0], "Path wrap twerk step 2 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path wrap twerk step 3");
assert_equal(memory, [3, 0], "Path wrap twerk step 3 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 350, "Path wrap twerk step 4");
assert_equal(memory, [0, 1], "Path wrap twerk step 4 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path wrap twerk step 5");
assert_equal(memory, [1, 1], "Path wrap twerk step 5 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 30, "Path wrap twerk step 6");
assert_equal(memory, [2, 1], "Path wrap twerk step 6 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 10, "Path wrap twerk step 7");
assert_equal(memory, [3, 1], "Path wrap twerk step 7 memory");
assert_equal(tk_path(pathArg, memory, 1, 350, 30, 1), 350, "Path wrap twerk step 8");
assert_equal(memory, [0, 2], "Path wrap twerk step 8 memory");
#endregion