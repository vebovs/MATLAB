tic
disp("EULER'S METHOD");
eulers_method(0.1, 0, 1, 1, @(t, w) t^2*w, @(t) exp(t^3/3))
disp("EXPLICIT TRAPEZOID METHOD");
explicit_trapezoid_method(0.1, 0, 1, 1, @(t, w) t, @(t) t^2/2 + 1);
toc