function z = orbit(inter, ic1, ic2, ic3, n, p)
    h = (inter(2) - inter(1)) / n;
    
    x01 = ic1(1); vx01 = ic1(2); y01 = ic1(3); vy01 = ic1(4);
    y1(1,:) = [x01 vx01 y01 vy01];
    
    x02 = ic2(1); vx02 = ic2(2); y02 = ic2(3); vy02 = ic2(4);
    y2(1,:) = [x02 vx02 y02 vy02];
    
    x03 = ic3(1); vx03 = ic3(2); y03 = ic3(3); vy03 = ic3(4);
    y3(1,:) = [x03 vx03 y03 vy03];
    
    t = inter(1);
    set(gca, 'XLim', [-5 5], 'YLim', [-5 5], 'XTick', [-5 0 5], 'YTick', [-5 0 5], 'Drawmode', 'fast', 'Visible', 'on');
    cla;
    sun = line('color', 'y', 'Marker', '.', 'markersize', 25, 'xdata', 0, 'ydata', 0);
    drawnow;
    
    head1 = line('color', 'r', 'Marker', '.', 'markersize', 25, 'erase', 'xor', 'xdata', [], 'ydata', []);
    tail1 = line('color', 'b', 'LineStyle', '-', 'erase', 'none', 'xdata', [], 'ydata', []);
    head2 = line('color', 'r', 'Marker', '.', 'markersize', 25, 'erase', 'xor', 'xdata', [], 'ydata', []);
    tail2 = line('color', 'b', 'LineStyle', '-', 'erase', 'none', 'xdata', [], 'ydata', []);
    head3 = line('color', 'r', 'Marker', '.', 'markersize', 25, 'erase', 'xor', 'xdata', [], 'ydata', []);
    tail3 = line('color', 'b', 'LineStyle', '-', 'erase', 'none', 'xdata', [], 'ydata', []);
    
    for k = 1 : n / p
        for i = 1 : p
            t(i + 1) = t(i) + h;
            y1(i + 1, :) = eulerstep(t(i), y1(i, :), h);
            y2(i + 1, :) = eulerstep(t(i), y2(i, :), h);
            y3(i + 1, :) = eulerstep(t(i), y3(i, :), h);
        end
        y1(1, :) = y1(p + 1, :); t(1) = t(p + 1);
        set(head1, 'xdata', y1(1, 1), 'ydata', y1(1, 3));
        set(tail1, 'xdata', y1(2 : p, 1), 'ydata', y1(2 : p, 3));
        
        y2(1, :) = y2(p + 1, :); t(1) = t(p + 1);
        set(head2, 'xdata', y2(1, 1), 'ydata', y2(1, 3));
        set(tail2, 'xdata', y2(2 : p, 1), 'ydata', y2(2 : p, 3));
       
        y3(1, :) = y3(p + 1, :); t(1) = t(p + 1);
        set(head3, 'xdata', y3(1, 1), 'ydata', y3(1, 3));
        set(tail3, 'xdata', y3(2 : p, 1), 'ydata', y3(2 : p, 3));

        drawnow;
    end
end

