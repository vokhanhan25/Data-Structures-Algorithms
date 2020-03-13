Uses    math;
Var
        fi, fo : text;
        l1, l2, l3, c1, c2, c3 : int64;
        a : array[0..100000] of int64;
        n, i, s, t, j : longint;
        f : array[0..100000] of int64;
function    timtc(x : int64; l, r : longint) : longint;
var
        d, c, m, tam : longint;
begin
        d := l; c := r; tam := -1;
        while d <= c do begin
                m := (d + c) div 2;
                if a[r] - a[m] <= x then tam := m;
                if a[r] - a[m] <= x then c := m - 1 else d := m + 1;
        end;
        exit(tam);
end;
procedure   solve;
begin
        readln(fi, l1, l2, l3, c1, c2, c3);
        readln(fi, n);
        readln(fi, s, t);
        for i := 2 to n do readln(fi, a[i]);
        f[s] := 0;
        for i := s+1 to t do begin
                f[i] := (i - s) * c3;
                j := timtc(l1, s, i);
                if j <> -1 then f[i] := min(f[i], f[j] + c1);
                j := timtc(l2, s, i);
                if j <> -1 then f[i] := min(f[i], f[j] + c2);
                j := timtc(l3, s, i);
                if j <> -1 then f[i] := min(f[i], f[j] + c3);
        end;
        writeln(fo, f[t]);
end;
BEGIN
        assign(fi, ''); reset(fi);
        assign(fo, ''); rewrite(fo);
                solve;
        close(fi); close(fo);
END.
