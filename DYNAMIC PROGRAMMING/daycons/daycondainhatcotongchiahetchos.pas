//*** day con dai nhat co tong chia het cho S

type long=longint;

var n, S: long;
    a, b: array[0..1000] of long;
    f: array[0..1000, 0..100000] of long;


procedure nhap;
var f: text;
begin
    assign(f, 'a.inp');
    reset(f);
    readln(f, S);
    n:=0;
    a[0]:=0;
    b[0]:=0;
    while not eoln(f) do begin
        n:=n+1;
        read(f, b[n]);
        a[n]:=b[n] mod S;
    end;
    close(f);
end;

function max(a, b: long): long;
begin
    if b=1 then b:=0;
    max:=a;
    if max<b then max:=b;
end;

procedure xl;   //*** moi so duoc chon 1 lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=0;
    for i:=0 to n do f[i, 0]:=1;

    for i:=1 to n do begin
        for j:=1 to S do begin
            f[i, j]:=max(f[i-1, j], f[i-1, (j-a[i]+S) mod S]+1);
            if ((j-a[i]+S) mod S=0)and(j=S) then begin
                f[i, j]:=max(f[i, j], f[i-1, j]+1);
            end;
        end;
    end;

    for i:=0 to n do begin
        for j:=0 to S do write(f[i, j], ' ');
        writeln;
    end;

    if f[n, S]=0 then writeln('NO')
    else begin
        writeln('YES');
        i:=n;
        j:=S;
        while (i<>0)and(j<>0) do begin
                if ((j-a[i]+S) mod S=0)and(j=S) then begin
                        write(b[i], ' ');
                        i:=i-1;
                end else if f[i-1, j]>f[i-1, (j-a[i]+S) mod S] + 1 then begin
                        i:=i-1;
                end else begin
                        write(b[i], ' ');
                        j:=(j-a[i]+S) mod S;
                        i:=i-1;
                end;
        end;
    end;
end;

begin
    nhap;
    xl;
end.

