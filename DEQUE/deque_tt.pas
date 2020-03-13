var
        f: text;
        n, i, k, last, first, t, tt: longint;
        a, dq: array[0..1700] of longint;

BEGIN
        assign(f, 'VNOI_MINK.INP'); reset(f);
        read(f, t);
        for tt := 1 to t do
        begin
                read(f, n, k);
                for i := 1 to n do read(f, a[i]);

                //Xu li k so dau tien
                last := 0; dq[last] := 0; a[0] := 0; first := 1;
                for i := 1 to k do
                begin
                        while a[i] <= a[dq[last]] do last := last - 1;
                        last := last + 1;
                        dq[last] := i;
                end;
                write(a[dq[first]], ' ');
                for i := k + 1 to n do
                begin
                        while a[i] <= a[dq[last]] do last := last - 1;
                        last := last + 1;
                        dq[last] := i;
                        while dq[first] < i - k + 1 do begin dq[first] := 0; first := first + 1; end;
                        write(a[dq[first]], ' ');
                end;
                writeln;
        end;
        close(f); readln;
END.
