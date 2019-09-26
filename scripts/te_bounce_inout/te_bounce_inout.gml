///@func te_bounce_inout(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;

    if (t < 1/2) {
        return te_bounce_in(b, b+c/2, 2*t)
    }
    else {
        return te_bounce_out(b+c/2, b+c, 2*(t-0.5));
    }
}
