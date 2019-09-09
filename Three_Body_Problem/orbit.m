function z = orbit(inter, ic, n, p)
    h = (inter(2) - inter(1)) / n;
    x0 = ic(1); vx0 = ic(2); y0 = ic(3); vy0 = ic(4);
    y(1,:) = [x0 vx0 y0 vy0]; t = inter(1);
    set(gca, 'XLim', [-5 5], 'YLim', [-5 5], 'XTick', [-5 0 5], 'YTick', [-5 0 5], 'Drawmode', 'fast', 'Visible', 'on');
    cla;
    sun = line('color', 'y', 'Marker', '.', 'markersize', 25, 'xdata', 0, 'ydata', 0);
    drawnow;
    head = line('color', 'r', 'Marker', '.', 'markersize', 25, 'erase', 'xor', 'xdata', [], 'ydata', []);
    tail = line('color', 'b', 'LineStyle', '-', 'erase', 'none', 'xdata', [], 'ydata', []);
    for k = 1 : n / p
        for i = 1 : p
            t(i + 1) = t(i) + h;
            y(i + 1, :) = eulerstep(t(i), y(i, :), h);
        end
        y(1, :) = y(p + 1, :); t(1) = t(p + 1);
        set(head, 'xdata', y(1, 1), 'ydata', y(1, 3));
        set(tail, 'xdata', y(2 : p, 1), 'ydata', y(2 : p, 3));
        drawnow;
    end
end
