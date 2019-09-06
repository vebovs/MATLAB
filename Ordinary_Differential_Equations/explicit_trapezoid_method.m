function explicit_trapezoid_method(h, a, b, y0, dy, f)
    steps = (b - a) / h;
    t = zeros(1, steps + 1);
    w = zeros(1, steps + 1);
    y = zeros(1, steps + 1);
    e = zeros(1, steps + 1);
    w(1) = y0;
    t(1) = a;
    for i = 1 : steps
       t(i + 1) = h * i; 
    end
    for i = 1 : steps
        w(i + 1) = w(i) + h/2 * (dy(t(i), w(i)) + dy(t(i) + h, w(i) + h * dy(t(i), w(i))));
    end
    for i = 1 : steps + 1
       y(i) = f(t(i)); 
    end
    for i = 1 : steps + 1
        if abs(w(i) - y(i)) > 0.00001
           e(i) =  abs(w(i) - y(i)); 
        end
    end
    disp("t");
    disp(t);
    disp("w");
    disp(w);
    disp("error");
    disp(e);
end

