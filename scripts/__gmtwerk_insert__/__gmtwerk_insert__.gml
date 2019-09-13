///@func __gmtwerk_insert__(actor, forceHelper)

// Find the insertion target
var insertTarget;
if (argument1 || !variable_instance_exists(id, "__gmtwerk__")) {
	if (!instance_exists(__gmtwerk_host__)) {
		instance_create_depth(0, 0, 0, __gmtwerk_host__);
	}
	insertTarget = __gmtwerk_host__.__gmtwerk__;
} else {
	insertTarget = __gmtwerk__;
}

// Insert into first undefined or at end
var twerkCount = array_length_1d(insertTarget);
for (var i = 0; i < twerkCount; i++) {
	if (is_undefined(insertTarget[i])) break;
}
insertTarget[@ i] = argument0;
