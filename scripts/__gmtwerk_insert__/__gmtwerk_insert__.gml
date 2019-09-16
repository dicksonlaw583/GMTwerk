///@func __gmtwerk_insert__(actor, forceHelper)

// Find the insertion target
var insertTarget;
var useHost = argument1 || !variable_instance_exists(id, "__gmtwerk__");

if (useHost) {
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

// If the host is used, also insert the current instance ID into its __gmtwerk_owner__
// When there is no instance ID (e.g. running from Room Creation Code), insert __gmtwerk_host__ to make sure it never gets lost
if (useHost) {
	__gmtwerk_host__.__gmtwerk_owner__[@ i] = id ? id : __gmtwerk_host__;
}
