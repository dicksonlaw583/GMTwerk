///@func te_elastic_inout(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;
    
    var s = 1.70158;
    
    t /= 1/2;
    
    if (t == 0) {
        return b;
    }
    if (t == 2) {
        return b+c;
    }
    
    var p = 1*(0.6*1.5); //Original is 0.3 => Modified to 0.6
    var a = c;
    if (a < abs(c)) {
        a = c;
        s = p/4;
    }
    else {
        s = (p/(2*pi)) * arcsin(c/a);
    }
    
    t -= 1;
    if (t < 0) {
        return -0.5*(a*power(2,10*t) * sin( (t*1-s)*(2*pi)/p )) + b;
    }
    else {
        return a*power(2,-10*t) * sin( (t*1-s)*(2*pi)/p )*0.5 + c + b;
    }
}
