///@func gmtwerk()
//IMPORTANT: If this script is modified, please also modify __gmtwerk_host__ Create event to match!

enum GMTWERK_STATE {
	ACTIVE = 1,
	INACTIVE = 0,
	DONE = -1,
	INTERRUPTED = -2,
	LOST = -3
}

// Mark this instance as a GMTwerk host
__gmtwerk__ = [];
