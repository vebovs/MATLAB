function z = ydot(t, x)
    m2 = 3, g = 1; mg2 = m2 * g; px2 = 0; py2 = 0;
    px1 = x(1); py1 = x(3); vx1 = x(2); vy1 = x(4);
    dist = sqrt((px2 - px1)^2 + (py2 - py1)^2);
    z = zeros(1, 4);
    z(1) = vx1;
    z(2) = (mg2 * (px2 - px1)) / (dist^3);
    z(3) = vy1;
    z(4) = (mg2 * (py2 - py1)) / (dist^3);
end

