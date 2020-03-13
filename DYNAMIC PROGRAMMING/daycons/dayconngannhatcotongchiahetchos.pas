//*** day con ngan nhat co tong chia het cho S 

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

function min(a, b: long): long;
begin
    if b=1 then b:=1000000;
    min:=a;
    if min>b then min:=b;
end;

procedure xl;   //*** moi so duoc chon 1 lan
var i, j: long;
begin
    for j:=0 to S do f[0, j]:=100000;
    for i:=0 to n do f[i, 0]:=1;

    for i:=1 to n do begin
        for j:=1 to S do begin
            f[i, j]:=min(f[i-1, j], f[i-1, (j-a[i]+S) mod S]+1);
        end;
    end;

    if f[n, S]=0 then writeln('NO')
    else begin
        writeln('YES');
        i:=n;
        j:=S;
        while (i<>0)and(j<>0) do begin
                if f[i-1, j]<f[i-1, (j-a[i]+S) mod S] + 1 then begin
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

