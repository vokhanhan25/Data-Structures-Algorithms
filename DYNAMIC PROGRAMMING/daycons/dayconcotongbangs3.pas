//*** so day con co tong bang S

type long=longint;

var n, S: long;
    a: array[0..1000] of long;
    f: array[0..1000, 0..10000] of long;

procedure nhap;
var f: text;
begin
    assign(f, 'a.inp');
    reset(f);
    readln(f, S);
    n:=0;
    while not eoln(f) do begin
        n:=n+1;
        read(f, a[n]);
    end;
    close(f);
end;

procedure nhap1;
var i: long;
begin
    n:=100;S:=n;
    for i:=1 to n do a[i]:=i;
end;

procedure xl; //*** chon 1 lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=0;
    for i:=0 to n do f[i, 0]:=1;

    for i:=1 to n do begin
        for j:=1 to S do begin
            if j-a[i]<0 then f[i, j]:=f[i-1, j]
            else f[i, j]:=f[i-1, j]+f[i-1, j-a[i]];
        end;
    end;

    writeln(f[n, S]);
end;

procedure xl1; //*** chon nhieu lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=0;
    for i:=0 to n do f[i, 0]:=1;

    for i:=1 to n do begin
        for j:=1 to S do begin
            if j-a[i]<0 then f[i, j]:=f[i-1, j]
            else f[i, j]:=f[i-1, j]+f[i, j-a[i]];
        end;
    end;

    writeln(f[n, S]);
end;

begin
nhap;
xl;
end.