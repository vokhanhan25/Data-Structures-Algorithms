//*** day con co tong chia het cho S;

type long=longint;

var n, S: long;
    a, b: array[0..1000] of long;
    f: array[0..1000, 0..10000] of boolean;

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
    for j:=0 to S do f[0, j]:=false;
    for i:=0 to n do f[i, 0]:=true;

    for i:=1 to n do begin
        for j:=1 to S do begin
            f[i, j]:=f[i-1, j] or f[i-1, (j-a[i]+S) mod S];
        end;
    end;

    if not f[n, S] then writeln('NO')
    else begin
        writeln('YES');
        i:=n;
        j:=s;
        while (i<>0)and(j<>0) do begin
            if f[i-1, (j-a[i]+S) mod S] then begin
                write(b[i], ' ');
                j:=(j-a[i]+S) mod S;
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

