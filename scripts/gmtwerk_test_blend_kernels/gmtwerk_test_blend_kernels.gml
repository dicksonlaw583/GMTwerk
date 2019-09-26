///@func gmtwerk_test_blend_kernels()

// RGB kernel
assert_equal(tb_rgb(make_color_rgb(255, 255, 255), make_color_rgb(127, 127, 127), undefined, undefined), 128);
assert_equal(tb_rgb(make_color_rgb(255, 255, 255), make_color_rgb(127, 127, 127), undefined, 0.5), make_color_rgb(191, 191, 191));

// HSV kernel
assert_equal(tb_hsv(c_red, c_lime, undefined, undefined), 85);
assert_equal(tb_hsv(c_red, c_lime, undefined, 0.5), make_color_rgb(255, 252, 0));

// Angle kernel
assert_equal(tb_angle(45, 65, undefined, undefined), 20);
assert_equal(tb_angle(20, 340, undefined, undefined), 40);
assert_equal(tb_angle(340, 20, undefined, undefined), 40);
assert_equal(tb_angle(45, 65, undefined, 0.75), 60);
assert_equal(tb_angle(20, 340, undefined, 0.75), 350);
assert_equal(tb_angle(340, 20, undefined, 0.75), 10);

// Wrap kernel
assert_equal(tb_wrap(1, 3, [0, 10], undefined), 2);
assert_equal(tb_wrap(95, 3, [0, 100], undefined), 8);
assert_equal(tb_wrap(3, 95, [0, 100], undefined), 8);
assert_equal(tb_wrap(1, 3, [0, 10], 0.5), 2);
assert_equal(tb_wrap(95, 3, [0, 100], 0.5), 99);
assert_equal(tb_wrap(3, 95, [0, 100], 0.5), 99);