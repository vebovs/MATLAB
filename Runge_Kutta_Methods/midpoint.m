function midpoint()
    init = 0;
    y = @(t) exp((t^3)/3);
    f = @(t, y) t^2 * y;
    y0 = y(init);
    w0 = y0;
    h = 0.1;
    n = 1/h;
    w(1) = w0;
    ex(1) = y0;
    t(1) = 0;
    error(1) = abs(w(1) - ex(1));
    for i = 1 : n
       t(i + 1) = h * i;
       w(i + 1) = w(i) + h*f(t(i) + h/2, w(i) + (h/2)*f(t(i), w(i)));
       ex(i + 1) = y(t(i + 1));
       error(i + 1) = abs(w(i + 1) - ex(i + 1)); 
    end
    disp('t');
    disp(t);
    disp('w');
    disp(w);
    disp('y');
    disp(ex);
    disp('w - y');
    disp(error);
end

