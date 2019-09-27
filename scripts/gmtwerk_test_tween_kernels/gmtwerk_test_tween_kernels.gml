///@func gmtwerk_test_tween_kernels()

var memory, expected;

// Normal kernel with plain equation
memory = [];
expected = [0];
tn_normal([te_linear, 2], memory, 0, 50, 100, undefined);
assert_equal(memory, expected, "Normal tween failed to set up memory");
assert_equal(tn_normal([te_linear, 2], memory, 1, 50, 100, 1), 75, "Normal tween step 1 failed");
assert_fail(tn_normal([te_linear, 2], memory, 2, 50, 100, undefined), "Normal tween step 1 shouldn't be finished yet");
assert_equal(tn_normal([te_linear, 2], memory, 1, 50, 100, 1), 100, "Normal tween step 2 failed");
assert(tn_normal([te_linear, 2], memory, 2, 50, 100, undefined), "Normal tween step 2 should be finished");

// Normal kernel with blend equation
memory = [];
expected = [0];
tn_normal([te_linear, 2, tb_angle], memory, 0, 10, 350, undefined);
assert_equal(memory, expected, "Normal blend tween failed to set up memory");
assert_equal(tn_normal([te_linear, 2, tb_angle], memory, 1, 10, 350, 1), 0, "Normal blend tween step 1 failed");
assert_fail(tn_normal([te_linear, 2, tb_angle], memory, 2, 10, 350, undefined), "Normal blend tween step 1 shouldn't be finished yet");
assert_equal(tn_normal([te_linear, 2, tb_angle], memory, 1, 10, 350, 1), 350, "Normal blend tween step 2 failed");
assert(tn_normal([te_linear, 2, tb_angle], memory, 2, 10, 350, undefined), "Normal blend tween step 2 should be finished");

// Pathed kernel with plain equation
memory = [];
expected = [0];
tn_path([pth_test_linear, 0, 32, 2], memory, 0, 50, 100, undefined);
assert_equal(memory, expected, "Pathed tween failed to set up memory");
assert_equal(tn_path([pth_test_linear, 0, 32, 2], memory, 1, 50, 100, 1), 75, "Pathed tween step 1 failed");
assert_fail(tn_path([pth_test_linear, 0, 32, 2], memory, 2, 50, 100, undefined), "Pathed tween step 1 shouldn't be finished yet");
assert_equal(tn_path([pth_test_linear, 0, 32, 2], memory, 1, 50, 100, 1), 100, "Pathed tween step 2 failed");
assert(tn_path([pth_test_linear, 0, 32, 2], memory, 2, 50, 100, undefined), "Pathed tween step 2 should be finished");

// Pathed kernel with blend equation
memory = [];
expected = [0];
tn_path([pth_test_linear, 0, 32, 2, tb_angle], memory, 0, 10, 350, undefined);
assert_equal(memory, expected, "Pathed blend tween failed to set up memory");
assert_equal(tn_path([pth_test_linear, 0, 32, 2, tb_angle], memory, 1, 10, 350, 1), 0, "Pathed blend tween step 1 failed");
assert_fail(tn_path([pth_test_linear, 0, 32, 2, tb_angle], memory, 2, 10, 350, undefined), "Pathed blend tween step 1 shouldn't be finished yet");
assert_equal(tn_path([pth_test_linear, 0, 32, 2, tb_angle], memory, 1, 10, 350, 1), 350, "Pathed blend tween step 2 failed");
assert(tn_path([pth_test_linear, 0, 32, 2, tb_angle], memory, 2, 10, 350, undefined), "Pathed blend tween step 2 should be finished");

// Snap kernel
memory = [];
expected = [false];
tn_snap(undefined, memory, 0, 4, 6, undefined);
assert_equal(memory, expected, "Snap tween failed to set up memory");
assert_equal(tn_snap(undefined, memory, 1, 4, 6, 1), 6, "Snap tween failed to go to target");
assert(tn_snap(undefined, memory, 2, 4, 6, undefined), "Snap tween failed to finish immediately");

// Zenos kernel with plain rate
memory = [];
expected = [6];
tn_zenos([0.5, 1], memory, 0, 6, 8, undefined);
assert_equal(memory, expected, "Zenos tween failed to set up memory");
assert_equal(tn_zenos([0.5, 1], memory, 1, 6, 8, 1), 7, "Zenos tween step 1 failed");
assert_fail(tn_zenos([0.5, 1], memory, 2, 6, 8, undefined), "Zenos tween step 1 shouldn't be finished yet");
assert_equal(tn_zenos([0.5, 1], memory, 1, 6, 8, 1), 8, "Zenos tween step 2 failed");
assert(tn_zenos([0.5, 1], memory, 2, 6, 8, undefined), "Zenos tween step 2 should be finished");

