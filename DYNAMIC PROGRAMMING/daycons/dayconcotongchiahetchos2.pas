//*** so day con co tong chia het cho S;

type long=longint;

var n, S: long;
    a, b: array[0..1000] of long;
    f: array[0..1000, 0..10000] of long;

procedure nhap;
var f: text;
begin
    assign(f, 'a.inp');
    reset(f);
    readln(f, S);
    while not eoln(f) do begin
        n:=n+1;
        read(f, b[n]);
        a[n]:=b[n] mod S;
    end;
    close(f);
end;

procedure xl;
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=0;
    for i:=0 to n do f[i, 0]:=1;

    for i:=1 to n do begin
        for j:=1 to S do begin
            f[i, j]:=f[i-1, j] + f[i-1, (j-a[i]+S) mod S];
            if ((j-a[i]+S) mod S = 0)and(j=S)  then begin
                f[i, j]:=f[i, j]+f[i-1, j];
            end;
        end;
    end;

    writeln(f[n, S]);
end;

begin
    nhap;
    xl;
end.

