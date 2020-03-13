//*** day con co tong bang S

type long=longint;

var n, S: long;
    a: array[0..1000] of long;
    f: array[0..1000, 0..100000] of boolean;


procedure nhap;
var f: text;
begin
    assign(f, 'a.inp');
    reset(f);
    readln(f, S);
    n:=0;
    a[0]:=0;
    while not eoln(f) do begin
        n:=n+1;
        read(f, a[n]);
    end;
    close(f);
end;

procedure xl1;   //*** moi so duoc chon nhieu lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=false;
    for i:=0 to n do f[i, 0]:=true;

    for i:=1 to n do begin
        for j:=1 to S do begin
            if j-a[i]<0 then f[i, j]:=f[i-1, j]
            else f[i, j]:=f[i-1, j] or f[i, j-a[i]];
        end;
    end;

    if not f[n, S] then writeln('NO')
    else begin
        writeln('YES');
        i:=n;
        j:=S;
        while (i<>0)and(j<>0) do begin
            if j-a[i]<0 then begin
                i:=i-1;
            end else if f[i, j-a[i]] then begin
                write(a[i], ' ');
                j:=j-a[i];
            end else begin
                i:=i-1;
            end;
        end;
    end;
end;

procedure xl;   //*** moi so duoc chon 1 lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=false;
    for i:=0 to n do f[i, 0]:=true;

    for i:=1 to n do begin
        for j:=1 to S do begin
            if j-a[i]<0 then f[i, j]:=f[i-1, j]
            else f[i, j]:=f[i-1, j] or f[i-1, j-a[i]];
        end;
    end;

    if not f[n, S] then writeln('NO')
    else begin
        writeln('YES');
        i:=n;
        j:=S;
        while (i<>0)and(j<>0) do begin
            if j-a[i]<0 then begin
                i:=i-1;
            end else if f[i-1, j-a[i]] then begin
                write(a[i], ' ');
                j:=j-a[i];
                i:=i-1;
            end else begin
                i:=i-1;
            end;
        end;
    end;
end;

begin
    nhap;
    xl;
end.