// Zenos kernel with blended rate
memory = [];
expected = [359];
tn_zenos([0.5, 1, [tb_wrap, [0, 360]]], memory, 0, 359, 1, undefined);
assert_equal(memory, expected, "Zenos blended tween failed to set up memory");
assert_equal(tn_zenos([0.5, 1, [tb_wrap, [0, 360]]], memory, 1, 359, 1, 1), 0, "Zenos blended tween step 1 failed");
assert_fail(tn_zenos([0.5, 1, [tb_wrap, [0, 360]]], memory, 2, 359, 1, undefined), "Zenos blended tween step 1 shouldn't be finished yet");
assert_equal(tn_zenos([0.5, 1, [tb_wrap, [0, 360]]], memory, 1, 359, 1, 1), 1, "Zenos blended tween step 2 failed");
assert(tn_zenos([0.5, 1, [tb_wrap, [0, 360]]], memory, 2, 359, 1, undefined), "Zenos blended tween step 2 should be finished");

// Fixed with plain rate
memory = [];
expected = [6];
tn_fixed(1, memory, 0, 6, 8, undefined);
assert_equal(memory, expected, "Fixed rate failed to set up memory");
assert_equal(tn_fixed(1, memory, 1, 6, 8, 1), 7, "Fixed rate step 1 failed");
assert_fail(tn_fixed(1, memory, 2, 6, 8, undefined), "Fixed rate step 1 shouldn't be finished yet");
assert_equal(tn_fixed(1, memory, 1, 6, 8, 1), 8, "Fixed rate step 2 failed");
assert(tn_fixed(1, memory, 2, 6, 8, undefined), "Fixed rate step 2 should be finished");

// Fixed with blended rate
memory = [];
expected = [359];
tn_fixed([1, [tb_wrap, [0, 360]]], memory, 0, 359, 1, undefined);
assert_equal(memory, expected, "Fixed rate blend failed to set up memory");
assert_equalish(tn_fixed([1, [tb_wrap, [0, 360]]], memory, 1, 359, 1, 1), 0, "Fixed rate blend step 1 failed");
assert_fail(tn_fixed([1, [tb_wrap, [0, 360]]], memory, 2, 359, 1, undefined), "Fixed rate blend step 1 shouldn't be finished yet");
assert_equal(tn_fixed([1, [tb_wrap, [0, 360]]], memory, 1, 359, 1, 1), 1, "Fixed rate blend step 2 failed");
assert(tn_fixed([1, [tb_wrap, [0, 360]]], memory, 2, 359, 1, undefined), "Fixed rate blend step 2 should be finished");

// Flex rate
memory = [];
expected = [6];
tn_flex([1, 3], memory, 0, 6, 11, undefined);
assert_equal(memory, expected, "Flex rate failed to set up memory");
assert_equal(tn_flex([1, 3], memory, 1, 6, 11, 1), 9, "Flex rate step 1 failed");
assert_fail(tn_flex([1, 3], memory, 2, 6, 11, undefined), "Flex rate step 1 shouldn't be finished yet");
assert_equal(tn_flex([1, 3], memory, 1, 6, 11, 1), 10, "Flex rate step 2 failed");
assert_fail(tn_flex([1, 3], memory, 2, 6, 11, undefined), "Flex rate step 2 shouldn't be finished yet");
assert_equal(tn_flex([1, 3], memory, 1, 6, 11, 1), 11, "Flex rate step 3 failed");
assert(tn_flex([1, 3], memory, 2, 6, 11, undefined), "Flex rate step 3 should be finished");

// Flex rate with blend
memory = [];
expected = [357];
tn_flex([[1, 3], tb_angle], memory, 0, 357, 2, undefined);
assert_equal(memory, expected, "Flex blend failed to set up memory");
assert_equalish(tn_flex([[1, 3], tb_angle], memory, 1, 357, 2, 1), 0, "Flex blend step 1 failed");
assert_fail(tn_flex([[1, 3], tb_angle], memory, 2, 357, 2, undefined), "Flex blend step 1 shouldn't be finished yet");
assert_equalish(tn_flex([[1, 3], tb_angle], memory, 1, 357, 2, 1), 1, "Flex blend step 2 failed");
assert_fail(tn_flex([[1, 3], tb_angle], memory, 2, 357, 2, undefined), "Flex blend step 2 shouldn't be finished yet");
assert_equal(tn_flex([[1, 3], tb_angle], memory, 1, 357, 2, 1), 2, "Flex blend step 3 failed");
assert(tn_flex([[1, 3], tb_angle], memory, 2, 357, 2, undefined), "Flex blend step 3 should be finished");
